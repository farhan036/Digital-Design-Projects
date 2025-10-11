module mux_0 #(parameter Width = 18) (
    input wire [Width-1:0] mux_reg_in ,
    input wire [Width-1:0] mux_in ,
    input wire        regenable, // Register enable
    output reg [Width-1:0] mux_out 
);

always @(*) 
    begin
        if (regenable)
        mux_out = mux_reg_in ; //reg
        else
        mux_out = mux_in;
    end
    
endmodule
