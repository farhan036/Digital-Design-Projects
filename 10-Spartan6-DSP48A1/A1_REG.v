module REG1 #(
    parameter RSTTYPE = "SYNC",  // "SYNC" or "ASYNC" 
    parameter Width = 18,
    parameter regenable = 1
) (
    input  wire        CLK,
    input  wire        RSTA,      // Active-low reset
    input  wire [Width-1:0] A_in,
    input  wire        CEA,       // Clock enable
    output reg  [Width-1:0] A_out
);

generate
    if (RSTTYPE == "ASYNC") begin : GEN_ASYNC
        always @(posedge CLK or posedge RSTA) begin
            if (RSTA)
                A_out <= 18'b0;       // Async reset
            else if (CEA && regenable)
                A_out <= A_in;
            // else hold value
        end
    end else begin : GEN_SYNC
        always @(posedge CLK) begin
            if (RSTA)
                A_out <= 18'b0;       // Sync reset
            else if (CEA && regenable)
                A_out <= A_in;
            // else hold value
        end
    end
endgenerate

endmodule

