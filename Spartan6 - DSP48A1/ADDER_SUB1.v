module ADDR_SUB1 #(parameter Width = 18) (
    input wire [Width-1:0] IN1,
    input wire [Width-1:0] IN2,    
    input wire  cin,    
    input wire        opmode7,    
    output reg [Width-1:0] out,
    output reg  cout
);
  always @(*) 
  begin
    if (!opmode7)
        begin
            {cout,out} = IN1 +IN2+cin;
        end
    else
        begin
            {cout,out} = IN2-(IN1+cin) ;
        end
  end  
endmodule

