module Register_file #(
    parameter ADDR_WIDTH = 4,
              WIDTH      = 8,
              DEPTH      = 16
) (
    input  wire [WIDTH-1:0]       WrData,
    input  wire [ADDR_WIDTH-1:0]  Address,
    input  wire                   WrEn,
    input  wire                   RdEn,
    input  wire                   CLK,
    input  wire                   RST,
    output reg  [WIDTH-1:0]       RdData,
    output reg                    RdData_Valid,
    output wire [WIDTH-1:0]       REG0,
    output wire [WIDTH-1:0]       REG1,
    output wire [WIDTH-1:0]       REG2,
    output wire [WIDTH-1:0]       REG3
);

    integer i;

    // Register file of 16 registers each 8 bits wide
    reg [WIDTH-1:0] Reg_File [DEPTH-1:0];

    always @(posedge CLK or negedge RST) 
    begin
        if (!RST) 
        begin
            RdData       <= 'd0;
            RdData_Valid <= 1'b0;
            for (i = 0; i < DEPTH; i = i + 1) 
            begin
                if (i == 2)
                    Reg_File[i] <= 'b100000_01;
                else if (i == 3)
                    Reg_File[i] <= 'b0010_0000; // 32
                else
                    Reg_File[i] <= 'b0;
            end
        end
        else if (WrEn && !RdEn) 
        begin
            Reg_File[Address] <= WrData;  // Write Operation
            RdData_Valid      <= 1'b0;
        end
        else if (RdEn && !WrEn) 
        begin
            RdData            <= Reg_File[Address]; // Read Operation
            RdData_Valid      <= 1'b1;
        end
        else 
        begin
            RdData_Valid      <= 1'b0;
        end
    end

    assign REG0 = Reg_File[0];
    assign REG1 = Reg_File[1];
    assign REG2 = Reg_File[2];
    assign REG3 = Reg_File[3];

endmodule
