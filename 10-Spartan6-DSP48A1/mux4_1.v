module mux4_1 (
    input wire [1:0] opmode,
    input wire [47:0] IN1,
    input wire [47:0] IN2,
    input wire [47:0] IN3,
    output reg [47:0] out
);
    always @(*) 
    begin
        case (opmode)
          2'b00  : out = 48'b0; 
          2'b01  : out = IN1;
          2'b10  : out = IN2;
          2'b11  : out = IN3;
            default: out = 48'b0;
        endcase
    end
endmodule
