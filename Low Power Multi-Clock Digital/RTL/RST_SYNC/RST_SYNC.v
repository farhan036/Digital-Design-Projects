module RST_SYNC #(parameter NUM_STAGES = 2)(
    input  wire RST,            // asynchronous active-low reset
    input  wire CLK,            // system clock
    output wire SYNC_RST        // synchronized reset
);
    reg   [NUM_STAGES-1:0] sync_reg ;

    always @(posedge CLK or negedge RST)
 begin
  if(!RST)      // active low
      sync_reg <= 'b0 ;
  else
   begin
     sync_reg <= {sync_reg[NUM_STAGES-2:0],1'b1};   // {SYNC,sync_reg} <= {sync_reg[NUM_STAGES-1:0],1};
   end  
 end



// The synchronized reset is taken from the last stage of the flip-flop chain
  assign SYNC_RST = sync_reg[NUM_STAGES-1] ; 
   
endmodule
