module mux (
    input CLK ,RST , // Asyncronous Active low Reset
    input wire [1:0] mux_sel ,
    input wire SER_DATA, 
    input wire par_bit , // output Parity bit
    output reg TX_OUT // Output serial Data
);
     always @(*) 
        begin
                begin
                    case (mux_sel)
                     2'b00   : TX_OUT= 1'b0;        // start bit
                     2'b01   : TX_OUT= 1'b1;       // stop bit
                     2'b10   : TX_OUT= SER_DATA;  // Serial data
                     2'b11   : TX_OUT= par_bit;  // Parity bit
                    default  : TX_OUT= 1'b0; 
                    endcase
                end
        end
endmodule
