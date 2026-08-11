module data_sampling (
    input  wire       CLK,
    input  wire       RST,         // Active-low reset
    input  wire       RX_IN,        // Serial input line
    input  wire       dat_samp_en,  // Enable sampling
    input  wire [5:0] Prescale,     // Support 8, 16, 32 
    input  wire [4:0] edge_cnt,     // Edge counter within bit period
    output reg        sampled_bit   // Final stable sampled bit
);
    reg [2:0] majority;  // Stores 3 mid-bit samples for majority voting

        // edge_cnt : 0   1   2   3   4   5   6   7
        // clk edge : 1st 2nd 3rd 4th 5th 6th 7th 8th

    always @(posedge CLK or negedge RST) begin
        if (!RST) begin
            sampled_bit <= 1'b0;
            majority    <= 3'b000;
        end 
        else if (dat_samp_en) begin
            case (Prescale)
                6'd8: begin
                    case (edge_cnt)  // Sampling at edge_cnt = 2, 3, 4 → corresponds to the 3rd, 4th, 5th edges.
                        5'd2: majority[0] <= RX_IN; // First mid sample
                        5'd3: majority[1] <= RX_IN; // Second mid sample
                        5'd4: begin
                            majority[2] <= RX_IN;   // Third mid sample
                            sampled_bit <= (majority[0] + majority[1] + RX_IN) >= 2;   // Majority decision (2 out of 3 rule)
                        end
                    endcase
                end
                6'd16: begin
                    case (edge_cnt)  //At 16x, we sample on edges 6, 7, 8 → which are the 7th, 8th, and 9th clocks.
                        5'd6: majority[0] <= RX_IN;
                        5'd7: majority[1] <= RX_IN;
                        5'd8: begin
                            majority[2] <= RX_IN;
                            sampled_bit <= (majority[0] + majority[1] + RX_IN) >= 2;
                        end
                    endcase
                end
                6'd32: begin
                    case (edge_cnt) //At 32x, we sample on edges 14, 15, 16 → which are the 15th, 16th, and 17th clocks.
                        5'd14: majority[0] <= RX_IN; 
                        5'd15: majority[1] <= RX_IN;
                        5'd16: begin
                            majority[2] <= RX_IN;
                            sampled_bit <= (majority[0] + majority[1] + RX_IN) >= 2;
                        end
                    endcase
                end
            endcase
        end
        else // If sampling disabled, clear output
        sampled_bit <= 0;
    end
endmodule
