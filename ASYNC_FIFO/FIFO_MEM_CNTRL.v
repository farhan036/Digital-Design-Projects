module FIFO_MEM_CNTRL #(
    parameter DATA_WIDTH =8,    // Width of each FIFO data element
              DEPTH = 8 ,       // Number of entries in FIFO
              ADDR_SIZE = 3     // Address width (log2(DEPTH))
) (
    input wire [DATA_WIDTH-1:0] wdata,          // Data to be written
    input wire [ADDR_SIZE-1:0] waddr,           // Write address
    input wire [ADDR_SIZE-1:0] raddr,           // Read address
    input wire wfull,                           // Write full flag from FIFO
    input wire winc,                            // Write enable
    input wire wclk,                            // Write clock
    input wire RST,                             // Active-low reset
    output wire [DATA_WIDTH-1:0] rdata          // Data read from FIFO
);

// DEPTH registers of DATA_WIDTH bits each
    reg [DATA_WIDTH-1:0] Reg_File [DEPTH-1:0];  // Memory array (register file)

    wire wclken;
    assign wclken = winc & !wfull;      // Write enable logic
    integer i;


   assign rdata = Reg_File[raddr]; // Read Operation (asynchronous)
    always @(posedge wclk or negedge RST)
        begin
            if(!RST)
                begin
                    for (i = 0;i<DEPTH ;i=i+1 ) 
                    begin
                        Reg_File[i] <= 'd0;
                    end
                   
                end
            else if (wclken)
                    Reg_File[waddr] <= wdata;  // Write Operation (synchronous)   
        end
endmodule

