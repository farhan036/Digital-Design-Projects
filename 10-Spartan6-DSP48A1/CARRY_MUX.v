module carry_mux #(
    parameter CARRYINSEL = "OPMODE5"   // "OPMODE5" or "CARRYIN"
)(
    input  wire  mux_in,
    input  wire  CARRYIN,
    output reg   mux_out
);

    always @(*) begin
        if (CARRYINSEL == "OPMODE5")
            mux_out = mux_in;
        else if (CARRYINSEL == "CARRYIN")
            mux_out = CARRYIN;
        else
            mux_out = 1'b0;
    end

endmodule

