module mux2_1 (
    input wire [31:0] In1,
    input wire [31:0] In2,
    input wire sel,
    output reg [31:0] out
);
    always @(*) 
    begin
        if(!sel)
        out = In1;
        else
        out = In2; 
    end
endmodule
