
module mux_sel 
(
    input  wire [17:0] mux_in1,
    input  wire [17:0] mux_in2,
    input  wire opmode,
    output reg  [17:0] mux_out
);

    always @(*) begin
        if (opmode)
            mux_out = mux_in1;
        else 
            mux_out = mux_in2;
        
    end

endmodule
