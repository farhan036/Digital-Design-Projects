module FIFO_RD #(parameter  ADDR_SIZE = 3)(
    input wire rclk,                        // Read clock
    input wire rrst_n,                      // Active-low read reset
    input wire rinc,                        // Read enable signal
    input wire  [ADDR_SIZE:0] rq2_wptr,     // Synchronized write pointer (Gray code)
    output reg  [ADDR_SIZE:0] rptr,         // Read pointer (Gray code)
    output wire [ADDR_SIZE-1:0] raddr,      // Read address
    output reg       rempty                 // FIFO empty flag
);  
    reg  [ADDR_SIZE:0] r_binary;                    // Internal binary pointer
    wire [ADDR_SIZE:0] r_binarynext,r_gray_next;    // Next values for binary and Gray-coded pointers
    wire rempty_assign;                             // Next value for empty flag

    // Sequential logic for read pointer and empty flag
    always @(posedge rclk or negedge rrst_n) 
    begin
        if(!rrst_n)
        begin
            rptr<=     'd0;
            rempty<=   1'd1;
            r_binary<= 'd0;
        end
        else
        begin
            rptr<=     r_gray_next;         // Update Gray-coded read pointer
            rempty<=   rempty_assign;       // Update empty flag
            r_binary<= r_binarynext;        // Update binary pointer
        end
    end

    // Combinational logic
    assign raddr = r_binary[ADDR_SIZE-1:0];                  // Read address for memory is lower bits of binary pointer
    assign r_binarynext = r_binary + (rinc & ~rempty);       // Next binary pointer
    assign r_gray_next = r_binarynext ^ (r_binarynext>>1);   // Convert next binary pointer to Gray code   
    assign rempty_assign = (r_gray_next == rq2_wptr);        // FIFO empty condition 
endmodule
