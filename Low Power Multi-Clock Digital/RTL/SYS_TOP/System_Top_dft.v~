module SYS_TOP # ( parameter DATA_WIDTH = 8 ,  RegFile_ADDR = 4 )
(   
    input  wire   [3:0]               SI,
    input  wire                       SE,
    input  wire                       scan_clk,
    input  wire                       scan_rst,
    input  wire                       test_mode,
    output wire   [3:0]               SO,

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

    wire CLK_M, CLKR, RST_M ;
    wire RX_CLK1,TX_CLK1,SYNC_RST11,SYNC_RST22 ;

	
	// Muxing primary clock
	mux2X1 U0_mux2X1 (
	.IN_0(REF_CLK),
	.IN_1(scan_clk),
	.SEL(test_mode),
	.OUT(CLK_M)
	); 
	mux2X1 U1_mux2X1 (
	.IN_0(UART_CLK),
	.IN_1(scan_clk),
	.SEL(test_mode),
	.OUT(CLKR)
	); 

	mux2X1 U3_mux2X1 (
	.IN_0(RX_CLK),
	.IN_1(scan_clk),
	.SEL(test_mode),
	.OUT(RX_CLK1)
	); 
	mux2X1 U4_mux2X1 (
	.IN_0(TX_CLK),
	.IN_1(scan_clk),
	.SEL(test_mode),
	.OUT(TX_CLK1)
	); 
	

	// Muxing resets
	mux2X1 U2_mux2X1 (
	.IN_0(RST_N),
	.IN_1(scan_rst),
	.SEL(test_mode),
	.OUT(RST_M)
	); 
	// Muxing resets
	mux2X1 U6_mux2X1 (
	.IN_0(SYNC_RST1),
	.IN_1(scan_rst),
	.SEL(test_mode),
	.OUT(SYNC_RST11)
	); 
	// Muxing resets
	mux2X1 U7_mux2X1 (
	.IN_0(SYNC_RST2),
	.IN_1(scan_rst),
	.SEL(test_mode),
	.OUT(SYNC_RST22)
	); 
    // ====================================================
    // UART Receiver
    // ====================================================
    UART_RX_TOP RX
    (
        .CLK(RX_CLK1),
        .RST(SYNC_RST22),
        .RX_IN(UART_RX_IN),
        .Prescale(REG2internal[7:2]),
        .PAR_EN(REG2internal[0]),
        .PAR_TYP(REG2internal[1]),
        .P_DATA(P_DATA),
        .Parity_Error(parity_error),
        .Stop_Error(framing_error),
        .data_valid(data_valid)
    );

    // ====================================================
    // Data Synchronizer
    // ====================================================
    DATA_SYNC #(.NUM_STAGES(2)) Data_sync
    (
        .CLK            (CLK_M),
        .RST            (SYNC_RST11),
        .Unsync_bus     (P_DATA),
        .bus_enable     (data_valid),
        .sync_bus       (RX_P_DATA),
        .enable_pulse   (RX_D_VLD)
    );

    // ====================================================
    // Register File
    // ====================================================
    Register_file #(.ADDR_WIDTH(RegFile_ADDR),.WIDTH(DATA_WIDTH),.DEPTH(16)) REGISTER (
       .WrData       (WrData),
    	.Address      (Address),
    	.WrEn         (WrEn),
    	.RdEn         (RdEn),
    	.CLK          (CLK_M),
    	.RST          (SYNC_RST11),
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
	.CLK        	(CLK_M),         	// connect to system clock
    	.RST        	(SYNC_RST11),        // connect to reset
    	.ALU_OUT    	(ALU_OUT),     	// from ALU
       .OUT_Valid  	(OUT_Valid),   	// from ALU valid flag
       .Rd_D       	(Rd_D),      		// from Register File read data
       .Rd_D_Vld	(Rd_D_Vld),
       .RX_P_DATA  	(RX_P_DATA),   	// from UART RX
       .RX_D_VLD   	(RX_D_VLD),    	// RX data valid
    	.ALU_FUN    	(ALU_FUN),     	// to ALU function select
    	.EN         	(EN),          	// to ALU enable
    	.CLK_EN     	(CLK_EN),      	// to clock GATE
    	.Address    	(Address),     	// to Register File address
    	.WrEn       	(WrEn),        	// to Register File write enable
    	.RdEn       	(RdEn),        	// to Register File read enable
    	.WrData     	(WrData),      	// to Register File write data
    	.TX_P_DATA  	(TX_P_DATA),   	// to UART TX data
    	.TX_D_VLD   	(TX_D_VLD),    	// TX data valid
    	.clk_div_en 	(clk_div_en),   	// enable clock divider
    	.FIFO_Full	(FIFO_Full)
    );

    // ====================================================
    // Prescaler Multiplexer
    // ====================================================
    P_MUX Prescalemux (
        .sel		(REG2internal[7:2]),
        .ratio	(ratio)
    );

    // ====================================================
    // RX Clock Divider
    // ====================================================
    ClkDiv clock_divider_RX (
       .I_ref_clk	(CLKR),
       .I_rst_n	(SYNC_RST22),
       .I_clk_en	(1'd1),
       .I_div_ratio	(ratio),
       .o_div_clk	(RX_CLK)
    );

    // ====================================================
    // Reset Synchronizers
    // ====================================================
    RST_SYNC #(.NUM_STAGES(2)) RSTSYNC1 (
        .RST		(RST_M),
        .CLK		(CLK_M),
        .SYNC_RST	(SYNC_RST1)
    );

    RST_SYNC #(.NUM_STAGES(2)) RSTSYNC2 (
        .RST		(RST_M),
        .CLK		(CLKR),
        .SYNC_RST	(SYNC_RST2)
    );

    // ====================================================
    // Clock Gate
    // ====================================================
    CLK_GATE CLK_GATE (
        .CLK_EN	(CLK_EN||test_mode),
        .CLK		(CLK_M),
        .GATED_CLK	(ALU_CLK)
    );

    // ====================================================
    // 16-bit ALU
    // ====================================================
    ALU_16B ALU (
        .CLK		(ALU_CLK),
        .RST		(SYNC_RST11),
        .A		(REG0internal),
        .B		(REG1internal),
        .EN		(EN),
        .ALU_FUN	(ALU_FUN),
        .ALU_OUT	(ALU_OUT),
        .OUT_VALID	(OUT_Valid)
    );

    // ====================================================
    // Asynchronous FIFO
    // ====================================================
    ASYNC_FIFO #(.DATA_WIDTH(DATA_WIDTH),.DEPTH(8),.ADDR_SIZE(3)) FIFO (
      .W_CLK		(CLK_M),
      .W_RST		(SYNC_RST11),
      .W_INC		(TX_D_VLD),
      .R_CLK		(TX_CLK1),
      .R_RST		(SYNC_RST22),
      .R_INC		(RD_INC),
      .WR_DATA	(TX_P_DATA),
      .FULL		(FIFO_Full),
      .EMPTY		(F_EMPTY),
      .RD_DATA	(RD_DATA)
    );

    // ====================================================
    // UART TX
    // ====================================================
    UART_TX TX (
       .CLK		(TX_CLK1),
        .RST		(SYNC_RST22),
        .P_DATA	(RD_DATA),
        .Data_Valid	(!F_EMPTY),
        .PAR_EN	(REG2internal[0]),
        .PAR_TYP	(REG2internal[1]),
        .TX_OUT	(UART_TX_O),
        .busy		(Busy)
    );

    // ====================================================
    // TX Clock Divider
    // ====================================================
    ClkDiv clock_divider_TX (
       .I_ref_clk	(CLKR),
       .I_rst_n	(SYNC_RST22),
       .I_clk_en	(1'd1),
       .I_div_ratio	(REG3internal),
       .o_div_clk	(TX_CLK)
    );

    // ====================================================
    // Pulse Generator
    // ====================================================
    pulse_gen pulse_gen (
        .CLK		(TX_CLK1),
        .RST		(SYNC_RST22),
        .LVL_SIG	(Busy),
        .PULSE_SIG	(RD_INC)
    );

endmodule
