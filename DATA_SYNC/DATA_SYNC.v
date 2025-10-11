module DATA_SYNC #(
    parameter NUM_STAGES = 2,
    BUS_WIDTH = 8     )                     // Width of the data bus to be synchronized
(
    input wire CLK,                         // Destination clock domain
    input wire RST,                         // Asynchronous active-low reset
    input wire [BUS_WIDTH-1:0] Unsync_bus,  // Data bus from asynchronous domain
    input wire bus_enable,                  // Enable signal from asynchronous domain
    output reg [BUS_WIDTH-1:0] sync_bus,    // Synchronized data bus
    output reg enable_pulse                 // One-clock-wide enable pulse in destination domain
);

    // Internal signals & registers

    reg [NUM_STAGES-1:0] sync_reg ;     // Shift register for synchronizing bus_enable
    reg enable_flop;                    // Stores previous value of synchronized enable
    wire enable_pulse_bf;               //enable pulse before ff
    wire [BUS_WIDTH-1:0] mux_out;       // Data selected based on enable pulse


    always @(posedge CLK or negedge RST) 
    begin
        if(!RST)
            begin
                sync_reg <= 'b0;
            end
        else
            begin
                sync_reg <= {sync_reg[NUM_STAGES-2:0],bus_enable};
            end
    end
    ///////////////pulse generator////////////////
    always @(posedge CLK or negedge RST) 
    begin
        if(!RST)
            begin
                enable_flop <= 'b0;
            end
        else
            begin
                enable_flop <= sync_reg[NUM_STAGES-1];
            end
    end

    assign enable_pulse_bf = !enable_flop && sync_reg[NUM_STAGES-1];

    // - On enable pulse, capture new Unsync_bus
    // - Otherwise, hold previous sync_bus value
    assign mux_out = enable_pulse_bf ? Unsync_bus:sync_bus ;

    /////////////////// enable_pulse ////////////////
    always @(posedge CLK or negedge RST) 
    begin
        if(!RST)
            begin
                enable_pulse <= 'b0;
            end
        else
            begin
                enable_pulse <= enable_pulse_bf;
            end
    end

    /////////////////// synchronized bus ////////////////
    always @(posedge CLK or negedge RST) 
    begin
        if(!RST)
            begin
                sync_bus <= 'b0;
            end
        else
            begin
                sync_bus <= mux_out;
            end
    end
endmodule
