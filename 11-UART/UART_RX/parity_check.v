module parity_check (
    input  wire       CLK,
    input  wire       RST,         // Active-low reset
    input  wire       par_chk_en,  // Enable parity check
    input  wire       PAR_TYP,     // 0 = even, 1 = odd
    input wire  [4:0] edge_cnt,
    input  wire [5:0] Prescale,    // Oversampling ratio (e.g. 8, 16, 32)
    input  wire [7:0] P_DATA,      // Received data
    input  wire       sampled_bit, // Received parity bit
    output reg        par_err      // 1 = error
);
    reg expected_parity;

    always @(posedge CLK or negedge RST) begin
        if (!RST) 
        begin
            par_err <= 1'b0;
            expected_parity <= 1'b0;
        end
        else if (par_chk_en) 
        begin
            // Even parity: XOR of all data bits
            // Odd parity: invert even parity
            expected_parity <= (PAR_TYP) ? ~(^P_DATA) : (^P_DATA);
            if(edge_cnt== Prescale-2)
            par_err <= (sampled_bit != expected_parity);
        end
        
    end
endmodule
