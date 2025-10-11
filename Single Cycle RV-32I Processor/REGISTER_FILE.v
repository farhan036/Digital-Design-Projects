module Register_file (
    input  wire        CLK,    // Clock
    input  wire        RST,    // Reset (active-low)
    input  wire        WE3,    // Write enable
    input  wire [31:0] WD3,    // Write data
    input  wire [4:0]  A1,     // Read address 1
    input  wire [4:0]  A2,     // Read address 2
    input  wire [4:0]  A3,     // Write address
    output wire [31:0] RD1,    // Read data 1
    output wire [31:0] RD2     // Read data 2
);

    // Register file: 32 registers, each 32-bit wide
    reg [31:0] File [0:31];  
    integer i;

    // Sequential logic for reset and write operations
    always @(posedge CLK or negedge RST) 
    begin
        if (!RST) begin
            // Asynchronous reset: clear all registers to 0
            for (i = 0; i < 32; i = i + 1) 
                File[i] <= 32'd0;
        end
        else if (WE3 && A3 != 5'd0) begin
            // Write data WD3 into register A3 
            // (writing to register 0 is not allowed)
            File[A3] <= WD3;
        end
    end
    
    // Combinational read ports
    assign RD1 = File[A1];   // Read data from register at address A1
    assign RD2 = File[A2];   // Read data from register at address A2

endmodule
