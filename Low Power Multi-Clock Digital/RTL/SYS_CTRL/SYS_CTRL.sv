module system_control (
    input  wire       CLK,
    input  wire       RST,
    input  wire       FIFO_Full,
    input  wire [15:0] ALU_OUT,
    input  wire       OUT_Valid,
    input  wire [7:0] Rd_D,
    input  wire       Rd_D_Vld,
    input  wire [7:0] RX_P_DATA,
    input  wire       RX_D_VLD,
    output reg  [3:0] ALU_FUN,
    output reg        EN,
    output reg        CLK_EN,
    output reg  [3:0] Address,
    output reg        WrEn,
    output reg        RdEn,
    output reg  [7:0] WrData,
    output reg  [7:0] TX_P_DATA,
    output reg        TX_D_VLD,
    output reg        clk_div_en
);

    // GRAY ENCODING
    typedef enum bit [3:0] { // to appear text in wave form
        IDLE           = 4'd0,
        Frame1wr       = 4'd1,
        Frame1rd       = 4'd3,
        Frame1opa      = 4'd2,
        Frame2opb      = 4'd6,
        Frame1fun      = 4'd7,
        Frame2wr       = 4'd5,
        Fifo_statealu  = 4'd4,
        Fifo_stateread = 4'd12,
        Fifo_statealu2  = 4'd 13
    } state;

    state current_state, next_state;

    reg  [3:0] storeadd;
    reg  [15:0] store_ALU_OUT;
    reg        enable_store;
    reg        RX_D_VLD_delayed;
    reg  [7:0] TX_P_DATA_store;

    // Store registers
    always @(posedge CLK or negedge RST) begin
        if (!RST) begin
            storeadd        <= 'd0;
            store_ALU_OUT   <= 'd0;
            TX_P_DATA_store <= 'd0;
            RX_D_VLD_delayed<= 'd0;
        end else begin
            storeadd        <= RX_P_DATA;
            store_ALU_OUT   <= ALU_OUT;
            TX_P_DATA_store <= TX_P_DATA;
            RX_D_VLD_delayed<= RX_D_VLD;
        end
    end

    // Sequential block for state update
    always @(posedge CLK or negedge RST) begin
        if (!RST)
            current_state <= IDLE;
        else
            current_state <= next_state;
    end

    // Combinational block for next state and outputs
    always @(*) begin
        // Default outputs
        ALU_FUN      = 'd0;
        EN           = 'd0;
        CLK_EN       = 'd0;
        Address      = storeadd;
        WrEn         = 'd0;
        RdEn         = 'd0;
        WrData       = 'd0;
        TX_P_DATA    = TX_P_DATA_store;
        TX_D_VLD     = 'd0;
        clk_div_en   = 'd0;
        enable_store = 'd0;

        case (current_state)

            IDLE: begin
                if (RX_D_VLD) begin
                    case (RX_P_DATA)
                        8'hAA  : next_state = Frame1wr;
                        8'hBB  : next_state = Frame1rd;
                        8'hCC  : next_state = Frame1opa;
                        8'hDD  : next_state = Frame1fun;
                        default: next_state = IDLE;
                    endcase
                end else
                    next_state = IDLE;
            end

            Frame1wr: begin
                if (RX_D_VLD) begin
                    Address    = RX_P_DATA;
                    next_state = Frame2wr;
                end else
                    next_state = Frame1wr;
            end

            Frame2wr: begin
                if (RX_D_VLD) begin
                    WrData     = RX_P_DATA;
                    WrEn       = 1;
                    RdEn       = 0;
                    Address    = storeadd;
                    next_state = IDLE;
                end else
                    next_state = Frame2wr;
            end

            Frame1rd: begin
                if (RX_D_VLD) begin
                    RdEn       = 1;
                    Address    = RX_P_DATA;
                    next_state = Fifo_stateread;
                end else
                    next_state = Frame1rd;
            end

            Frame1opa: begin
                if (RX_D_VLD) begin
                    WrEn       = 1;
                    Address    = 0;
                    WrData     = RX_P_DATA;
                    next_state = Frame2opb;
                end else
                    next_state = Frame1opa;
            end

            Frame2opb: begin
                if (RX_D_VLD) begin
                    WrEn       = 1;
                    Address    = 'd1;
                    WrData     = RX_P_DATA;
                    next_state = Frame1fun;
                end else
                    next_state = Frame2opb;
            end

            Frame1fun: begin
                CLK_EN = 1;
                if (RX_D_VLD) begin
                    ALU_FUN    = RX_P_DATA[3:0];
                    EN         = 1;
                    next_state = Fifo_statealu;
                end else
                    next_state = Frame1fun;
            end

            Fifo_statealu: begin
                CLK_EN = 1;
                if (RX_D_VLD_delayed) begin
                    if (OUT_Valid && !FIFO_Full) begin
                        TX_P_DATA = ALU_OUT[7:0];
                        TX_D_VLD  = 1;
                        next_state= Fifo_statealu2;
                    end else begin
                        TX_D_VLD  = 0;
                        next_state= Fifo_statealu;
                    end
                end else
                    next_state = Fifo_statealu;
            end

            Fifo_statealu2: begin
                CLK_EN = 1;
                    if (!FIFO_Full) 
                    begin
                        TX_P_DATA = store_ALU_OUT[15:8];
                        TX_D_VLD  = 1;
                        next_state= IDLE;
                    end 
                    else 
                    begin
                        TX_D_VLD  = 0;
                        next_state= Fifo_statealu2;
                    end
                 
            end

            Fifo_stateread: begin
                if (RX_D_VLD_delayed) begin
                    if (Rd_D_Vld &&!FIFO_Full) begin
                        TX_P_DATA = Rd_D;
                        TX_D_VLD  = 1;
                        next_state= IDLE;
                    end else begin
                        TX_D_VLD  = 0;
                        next_state= Fifo_stateread;
                    end
                end else
                    next_state = Fifo_stateread;
            end

            default: begin
                next_state = IDLE;
            end
        endcase
    end

endmodule
