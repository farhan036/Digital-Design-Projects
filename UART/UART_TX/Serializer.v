module Serializer (
    input  wire       CLK,
    input  wire       RST,        // Active-low asynchronous reset
    input  wire [7:0] P_DATA,     // Parallel data input
    input  wire       SER_EN,     // Serialize enable from FSM
    output reg        SER_DATA,   // Serial data output
    output reg        SER_DONE    // High after 8 bits sent
);

    reg [7:0] S_DATA;
    reg [3:0] COUNT;

    always @(posedge CLK or negedge RST) begin
    if (!RST) begin
        SER_DATA <= 1'b0;
        SER_DONE <= 1'b0;
        COUNT    <= 4'd0;
        S_DATA   <= 8'd0;
    end 
    else 
    begin
        if (SER_EN) 
        begin
            if (COUNT == 4'd0) 
            begin
                // Load on first cycle
                S_DATA   <= P_DATA >> 1;
                SER_DATA <= P_DATA[0];
                COUNT    <= 4'd1;
                SER_DONE <= 1'b0;
            end 
            else if (COUNT < 4'd7) 
            begin
                SER_DATA <= S_DATA[0];
                S_DATA   <= S_DATA >> 1;
                COUNT    <= COUNT + 1;
                SER_DONE <= 1'b0;
            end 
            else if (COUNT == 4'd7) 
            begin
                SER_DATA <= S_DATA[0]; // final bit
                COUNT    <= 4'd0;
                SER_DONE <= 1'b1; // done after 8th bit
            end
        end 
        else 
        begin
            SER_DATA <= 1'b0;
            SER_DONE <= 1'b0;
            COUNT    <= 4'd0;
        end
    end
end


endmodule
