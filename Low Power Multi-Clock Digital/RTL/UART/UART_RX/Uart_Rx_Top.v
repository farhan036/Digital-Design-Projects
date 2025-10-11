module UART_RX_TOP (
    input wire        CLK,
    input wire        RST, // Asynchronous Active Low Reset
    input wire        RX_IN,
    input wire [5:0]  Prescale,
    input wire        PAR_EN,
    input wire        PAR_TYP,
    output wire [7:0] P_DATA,
    output wire       Parity_Error,
    output wire       Stop_Error,
    output wire       data_valid
);

//======================================================================
// Internal control signals 
//======================================================================

wire par_chk_en;
wire strt_chk_en;
wire strt_glitch;
wire stp_chk_en;
wire enable;
wire [3:0] bit_cnt;
wire dat_samp_en;
wire [4:0] edge_cnt;
wire sampled_bit;
wire deser_en;

// FSM
FSM DUT1 (
 .CLK(CLK),
 .RST(RST), 
 .RX_IN(RX_IN), 
 .PAR_EN(PAR_EN), 
 .bit_cnt(bit_cnt), 
 .edge_cnt(edge_cnt),
 .par_err(Parity_Error),
 .strt_glitch(strt_glitch),
 .Prescale(Prescale),
 .stp_err(Stop_Error),
 .par_chk_en(par_chk_en),
 .strt_chk_en(strt_chk_en),
 .stp_chk_en(stp_chk_en),
 .enable(enable),
 .dat_samp_en(dat_samp_en),
 .deser_en(deser_en),
 .data_valid(data_valid)
);

// Edge & Bit Counter
edge_bit_counter DUT2 (
 .CLK(CLK),
 .RST(RST),
 .enable(enable),
 .Prescale(Prescale),
 .bit_cnt(bit_cnt),
 .edge_cnt(edge_cnt)
);

// Data Sampling
data_sampling DUT3 (
 .CLK(CLK),
 .RST(RST),
 .RX_IN(RX_IN),
 .dat_samp_en(dat_samp_en),
 .Prescale(Prescale),
 .edge_cnt(edge_cnt),
 .sampled_bit(sampled_bit)
);

// Parity Check
parity_check DUT4 (
 .CLK(CLK),
 .RST(RST),
 .par_chk_en(par_chk_en),
 .PAR_TYP(PAR_TYP),
 .P_DATA(P_DATA),
 .edge_cnt(edge_cnt),
 .Prescale(Prescale),
 .sampled_bit(sampled_bit),
 .par_err(Parity_Error)
);

// Deserializer Converts the serial sampled bits into parallel data (8-bit)
deserializer DUT5(
 .CLK(CLK),
 .RST(RST),
 .sampled_bit(sampled_bit),
 .deser_en(deser_en),
 .Prescale(Prescale),
 .edge_cnt(edge_cnt), //can be removed
 .P_DATA(P_DATA)
);

// Start Bit Check
// Verifies that the start bit is valid (logic 0) without glitch.
strt_check DUT6(
 .CLK(CLK),
 .RST(RST),
 .strt_chk_en(strt_chk_en),
 .sampled_bit(sampled_bit),
 .strt_glitch(strt_glitch)
);

// Stop Bit Check
// Ensures that the stop bit is valid (logic 1).
stop_check DUT7(
 .CLK(CLK),
 .RST(RST),
 .stp_chk_en(stp_chk_en),
 .sampled_bit(sampled_bit),
 .stp_err(Stop_Error)
);
endmodule
