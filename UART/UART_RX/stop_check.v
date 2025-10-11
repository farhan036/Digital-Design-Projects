module stop_check (
    input  wire       CLK,
    input  wire       RST,         // Active-low reset
    input  wire       stp_chk_en,  // Enable stop check
    input  wire       sampled_bit, // Received stop bit
    output reg        stp_err      // 1 = error
);

    always @(posedge CLK or negedge RST) 
    begin
        if (!RST)
            stp_err <= 1'b0;
        else if(stp_chk_en)
            begin
               stp_err <= (sampled_bit != 1'b1); //stop bit is 1
            end
        
            
    end
    
endmodule

