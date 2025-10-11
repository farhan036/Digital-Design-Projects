module ALU_16B (
    input  wire             CLK,
    input  wire             RST,
    input  wire [7:0]       A ,
    input  wire [7:0]       B ,
    input  wire             EN ,
    input  wire [3:0]       ALU_FUN ,
    output reg  [15:0]       ALU_OUT,
    output reg              OUT_VALID
);

    reg [15:0]  ALU_OUT_COMP;
    reg        OUT_VALID_COMP;

    // Sequential block: register outputs
    always @(posedge CLK or negedge RST) 
    begin
        if(!RST)
        begin
        ALU_OUT    <= 'b0;
        OUT_VALID  <= 'b0;
        end
        else
        begin
        ALU_OUT    <= ALU_OUT_COMP;
        OUT_VALID  <= OUT_VALID_COMP;   
        end
        
    end

    // Combinational block: ALU functionality
    always @(*) begin
        OUT_VALID_COMP = 1'b0;
        ALU_OUT_COMP   = 16'd0;

        if (EN) begin
            case (ALU_FUN)
                4'b0000: begin
                    ALU_OUT_COMP   = A + B;        // Arithmetic: Addition
                    OUT_VALID_COMP = 1'b1;
                end

                4'b0001: begin
                    ALU_OUT_COMP   = A - B;        // Arithmetic: Subtraction
                    OUT_VALID_COMP = 1'b1;
                end

                4'b0010: begin
                    ALU_OUT_COMP   = A * B;        // Arithmetic: Multiplication
                    OUT_VALID_COMP = 1'b1;
                end

                4'b0011: begin
                    OUT_VALID_COMP = 1'b1;
                    if (B != 16'd0)                // Prevent divide-by-zero
                        ALU_OUT_COMP = A / B;      // Arithmetic: Division
                    else
                        ALU_OUT_COMP = 16'd0;
                end

                4'b0100: begin
                    ALU_OUT_COMP   = A & B;        // Logic: AND
                    OUT_VALID_COMP = 1'b1;
                end

                4'b0101: begin
                    ALU_OUT_COMP   = A | B;        // Logic: OR
                    OUT_VALID_COMP = 1'b1;
                end

                4'b0110: begin
                    ALU_OUT_COMP   = ~(A & B);     // Logic: NAND
                    OUT_VALID_COMP = 1'b1;
                end

                4'b0111: begin
                    ALU_OUT_COMP   = ~(A | B);     // Logic: NOR
                    OUT_VALID_COMP = 1'b1;
                end

                4'b1000: begin
                    ALU_OUT_COMP   = A ^ B;        // Logic: XOR
                    OUT_VALID_COMP = 1'b1;
                end

                4'b1001: begin
                    ALU_OUT_COMP   = ~(A ^ B);     // Logic: XNOR
                    OUT_VALID_COMP = 1'b1;
                end

                4'b1010: begin
                    ALU_OUT_COMP   = (A == B) ? 16'd1 : 16'd0;  // CMP: Equal
                    OUT_VALID_COMP = 1'b1;
                end

                4'b1011: begin
                    ALU_OUT_COMP   = (A > B) ? 16'd2 : 16'd0;   // CMP: Greater
                    OUT_VALID_COMP = 1'b1;
                end

                4'b1100: begin
                    ALU_OUT_COMP   = (A < B) ? 16'd3 : 16'd0;   // CMP: Less
                    OUT_VALID_COMP = 1'b1;
                end

                4'b1101: begin
                    ALU_OUT_COMP   = A >> 1;       // Shift right by 1
                    OUT_VALID_COMP = 1'b1;
                end

                4'b1110: begin
                    ALU_OUT_COMP   = A << 1;       // Shift left by 1
                    OUT_VALID_COMP = 1'b1;
                end

                default: begin
                    ALU_OUT_COMP   = 16'b0;
                    OUT_VALID_COMP = 1'b0;
                end
            endcase
        end
        else begin
            ALU_OUT_COMP   = 16'b0;
            OUT_VALID_COMP = 1'b0;
        end
    end
endmodule
