module uart_fsm (
    input wire        CLK,
    input wire        RST, // Asyncronus Active Low Reset
    input wire        Data_Valid, // High when data is valid
    input wire        PAR_EN, // Parity enable
    input wire        SER_DONE, // High after 8 bits sent
    output reg        SER_EN, // Serialize enable from FSM
    output reg [1:0]  mux_sel,
    output reg        busy // busy when transimission from start
);
    //GRAY ENCODING
    typedef enum bit [2:0] { //to appear text in wave form
               IDLE   = 3'b000,
               START  = 3'b001,
               SEND   = 3'b011,
               PARITY = 3'b010,
               STOP   = 3'b110
    } state;
    state current_state, next_state;

    // Sequential block for state update
    always @(posedge CLK or negedge RST) begin
        if (!RST)
            current_state <= IDLE;
        else
            current_state <= next_state;
    end

    // Combinational block for next state and output logic
    always @(*) begin
        // Default outputs
        SER_EN  = 1'b0;
        mux_sel = 2'd0; // Default to STOP bit (IDLE line)
        busy    = 1'b0;

        case (current_state)
            IDLE: begin
                SER_EN  = 1'b0;
                mux_sel = 2'd1;
                busy    = 1'b0;
                if (Data_Valid)
                    next_state = START;
                else
                    next_state = IDLE;
            end

            START: begin
                SER_EN  = 1'b1;
                mux_sel = 2'd0;
                busy    = 1'b1;
                next_state = SEND;
            end

            SEND: begin
                SER_EN  = 1'b1;
                mux_sel = 2'd2;
                busy    = 1'b1;
                if (SER_DONE == 0)
                    next_state = SEND;
                else if (PAR_EN)
                        next_state = PARITY;
                else
                        next_state = STOP;
                
            end

            PARITY: begin
                SER_EN  = 1'b0;
                mux_sel = 2'd3;
                busy    = 1'b1;
                next_state = STOP;
            end

            STOP: begin
                SER_EN  = 1'b0;
                mux_sel = 2'd1;
                busy    = 1'b1;
                next_state = IDLE;
            end

            default: begin
                next_state = IDLE;
            end
        endcase
    end

endmodule
