module PC_COUNTER (
    input wire CLK,              // Clock signal
    input wire RST,              // Active-low reset signal
    input wire [31:0] PCNext,    // Next PC value (input from instruction logic)
    output reg [31:0] PC         // Current PC value (program counter output)
);
    
    // Sequential block triggered on rising edge of clock or falling edge of reset
    always @(posedge CLK or negedge RST) 
    begin
        if (!RST) 
            begin
                // If reset is asserted (active-low), reset PC to 0
                PC <= 32'd0;
            end
        else 
            begin
                // Otherwise, load next PC value
                PC <= PCNext;
            end
    end
   
endmodule

