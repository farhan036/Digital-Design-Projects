module strt_check (
    input  wire       CLK,
    input  wire       RST,             // Active-low reset
    input  wire       strt_chk_en,     // Enable start check
    input  wire       sampled_bit,     // Received  bit
    output reg        strt_glitch      // Flag: 1 = start glitch detected
);

    always @(posedge CLK or negedge RST) 
    begin
        if (!RST)
            strt_glitch <= 1'b0;
        else if(strt_chk_en)
            begin

               // START bit must be '0'. Any '1' here is a glitch.
               strt_glitch <= (sampled_bit != 1'b0);
            end
        
            
    end
    
endmodule
