module ALU (
    input wire [31:0] SrcA,          // First 32-bit input operand
    input wire [31:0] SrcB,          // Second 32-bit input operand
    input wire [2:0] ALUControl,     // Control signal to select ALU operation
    output wire Zero,                // Output flag: HIGH if ALUResult == 0
    output wire signflag,            // Output flag: Sign bit of the result (MSB of ALUResult)
    output reg [31:0] ALUResult      // Final 32-bit result of the ALU operation
);

   // Combinational logic block
   always @(*) 
   begin
    case (ALUControl)
        3'b000: ALUResult = SrcA + SrcB;   // Addition
        3'b001: ALUResult = SrcA << SrcB;  // Logical left shift
        3'b010: ALUResult = SrcA - SrcB;   // Subtraction
        3'b100: ALUResult = SrcA ^ SrcB;   // Bitwise XOR
        3'b101: ALUResult = SrcA >> SrcB;  // Logical right shift
        3'b110: ALUResult = SrcA | SrcB;   // Bitwise OR
        3'b111: ALUResult = SrcA & SrcB;   // Bitwise AND
        default:  ALUResult = 32'd0;       // Default: Output zero
    endcase
   end 

   // Zero flag: Set HIGH if the ALU result is 0
   assign Zero = (ALUResult == 32'd0);

   // Sign flag: MSB of the ALU result (1 if negative in signed representation)
   assign signflag = ALUResult[31];
endmodule
