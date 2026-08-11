module UART_TX (
    input wire CLK,
    input wire RST, // Asyncronus Active Low Reset
    input wire [7:0] P_DATA, // Parallel Data
    input wire Data_Valid, // High when data is valid
    input wire PAR_EN, // Parity enable
    input wire PAR_TYP, // 1 is odd 0 is even
    output wire TX_OUT, // Output serial Data
    output wire busy // busy when transimission from start
);
// Internal  wires
    wire SER_DATA;
    wire SER_EN;
    wire SER_DONE;
    wire [1:0] mux_sel;
    wire par_bit;

// Serializer
    Serializer DUT1 (
        .CLK(CLK),
        .RST(RST),
        .P_DATA(P_DATA),
        .SER_EN(SER_EN),
        .SER_DATA(SER_DATA),
        .SER_DONE(SER_DONE)
    );
// FSM
    uart_fsm DUT2 (
        .CLK(CLK),
        .RST(RST),
        .Data_Valid(Data_Valid),
        .PAR_EN(PAR_EN),
        .SER_DONE(SER_DONE),
        .SER_EN(SER_EN),
        .mux_sel(mux_sel),
        .busy(busy)
    );
// parity_calc
    parity_calc DUT3 (
        .CLK(CLK),
        .RST(RST),
        .P_DATA(P_DATA),
        .Data_Valid(Data_Valid),
        .busy_par(busy),
        .PAR_TYP(PAR_TYP),
        .par_bit(par_bit)
    );
// Mux
    mux DUT4(
        .CLK(CLK),
        .RST(RST),
        .mux_sel(mux_sel),
        .SER_DATA(SER_DATA),
        .par_bit(par_bit),
        .TX_OUT(TX_OUT)
    );
endmodule
