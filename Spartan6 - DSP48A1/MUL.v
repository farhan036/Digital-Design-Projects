module mul #(parameter Width = 18)(
    input wire [Width-1:0] IN1,
    input wire [Width-1:0] IN2,
    output reg [(2*Width)-1:0] out
);
    always @(*) 
    begin
        out = IN1 * IN2 ;    
    end
endmodule
