module Controlunit (
    input  wire       Zero,        // Zero flag from ALU
    input  wire       sign,        // Sign flag from ALU
    input  wire [6:0] OP,          // Opcode field from instruction
    input  wire [2:0] funct3,      // funct3 field
    input  wire       funct7,      // funct7 bit (for R-type instructions)
    
    output reg  [2:0] ALUControl,  // ALU operation select
    output reg        PCSrc,       // Program counter source (branch control)
    output reg        ResultSrc,   // Selects ALU result or memory read
    output reg        MemWrite,    // Memory write enable
    output reg        ALUSrc,      // Selects between register or immediate for ALU input
    output reg  [1:0] ImmSrc,      // Immediate type (I, S, B, etc.)
    output reg        RegWrite     // Register file write enable
);

    // Internal signals
    reg  [1:0] ALUOP;   // ALU operation type control
    reg        Branch;  // Branch flag

    wire bnq;           // Branch if not equal
    wire blt;           // Branch if less than
    wire beq;           // Branch if equal

    //========================================================
    // Main Decoder: Sets control signals based on opcode
    //========================================================
    always @(*) 
    begin
        casex (OP)
            // Load (I-type)
            7'b000_0011: begin
                RegWrite  = 1'b1;
                ImmSrc    = 2'b00;
                ALUSrc    = 1'b1;
                MemWrite  = 1'b0;
                ResultSrc = 1'b1;
                Branch    = 1'b0;
                ALUOP     = 2'b00;
            end 

            // Store (S-type)
            7'b010_0011: begin
                RegWrite  = 1'b0;
                ImmSrc    = 2'b01;
                ALUSrc    = 1'b1;
                MemWrite  = 1'b1;
                ResultSrc = 1'bx;
                Branch    = 1'b0;
                ALUOP     = 2'b00;
            end  

            // R-type
            7'b011_0011: begin
                RegWrite  = 1'b1;
                ImmSrc    = 2'bxx;
                ALUSrc    = 1'b0;
                MemWrite  = 1'b0;
                ResultSrc = 1'b0;
                Branch    = 1'b0;
                ALUOP     = 2'b10;
            end  

            // I-type (ALU immediate)
            7'b001_0011: begin
                RegWrite  = 1'b1;
                ImmSrc    = 2'b00;
                ALUSrc    = 1'b1;
                MemWrite  = 1'b0;
                ResultSrc = 1'b0;
                Branch    = 1'b0;
                ALUOP     = 2'b10;
            end  

            // B-type (branch)
            7'b110_0011: begin
                RegWrite  = 1'b0;
                ImmSrc    = 2'b10;
                ALUSrc    = 1'b0;
                MemWrite  = 1'b0;
                ResultSrc = 1'bx;
                Branch    = 1'b1;
                ALUOP     = 2'b01;
            end  

            // Default: do nothing
            default: begin
                RegWrite  = 1'b0;
                ImmSrc    = 2'b00;
                ALUSrc    = 1'b0;
                MemWrite  = 1'b0;
                ResultSrc = 1'b0;
                Branch    = 1'b0;
                ALUOP     = 2'b00;
            end
        endcase
    end

    //========================================================
    // ALU Decoder: Selects exact ALU operation
    //========================================================
    always @(*) 
    begin
        casex ({ALUOP, funct3, OP[5], funct7})
            7'b00_xxx_x_x: ALUControl = 3'b000; // Default: ADD
            7'b01_000_x_x: ALUControl = 3'b010; // BEQ: Subtract
            7'b01_001_x_x: ALUControl = 3'b010; // BNE: Subtract
            7'b01_100_x_x: ALUControl = 3'b010; // BLT: Subtract
            7'b10_000_0_0: ALUControl = 3'b000; // ADD
            7'b10_000_0_1: ALUControl = 3'b000; // ADD
            7'b10_000_1_0: ALUControl = 3'b000; // ADD
            7'b10_000_1_1: ALUControl = 3'b010; // SUB
            7'b10_001_x_x: ALUControl = 3'b001; // SLL
            7'b10_100_x_x: ALUControl = 3'b100; // XOR
            7'b10_101_x_x: ALUControl = 3'b101; // SRL
            7'b10_110_x_x: ALUControl = 3'b110; // OR
            7'b10_111_x_x: ALUControl = 3'b111; // AND
            default:        ALUControl = 3'b000;
        endcase
    end

    //========================================================
    // Branch decision logic
    //========================================================
    assign beq = Branch &  Zero;  // Branch if equal
    assign bnq = Branch & ~Zero;  // Branch if not equal
    assign blt = Branch &  sign;  // Branch if less than

    always @(*) 
    begin
        if (ALUOP == 2'b01) begin
            case (funct3)
                3'b000: PCSrc = beq; // BEQ
                3'b001: PCSrc = bnq; // BNE
                3'b100: PCSrc = blt; // BLT
                default: PCSrc = 1'b0;
            endcase
        end
        else
            PCSrc = 1'b0; // No branch
    end

endmodule
