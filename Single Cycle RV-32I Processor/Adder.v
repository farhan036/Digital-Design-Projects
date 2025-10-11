module Adder (
    input wire [31:0] A,
    input wire [31:0] B,
    output wire [31:0] out
);
    assign out = A + B;
endmodule
