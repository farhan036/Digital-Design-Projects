module INSTRUCTION_MEMORY (
    input  wire [31:0] A,   // PC
    output wire [31:0] RD   // instruction
);
    // 64 words Ã— 32 bits = 2 KB
    reg [31:0] ROM [0:63];

    // asynchronous read (word-aligned)
    assign RD = ROM[A[31:2]];

    // optional: preload program
   
endmodule
