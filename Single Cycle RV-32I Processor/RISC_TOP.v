module RISC (
    input wire CLK,    // Clock
    input wire RST     // Reset (active-low)
);

    // Control signals
    wire RegWrite;           // Register write enable
    wire [1:0] ImmSrc;       // Immediate source type
    wire ALUSrc;             // Select between register or immediate for ALU operand B
    wire [2:0] ALUControl;   // ALU operation control
    wire MemWrite;           // Memory write enable
    wire ResultSrc;          // Select between ALU result or memory read for write-back
    wire PCSrc;              // Select between PC+4 or branch target
    
    // Status flags
    wire Zero;               // Zero flag from ALU
    wire sign;               // Sign flag from ALU

    // Data path wires
    wire [31:0] Result;      // Final result written back to register file
    wire [31:0] Instr;       // Current instruction
    wire [31:0] SrcA;        // ALU operand A (from register file)
    wire [31:0] SrcB;        // ALU operand B (from register file or immediate)
    wire [31:0] PC;          // Current program counter
    wire [31:0] PCNext;      // Next program counter value
    wire [31:0] PCTarget;    // Branch target address
    wire [31:0] ALUResult;   // Result from ALU
    wire [31:0] WriteData;   // Data to be written into memory
    wire [31:0] ReadData;    // Data read from memory
    wire [31:0] ImmExt;      // Sign-extended immediate value
    wire [31:0] PCPlus4;     // PC + 4 (next sequential instruction)

    // ---------------- Control Unit ----------------
    Controlunit DUT 
    (
        .Zero(Zero),
        .sign(sign),
        .OP(Instr[6:0]),
        .funct3(Instr[14:12]),
        .funct7(Instr[30]),
        .ALUControl(ALUControl),
        .PCSrc(PCSrc),
        .ResultSrc(ResultSrc),
        .MemWrite(MemWrite),
        .ALUSrc(ALUSrc),
        .ImmSrc(ImmSrc),
        .RegWrite(RegWrite)
    );

    // ---------------- Register File ----------------
    Register_file DUT1 
    (
        .CLK(CLK),
        .RST(RST),
        .WE3(RegWrite),
        .WD3(Result),
        .A1(Instr[19:15]),
        .A2(Instr[24:20]),
        .A3(Instr[11:7]),
        .RD1(SrcA),
        .RD2(WriteData)
    );

    // ---------------- Instruction Memory ----------------
    INSTRUCTION_MEMORY DUT2
    (
        .A(PC),
        .RD(Instr)
    );

    // ---------------- Program Counter ----------------
    PC_COUNTER DUT3 
    (
        .CLK(CLK),
        .RST(RST),
        .PCNext(PCNext),
        .PC(PC)
    );

    // ---------------- PC + 4 Adder ----------------
    Adder DUT11 
    (
        .A(PC),
        .B(32'd4),
        .out(PCPlus4)
    );

    // ---------------- PC Mux (Next PC: sequential or branch) ----------------
    mux2_1 DUT12 
    (
        .In1(PCPlus4),
        .In2(PCTarget),
        .sel(PCSrc),
        .out(PCNext)
    );
    
    // ---------------- ALU ----------------
    ALU DUT5 
    (
        .SrcA(SrcA),
        .SrcB(SrcB),
        .ALUControl(ALUControl),
        .Zero(Zero),
        .signflag(sign),
        .ALUResult(ALUResult)
    );

    // ---------------- Data Memory ----------------
    DATA_memory DUT6 
    (
        .CLK(CLK),
        .RST(RST),
        .WE(MemWrite),
        .A(ALUResult),
        .WD(WriteData),
        .RD(ReadData)
    );

    // ---------------- Immediate Generator ----------------
    sign_extend DUT7 
    (
        .Instr(Instr),
        .ImmSrc(ImmSrc),
        .ImmExt(ImmExt)
    );

    // ---------------- Branch Target Adder ----------------
    Adder DUT8 
    (
        .A(PC),
        .B(ImmExt),
        .out(PCTarget)
    );

    // ---------------- Result Mux (Write-back: ALU or Memory) ----------------
    mux2_1 DUT9 
    (
        .In1(ALUResult),
        .In2(ReadData),
        .sel(ResultSrc),
        .out(Result)
    );

    // ---------------- ALU Src Mux (Operand B: Register or Immediate) ----------------
    mux2_1 DUT10 
    (
        .In1(WriteData),
        .In2(ImmExt),
        .sel(ALUSrc),
        .out(SrcB)
    );

endmodule
