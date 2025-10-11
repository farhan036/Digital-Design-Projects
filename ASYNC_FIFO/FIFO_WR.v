module FIFO_WR #(parameter  ADDR_SIZE = 3)(
    input wire wclk,                        // Write clock
    input wire wrst_n,                      // Active-low write reset
    input wire winc,                        // Write enable signal
    input wire [ADDR_SIZE:0] wq2_rptr,      // Synchronized read pointer  (Gray code)
    output reg [ADDR_SIZE:0] wptr,          // Write pointer (Gray code)
    output wire [ADDR_SIZE-1:0] waddr,      // Write address
    output reg wfull                        // Write full flag

);

reg  [ADDR_SIZE:0] w_binary;                    // Internal binary pointer
wire [ADDR_SIZE:0] w_gray_next,w_binarynext;    // Next values for binary and Gray-coded pointers
wire wfull_assign;                              // Next value for full flag

// Sequential logic for write pointer and full flag
always @(posedge wclk or negedge wrst_n) 
begin
    if(!wrst_n)
        begin
            wptr<=     'd0;
            wfull<=    1'd0;
            w_binary<= 'd0;
        end
    else 
        begin
            w_binary<= w_binarynext;        // Update binary pointer
            wptr<= w_gray_next;             // Update Gray-coded pointer
            wfull<= wfull_assign;           // Update full flag
        end

end    
// Combinational logic

assign waddr = w_binary[ADDR_SIZE-1:0];                 // Write address for memory is just lower bits of binary pointer
assign w_binarynext = w_binary + (winc & ~wfull);       // Next binary value
assign w_gray_next= w_binarynext ^ (w_binarynext>>1);   // Convert next binary pointer to Gray code
// FIFO full condition:
assign wfull_assign = ((w_gray_next[ADDR_SIZE] != wq2_rptr[ADDR_SIZE]) && (w_gray_next[ADDR_SIZE-1] != wq2_rptr[ADDR_SIZE-1]) && (w_gray_next[ADDR_SIZE-2:0] == wq2_rptr[ADDR_SIZE-2:0]));
endmodule
