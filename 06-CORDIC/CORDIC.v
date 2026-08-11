module cordic #(
    parameter N = 5
)(
    input  wire               clk,
    input  wire               rst_n,
    input  wire signed [15:0] x_start,  // Kn scaling factor (Q1.15) 
    input  wire signed [15:0] y_start,  // Initial Y (0 for sin/cos) 
    input  wire signed [15:0] z,        // Angle input
    output reg  signed [16:0] cosine, // Range from -1 to 1 so i need 17 bit 2 int and 15 frac
    output reg  signed [16:0] sine
);

    reg [4:0] count;
    
    // Arrays sized for N+1 entries (0 to N) to hold initial and N intermediate states
    reg signed [16:0] x_arr [0:N];
    reg signed [16:0] y_arr [0:N];
    reg signed [16:0] z_arr [0:N];

    localparam signed [16:0] LUT_ATAN [0:15] = '{
        17'h16C0, 17'h0D6B, 17'h0712, 17'h0397,
        17'h01CD, 17'h00E6, 17'h0073, 17'h003A,
        17'h001D, 17'h000F, 17'h0007, 17'h0004,
        17'h0002, 17'h0001, 17'h0000, 17'h0000
    };

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            cosine   <= 17'sd0;
            sine     <= 17'sd0;
            count    <= 5'd0;
            //x_arr[0] <= x_start;
           // y_arr[0] <= y_start;
            //z_arr[0] <= z;
            x_arr[0] <= {x_start[15], x_start};
            y_arr[0] <= {y_start[15], y_start};
            z_arr[0] <= {z[15], z};
        end else begin
            if (count < N) begin
                // Evaluate MSB (sign bit) of current accumulated z_arr stage
                if (z_arr[count][16] == 1'b0) begin
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
            cosine <= x_arr[N];
            sine   <= y_arr[N];
            end
        end
    end

endmodule