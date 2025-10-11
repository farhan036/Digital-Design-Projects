module sign_extend (
    input wire [31:0] Instr ,   // Full 32-bit instruction
    input wire [1:0] ImmSrc ,   // Control signal to select immediate type
    output reg [31:0] ImmExt    // Sign-extended immediate output
);
    
    always @(*) 
    begin
        case (ImmSrc)
            // I-type immediate (12 bits from [31:20])
            // Example: addi, lw
            2'b00:      
                ImmExt = {{20{Instr[31]}}, Instr[31:20]};
            
            // S-type immediate (12 bits from [31:25] & [11:7])
            // Example: sw
            2'b01:      
                ImmExt = {{20{Instr[31]}}, Instr[31:25], Instr[11:7]};
            
            // B-type immediate (branch offset, 13 bits)
            // Immediate fields: Instr[31], Instr[7], Instr[30:25], Instr[11:8], plus 0 at LSB
            // Example: beq, bne
            2'b10:      
                ImmExt = {{20{Instr[31]}}, Instr[7], Instr[30:25], Instr[11:8], 1'b0};
            
            // Default case -> no immediate
            default:    
                ImmExt = 32'd0;
        endcase
    end
endmodule
