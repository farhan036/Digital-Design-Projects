module butterfly (
    input clk , rst_n,
    input  wire signed [15:0] ar, ai,   // Complex Input A (16-bit Q1.14)
    input  wire signed [15:0] br, bi,   // Complex Input B (16-bit Q1.14)
    input  wire signed [15:0] wr, wi,   // Twiddle Factor W (16-bit Q1.14)
    input  wire en ,
    output reg signed [15:0] ar_out_reg, ai_out_reg, 
    output reg signed [15:0] br_out_reg, bi_out_reg
);
    wire signed [15:0] ar_out, ai_out; // Output A' (16-bit Q1.14)
    wire signed [15:0] br_out, bi_out; // Output B' (16-bit Q1.14)
    // STEP 1: 16-bit x 16-bit Multiplication -> Produces 32-bit (Q2.28)
    wire signed [31:0] bw_r_full = (br * wr) - (bi * wi);
    wire signed [31:0] bw_i_full = (br * wi) + (bi * wr);

    // STEP 1 (Cont.): Extract Q1.14 from Q2.28 -> 16-bit
    wire signed [15:0] bw_r = bw_r_full[29:14];
    wire signed [15:0] bw_i = bw_i_full[29:14];

    // STEP 2: Internal 17-bit addition to prevent intermediate overflow
    wire signed [16:0] sum_r  = {ar[15], ar} + {bw_r[15], bw_r};
    wire signed [16:0] sum_i  = {ai[15], ai} + {bw_i[15], bw_i};
    
    wire signed [16:0] diff_r = {ar[15], ar} - {bw_r[15], bw_r};
    wire signed [16:0] diff_i = {ai[15], ai} - {bw_i[15], bw_i};

    // STEP 3: Shift right by 1 scales back down to 16-bit cleanly
    assign ar_out = sum_r >>> 1;
    assign ai_out = sum_i >>> 1;

    assign br_out = diff_r >>> 1;
    assign bi_out = diff_i >>> 1;

    always 
    @(posedge clk or negedge rst_n) 
    begin
        if(!rst_n)
        begin
            ar_out_reg <= 16'sd0;
            ai_out_reg <= 16'sd0;
            br_out_reg <= 16'sd0;
            bi_out_reg <= 16'sd0;
        end
        else
        begin
            if(en)
            begin
                ar_out_reg <= ar_out ;
                ai_out_reg <= ai_out ;
                br_out_reg <= br_out ;
                bi_out_reg <= bi_out ;
            end
            
        end
    end

endmodule