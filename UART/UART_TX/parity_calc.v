module parity_calc (
    input wire CLK,
    input wire RST,          // Asynchronous Active Low Reset
    input wire [7:0] P_DATA, // 8-bit parallel data
    input wire Data_Valid,   // High when data is valid
    input wire PAR_TYP,      // 0: Even parity, 1: Odd parity
    input wire busy_par,     // High when not ready to update
    output reg par_bit       // Output parity bit
);

    always @(posedge CLK or negedge RST) 
    begin
        if (!RST)
            par_bit <= 1'b0; // Async reset sets par_bit to 0
        else if (Data_Valid && !busy_par)
            par_bit <= (PAR_TYP) ? ~(^P_DATA) : (^P_DATA);
        else
            par_bit <= par_bit;  // Latch current value ,  can be remove it
        
    end

endmodule
