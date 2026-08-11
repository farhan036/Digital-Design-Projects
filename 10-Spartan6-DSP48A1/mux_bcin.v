module bcin_mux #(
    parameter DATA = "DIRECT"   // "DIRECT" or "CASCADE"
)(
    input  wire [17:0] mux_in,
    input  wire [17:0] BCIN,
    output reg  [17:0] mux_out
);

    always @(*) begin
        if (DATA == "DIRECT")
            mux_out = mux_in;
        else if (DATA == "CASCADE")
            mux_out = BCIN;
        else
            mux_out = 18'b0;
    end

endmodule
