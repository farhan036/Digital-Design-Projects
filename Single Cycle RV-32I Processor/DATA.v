module DATA_memory (
    input  wire        CLK,   // Clock
    input  wire        RST,   // Reset (active-low)
    input  wire        WE,    // Write enable
    input  wire [31:0] A,     // Address (word-aligned)
    input  wire [31:0] WD,    // Write data
    output wire [31:0] RD     // Read data
);

    // 64 words of memory, each word is 32-bit wide
    reg [31:0] Dmemory [0:63];
    integer i;

    // Sequential logic for reset and write
    always @(posedge CLK or negedge RST) 
    begin
        if (!RST) begin
            // Reset: clear entire memory to 0
            for (i = 0; i < 64; i = i + 1)
                Dmemory[i] <= 32'd0;
        end
        else if (WE) begin
            // Write operation (word-aligned: ignore lowest 2 address bits)
            Dmemory[A[31:2]] <= WD;
        end
    end

    // Combinational read (word-aligned)
    assign RD = Dmemory[A[31:2]];

endmodule

