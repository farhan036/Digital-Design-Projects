module pulse_gen (
    input wire CLK,RST,
    input wire LVL_SIG,
    output reg PULSE_SIG
);
    reg rcv_flop , pls_flop;
    
    always @(posedge CLK or negedge RST) 
    begin
        if(!RST)
        begin
            rcv_flop<= 'd0;
            pls_flop<= 'd0;
        end
        else
        begin
            rcv_flop <= LVL_SIG;
            pls_flop <=rcv_flop;
        end
    end
    always @(*) 
    begin
        PULSE_SIG = !pls_flop && rcv_flop;    
    end
endmodule