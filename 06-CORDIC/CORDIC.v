module cordic #(
    parameter N = 32
)(
    input  wire               clk,
    input  wire               rst_n,
    input  wire signed [31:0] x_start,  // Kn scaling factor (Q2.30 or Q3.29)
    input  wire signed [31:0] y_start,  // Initial Y (0 for sin/cos) 
    input  wire signed [31:0] z,        // Angle input (Q3.29 in Radians)
    output reg  signed [32:0] cosine,   // 33-bit Q2.30 / Q3.29 Output
    output reg  signed [32:0] sine
);

    reg [5:0] count;
    
    // Arrays sized for N+1 entries to hold intermediate states
    reg signed [32:0] x_arr [0:N];
    reg signed [32:0] y_arr [0:N];
    reg signed [32:0] z_arr [0:N];

    // Internal quadrant management registers
    reg signed [31:0] z_mapped;
    reg               quadrant_flag;

    localparam signed [31:0] PI_OVER_2     = 32'h3243F6A9; // Q3.29
    localparam signed [31:0] NEG_PI_OVER_2 = 32'hCDBC0957; // Q3.29
    localparam signed [31:0] PI             = 32'h6487ED51; // Q3.29

    // Corrected 32-bit Q3.29 ATAN LUT
    localparam signed [31:0] LUT_ATAN [0:31] = '{
        32'h1921FB54, 32'h0ED66383, 32'h07D6DD7E, 32'h03FAB753,
        32'h01FF55BB, 32'h00FFEAAE, 32'h007FFD55, 32'h003FFFAB,
        32'h001FFFF5, 32'h000FFFFF, 32'h00080000, 32'h00040000,
        32'h00020000, 32'h00010000, 32'h00008000, 32'h00004000,
        32'h00002000, 32'h00001000, 32'h00000800, 32'h00000400,
        32'h00000200, 32'h00000100, 32'h00000080, 32'h00000040,
        32'h00000020, 32'h00000010, 32'h00000008, 32'h00000004,
        32'h00000002, 32'h00000001, 32'h00000000, 32'h00000000
    };

    // Combinational Quadrant Mapping Logic
    always @(*) begin
        if (z > PI_OVER_2) begin
            z_mapped      = z - PI;
            quadrant_flag = 1'b1;
        end else if (z < NEG_PI_OVER_2) begin
            z_mapped      = z + PI;
            quadrant_flag = 1'b1;
        end else begin
            z_mapped      = z;
            quadrant_flag = 1'b0;
        end
    end

    // Clocked Sequential CORDIC Engine
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            cosine   <= 33'sd0;
            sine     <= 33'sd0;
            count    <= 6'd0;
            
            // Correct 33-bit Sign Extension from 32-bit Inputs
            x_arr[0] <= {x_start[31], x_start};
            y_arr[0] <= {y_start[31], y_start};
            z_arr[0] <= {z_mapped[31], z_mapped};
        end else begin
            if (count < N) begin
                // Evaluate MSB (sign bit) of current accumulated z_arr stage
                if (z_arr[count][32] == 1'b0) begin
                    x_arr[count+1] <= x_arr[count] - (y_arr[count] >>> count);
                    y_arr[count+1] <= y_arr[count] + (x_arr[count] >>> count);
                    z_arr[count+1] <= z_arr[count] - LUT_ATAN[count];
                end else begin
                    x_arr[count+1] <= x_arr[count] + (y_arr[count] >>> count);
                    y_arr[count+1] <= y_arr[count] - (x_arr[count] >>> count);
                    z_arr[count+1] <= z_arr[count] + LUT_ATAN[count];
                end
                count <= count + 1'b1;
            end else begin
            /*    // Cosine Saturation (Positive & Negative Bounds)
            if ($signed(x_arr[N]) > 17'sd32767)
                cosine <= 16'sh7FFF;
            else if ($signed(x_arr[N]) < -17'sd32768)
                cosine <= 16'sh8000;
            else
                cosine <= x_arr[N][15:0];

            // Sine Saturation (Positive & Negative Bounds)
            if ($signed(y_arr[N]) > 17'sd32767)
                sine <= 16'sh7FFF;
            else if ($signed(y_arr[N]) < -17'sd32768)
                sine <= 16'sh8000;
            else
                sine <= y_arr[N][15:0];
            end */
            if(quadrant_flag)
            begin
            cosine <= -x_arr[N];
            sine   <= -y_arr[N];
            end
            else
            begin
            cosine <= x_arr[N];
            sine   <= y_arr[N];
            end
            
            end
        end
    end

endmodule
