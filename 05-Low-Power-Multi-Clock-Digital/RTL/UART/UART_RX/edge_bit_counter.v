module edge_bit_counter (
    input  wire       CLK,
    input  wire       RST,         // Active-low reset
    input  wire       enable,       // Enable edge/bit counter
    input  wire [5:0] Prescale,    // e.g. 8, 16, 32
    output reg [3:0]  bit_cnt,  
    output reg [4:0]  edge_cnt  // Counts sampling edges within each bit
);

    always @(posedge CLK or negedge RST) 
    begin
        if (!RST) 
        begin
            // Reset both counters on active-low reset
            edge_cnt <= 5'd0;
            bit_cnt  <= 4'd0;
        end 
        else if (enable) 
        begin
            // Counting enabled
            if (edge_cnt == (Prescale-1)) 
            begin
                // Full bit duration reached -> reset edge counter and increment bit counter
                edge_cnt <= 5'd0;
                bit_cnt  <= bit_cnt + 1'b1;    
            end
            else 
            begin
                  // Increment edge counter within the bit period
                edge_cnt <= edge_cnt + 1'b1;
            end
        end
        else
            begin
                // If not enabled, hold counters at 0
                bit_cnt  <= 'd0;
                edge_cnt <= 'd0;
            end
    end
    
endmodule
