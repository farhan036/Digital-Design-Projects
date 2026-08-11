module SYS_TOP # ( parameter DATA_WIDTH = 8 ,  RegFile_ADDR = 4 )
(
    input  wire  REF_CLK,         // Reference clock (system clock domain)
    input  wire  UART_CLK,        // UART clock (UART domain)
    input  wire  RST_N,           // Asynchronous active-low reset
    input  wire  UART_RX_IN,      // UART receive input
    output wire  UART_TX_O,       // UART transmit output
    output wire  parity_error,    // UART parity error flag
    output wire  framing_error    // UART framing error flag
);

    // ---------------- Internal Signals ----------------
    wire RX_CLK;                          // UART RX clock (after divider)
    wire TX_CLK;                          // UART TX clock (after divider)
    wire ALU_CLK;                         // ALU gated clock
    wire [DATA_WIDTH-1:0] REG0internal;   // Register file internal register 0
    wire [DATA_WIDTH-1:0] REG1internal;   // Register file internal register 1
    wire [DATA_WIDTH-1:0] REG2internal;   // Register file internal register 2
    wire [DATA_WIDTH-1:0] REG3internal;   // Register file internal register 3
    wire [DATA_WIDTH-1:0] P_DATA;         // Parallel data from UART RX
    wire data_valid;                      // Data valid pulse from UART RX
    wire [2*DATA_WIDTH-1:0] ALU_OUT;      // ALU output
    wire OUT_Valid;                       // ALU output valid flag
    wire [DATA_WIDTH-1:0] Rd_D;           // Data read from register file
    wire Rd_D_Vld;                        // Register file read data valid
    wire [DATA_WIDTH-1:0] RX_P_DATA;      // Synchronized RX data
    wire RX_D_VLD;                        // Synchronized RX valid
    wire [3:0] ALU_FUN;                   // ALU function select
    wire EN;                              // ALU enable
    wire CLK_EN;                          // Clock gate enable
    wire [RegFile_ADDR-1:0] Address;      // Register file address
    wire WrEn;                            // Register file write enable
    wire RdEn;                            // Register file read enable
    wire [DATA_WIDTH-1:0] WrData;         // Data to write into register file
    wire [DATA_WIDTH-1:0] TX_P_DATA;      // Data to be written into FIFO (to UART TX)
    wire TX_D_VLD;                        // Valid signal for TX_P_DATA
    wire clk_div_en;                      // Clock divider enable
    wire [DATA_WIDTH-1:0] ratio;          // Prescaler ratio for RX clock divider
    wire SYNC_RST1;                       // Synchronized reset (system clock domain)
    wire SYNC_RST2;                       // Synchronized reset (UART clock domain)
    wire FIFO_Full;                       // FIFO full flag
    wire F_EMPTY;                         // FIFO empty flag
    wire [DATA_WIDTH-1:0] RD_DATA;        // Data read from FIFO
    wire Busy;                            // UART TX busy flag
    wire RD_INC;                          // FIFO read increment signal


    // ====================================================
    // UART Receiver
    // ====================================================
    UART_RX_TOP RX (
        .CLK(RX_CLK),
        .RST(SYNC_RST2),
        .RX_IN(UART_RX_IN),
        .Prescale(REG2internal[7:2]),  // Baud rate prescale
        .PAR_EN(REG2internal[0]),      // Parity enable
        .PAR_TYP(REG2internal[1]),     // Parity type (odd/even)
        .P_DATA(P_DATA),
        .Parity_Error(parity_error),
        .Stop_Error(framing_error),
        .data_valid(data_valid)
    );

    // ====================================================
    // Data Synchronizer
    // ====================================================
    DATA_SYNC #(.NUM_STAGES(2)) Data_sync (
        .CLK          (REF_CLK),
        .RST          (SYNC_RST1),
        .Unsync_bus   (P_DATA),
        .bus_enable   (data_valid),
        .sync_bus     (RX_P_DATA),
        .enable_pulse (RX_D_VLD)
    );

    // ====================================================
    // Register File
    // ====================================================
    Register_file #(.ADDR_WIDTH(RegFile_ADDR),.WIDTH(DATA_WIDTH),.DEPTH(16)) REGISTER (
        .WrData       (WrData),
        .Address      (Address),
        .WrEn         (WrEn),
        .RdEn         (RdEn),
        .CLK          (REF_CLK),
        .RST          (SYNC_RST1),
        .RdData       (Rd_D),
        .RdData_Valid (Rd_D_Vld),
        .REG0         (REG0internal),
        .REG1         (REG1internal),
        .REG2         (REG2internal),
        .REG3         (REG3internal)
    );

    // ====================================================
    // System Control FSM
    // ====================================================
    system_control U_system_control (
        .CLK        (REF_CLK),
        .RST        (SYNC_RST1),
        .ALU_OUT    (ALU_OUT),
        .OUT_Valid  (OUT_Valid),
        .Rd_D       (Rd_D),
        .Rd_D_Vld   (Rd_D_Vld),
        .RX_P_DATA  (RX_P_DATA),
        .RX_D_VLD   (RX_D_VLD),
        .ALU_FUN    (ALU_FUN),
        .EN         (EN),
        .CLK_EN     (CLK_EN),
        .Address    (Address),
        .WrEn       (WrEn),
        .RdEn       (RdEn),
        .WrData     (WrData),
        .TX_P_DATA  (TX_P_DATA),
        .TX_D_VLD   (TX_D_VLD),
        .clk_div_en (clk_div_en),
        .FIFO_Full  (FIFO_Full)
    );

    // ====================================================
    // Prescaler Multiplexer
    // ====================================================
    P_MUX Prescalemux (
        .sel   (REG2internal[7:2]),
        .ratio (ratio)
    );

    // ====================================================
    // RX Clock Divider
    // ====================================================
    ClkDiv clock_divider_RX (
       .I_ref_clk   (UART_CLK),
       .I_rst_n     (SYNC_RST2),
       .I_clk_en    (1'd1),
       .I_div_ratio (ratio),
       .o_div_clk   (RX_CLK)
    );

    // ====================================================
    // Reset Synchronizers
    // ====================================================
    RST_SYNC #(.NUM_STAGES(2)) RSTSYNC1 (
        .RST      (RST_N),
        .CLK      (REF_CLK),
        .SYNC_RST (SYNC_RST1)
    );

    RST_SYNC #(.NUM_STAGES(2)) RSTSYNC2 (
        .RST      (RST_N),
        .CLK      (UART_CLK),
        .SYNC_RST (SYNC_RST2)
    );

    // ====================================================
    // Clock Gate
    // ====================================================
    CLK_GATE CLK_GATE (
        .CLK_EN    (CLK_EN),
        .CLK       (REF_CLK),
        .GATED_CLK (ALU_CLK)
    );

    // ====================================================
    // 16-bit ALU
    // ====================================================
    ALU_16B ALU (
        .CLK      (ALU_CLK),
        .RST      (SYNC_RST1),
        .A        (REG0internal),
        .B        (REG1internal),
        .EN       (EN),
        .ALU_FUN  (ALU_FUN),
        .ALU_OUT  (ALU_OUT),
        .OUT_VALID(OUT_Valid)
    );

    // ====================================================
    // Asynchronous FIFO
    // ====================================================
    ASYNC_FIFO #(.DATA_WIDTH(DATA_WIDTH),.DEPTH(8),.ADDR_SIZE(3)) FIFO (
      .W_CLK   (REF_CLK),
      .W_RST   (SYNC_RST1),
      .W_INC   (TX_D_VLD),
      .R_CLK   (TX_CLK),
      .R_RST   (SYNC_RST2),
      .R_INC   (RD_INC),
      .WR_DATA (TX_P_DATA),
      .FULL    (FIFO_Full),
      .EMPTY   (F_EMPTY),
      .RD_DATA (RD_DATA)
    );

    // ====================================================
    // UART TX
    // ====================================================
    UART_TX TX (
        .CLK       (TX_CLK),
        .RST       (SYNC_RST2),
        .P_DATA    (RD_DATA),
        .Data_Valid(!F_EMPTY),       // Valid when FIFO not empty
        .PAR_EN    (REG2internal[0]),
        .PAR_TYP   (REG2internal[1]),
        .TX_OUT    (UART_TX_O),
        .busy      (Busy)
    );

    // ====================================================
    // TX Clock Divider
    // ====================================================
    ClkDiv clock_divider_TX (
       .I_ref_clk   (UART_CLK),
       .I_rst_n     (SYNC_RST2),
       .I_clk_en    (1'd1),
       .I_div_ratio (REG3internal),
       .o_div_clk   (TX_CLK)
    );

    // ====================================================
    // Pulse Generator
    // ====================================================
    pulse_gen pulse_gen (
        .CLK       (TX_CLK),
        .RST       (SYNC_RST2),
        .LVL_SIG   (Busy),
        .PULSE_SIG (RD_INC)
    );

endmodule
