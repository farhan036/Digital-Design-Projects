module P_MUX (
    input [5:0] sel, //prescale
    output reg [7:0] ratio 
);

always @(*) 
begin
    case (sel)
    'd32: ratio = 'd1;
    'd16: ratio = 'd2;
    'd8:  ratio = 'd4;
    'd4:  ratio = 'd8;
    default: ratio = 'd1;
    endcase    
end
    
endmodule