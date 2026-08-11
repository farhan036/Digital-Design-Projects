module ASYNC_FIFO #(
    parameter DATA_WIDTH = 8,  // Width of FIFO data
              DEPTH = 8,       // Number of FIFO entries
              ADDR_SIZE = 3    // Address width (log2(DEPTH))
) (
    input wire W_CLK,                  // Write clock
    input wire W_RST,                  // Write reset (active-low)
    input wire W_INC,                  // Write enable
    input wire R_CLK,                  // Read clock
    input wire R_RST,                  // Read reset (active-low)
    input wire R_INC,                  // Read enable
    input wire [DATA_WIDTH-1:0] WR_DATA, // Data input to FIFO
    output wire FULL,                  // FIFO full flag
    output wire EMPTY,                 // FIFO empty flag
    output wire [DATA_WIDTH-1:0] RD_DATA // Data output from FIFO
);

    // ===================================================
    // Internal wires for addressing and pointers
    // ===================================================
    wire [ADDR_SIZE-1:0] waddr;        // Write address for memory
    wire [ADDR_SIZE-1:0] raddr;        // Read address for memory
    wire [ADDR_SIZE:0] wptr;           // Gray-coded write pointer
    wire [ADDR_SIZE:0] rptr;           // Gray-coded read pointer
    wire [ADDR_SIZE:0] wq2_rptr;       // Read pointer synchronized into write clock domain
    wire [ADDR_SIZE:0] rq2_wptr;       // Write pointer synchronized into read clock domain

    // ===================================================
    // Memory block (register file)
    // ===================================================
    FIFO_MEM_CNTRL #(
        .DATA_WIDTH(DATA_WIDTH),
        .DEPTH(DEPTH),
        .ADDR_SIZE(ADDR_SIZE)
    ) MEM (
        .wdata(WR_DATA),   // Data to write
        .winc(W_INC),      // Write enable
        .wfull(FULL),      // Prevent write when FIFO full
        .waddr(waddr),     // Write address from FIFO_WR
        .wclk(W_CLK),      // Write clock
        .RST(W_RST),       // Write reset
        .rdata(RD_DATA),   // Read data output
        .raddr(raddr)      // Read address from FIFO_RD
    );

    // ===================================================
    // Write pointer logic
    // ===================================================
    FIFO_WR #(.ADDR_SIZE(ADDR_SIZE)) WR (
        .wclk(W_CLK),
        .wrst_n(W_RST),
        .winc(W_INC),
        .wfull(FULL),
        .waddr(waddr),       // Memory write address
        .wptr(wptr),         // Gray-coded write pointer
        .wq2_rptr(wq2_rptr)  // Read pointer synchronized into write domain
    );

    // ===================================================
    // Read pointer logic
    // ===================================================
    FIFO_RD #(.ADDR_SIZE(ADDR_SIZE)) RD (
        .rclk(R_CLK),
        .rrst_n(R_RST),
        .rinc(R_INC),
        .rempty(EMPTY),       // FIFO empty flag
        .raddr(raddr),        // Memory read address
        .rptr(rptr),          // Gray-coded read pointer
        .rq2_wptr(rq2_wptr)   // Write pointer synchronized into read domain
    );

    // ===================================================
    // Pointer synchronizers for clock domain crossing
    // ===================================================
    DF_SYNC #(.BUS_WIDTH(ADDR_SIZE+1)) sync_r2w (
        .CLK(W_CLK),       // Write clock domain
        .RST(W_RST),       // Reset in write domain
        .ASYNC(rptr),      // Asynchronous read pointer from read domain
        .SYNC(wq2_rptr)    // Synchronized into write clock domain
    );

    DF_SYNC #(.BUS_WIDTH(ADDR_SIZE+1)) sync_w2r (
        .CLK(R_CLK),       // Read clock domain
        .RST(R_RST),       // Reset in read domain
        .ASYNC(wptr),      // Asynchronous write pointer from write domain
        .SYNC(rq2_wptr)    // Synchronized into read clock domain
    );

endmodule
