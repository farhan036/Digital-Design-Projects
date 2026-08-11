module deserializer (
    input  wire       CLK,
    input  wire       RST,         // Active-low reset
    input  wire       sampled_bit,       
    input  wire       deser_en, //enable of deserializer
    input wire  [4:0] edge_cnt, //edge counter
    input  wire [5:0] Prescale, //8 , 16 , 32
    output reg  [7:0] P_DATA   //parallel data
);
    reg [2:0] i;          // Bit index (0..7)

    always @(posedge CLK or negedge RST) 
    begin
        if (!RST) begin
            P_DATA     <= 8'b0;
            i          <= 3'b0;
        end
        else if (deser_en) 
        begin
            if (edge_cnt == (Prescale - 1)) 
            begin
                // After 8 clocks, store the bit and move to next index
                P_DATA[i] <= sampled_bit;
                i         <= i + 1;
            end
        end
        else 
        begin
            // Reset everything when not enabled
            i         <= 3'b0;

            
        end
    end
endmodule
