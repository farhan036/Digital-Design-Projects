module FFT (
    input clk, rst_n,
    input  wire signed [15:0] x0_r, x1_r, x2_r, x3_r, x4_r, x5_r, x6_r, x7_r,
    output wire signed [15:0] X0_r, X1_r, X2_r, X3_r, X4_r, X5_r, X6_r, X7_r,
    output wire signed [15:0] X0_i, X1_i, X2_i, X3_i, X4_i, X5_i, X6_i, X7_i
);

    // Stage 1 Real Outputs
    wire signed [15:0] ar_u1_s1, br_u1_s1;
    wire signed [15:0] ar_u2_s1, br_u2_s1;
    wire signed [15:0] ar_u3_s1, br_u3_s1;
    wire signed [15:0] ar_u4_s1, br_u4_s1;
    
    // Stage 1 Imaginary Outputs (Always zero, can be left unconnected or tied off)
    wire signed [15:0] ai_u1_s1, bi_u1_s1;
    wire signed [15:0] ai_u2_s1, bi_u2_s1;
    wire signed [15:0] ai_u3_s1, bi_u3_s1;
    wire signed [15:0] ai_u4_s1, bi_u4_s1;

    // Stage 2 Real Outputs
    wire signed [15:0] ar_u1_s2, br_u1_s2;
    wire signed [15:0] ar_u2_s2, br_u2_s2;
    wire signed [15:0] ar_u3_s2, br_u3_s2;
    wire signed [15:0] ar_u4_s2, br_u4_s2;
    
    // Stage 2 Imaginary Outputs 
    wire signed [15:0] ai_u1_s2, bi_u1_s2;
    wire signed [15:0] ai_u2_s2, bi_u2_s2;
    wire signed [15:0] ai_u3_s2, bi_u3_s2;
    wire signed [15:0] ai_u4_s2, bi_u4_s2;

    // =========================================================================
    // 16-Bit Q1.14 Fixed-Point Twiddle Factors (SCALE = 2^14 = 16384)
    // =========================================================================

    // Stage 1 Twiddles (N = 8)
    localparam signed [15:0] W8_0_R = 16'h4000, W8_0_I = 16'h0000; //  1.0 + j0.0
    localparam signed [15:0] W8_1_R = 16'h2D41, W8_1_I = 16'hD2BF; //  0.7071 - j0.7071
    localparam signed [15:0] W8_2_R = 16'h0000, W8_2_I = 16'hC000; //  0.0 - j1.0
    localparam signed [15:0] W8_3_R = 16'hD2BF, W8_3_I = 16'hD2BF; // -0.7071 - j0.7071
    localparam signed [15:0] W8_4_R = 16'hC000, W8_4_I = 16'h0000; // -1.0 + j0.0
    localparam signed [15:0] W8_5_R = 16'hD2BF, W8_5_I = 16'h2D41; // -0.7071 + j0.7071
    localparam signed [15:0] W8_6_R = 16'h0000, W8_6_I = 16'h4000; //  0.0 + j1.0
    localparam signed [15:0] W8_7_R = 16'h2D41, W8_7_I = 16'h2D41; //  0.7071 + j0.7071

    // Stage 2 Twiddles (N = 4)
    localparam signed [15:0] W4_0_R = 16'h4000, W4_0_I = 16'h0000; //  1.0 + j0.0
    localparam signed [15:0] W4_1_R = 16'h0000, W4_1_I = 16'hC000; //  0.0 - j1.0
    localparam signed [15:0] W4_2_R = 16'hC000, W4_2_I = 16'h0000; // -1.0 + j0.0
    localparam signed [15:0] W4_3_R = 16'h0000, W4_3_I = 16'h4000; //  0.0 + j1.0

    // Zero constant for explicit 16-bit input connection
    localparam signed [15:0] ZERO_16 = 16'sd0;

    // =========================================================
    // Stage 1 (All 4 Butterflies use W8^0) H = 1
    // =========================================================
    butterfly u1_s1 (
        .clk(clk), .rst_n(rst_n),
        .ar(x0_r),   .ai(ZERO_16),
        .br(x4_r),   .bi(ZERO_16),
        .wr(W8_0_R), .wi(W8_0_I),
        .ar_out_reg(ar_u1_s1), .ai_out_reg(ai_u1_s1),
        .br_out_reg(br_u1_s1), .bi_out_reg(bi_u1_s1)
    ); 

    butterfly u2_s1 (
        .clk(clk), .rst_n(rst_n),
        .ar(x2_r),   .ai(ZERO_16),
        .br(x6_r),   .bi(ZERO_16),
        .wr(W8_0_R), .wi(W8_0_I),
        .ar_out_reg(ar_u2_s1), .ai_out_reg(ai_u2_s1),
        .br_out_reg(br_u2_s1), .bi_out_reg(bi_u2_s1)
    ); 

    butterfly u3_s1 (
        .clk(clk), .rst_n(rst_n),
        .ar(x1_r),   .ai(ZERO_16),
        .br(x5_r),   .bi(ZERO_16),
        .wr(W8_0_R), .wi(W8_0_I),
        .ar_out_reg(ar_u3_s1), .ai_out_reg(ai_u3_s1),
        .br_out_reg(br_u3_s1), .bi_out_reg(bi_u3_s1)
    ); 

    butterfly u4_s1 (
        .clk(clk), .rst_n(rst_n),
        .ar(x3_r),   .ai(ZERO_16),
        .br(x7_r),   .bi(ZERO_16),
        .wr(W8_0_R), .wi(W8_0_I),
        .ar_out_reg(ar_u4_s1), .ai_out_reg(ai_u4_s1),
        .br_out_reg(br_u4_s1), .bi_out_reg(bi_u4_s1)
    ); 
    
    // =========================================================
    // Stage 2 (Group 1 uses W8^0, Group 2 uses W8^2) H = 2
    // =========================================================
    // Butterfly Group 1 (u1_s1 & u2_s1) -> Twiddle W8^0
    
    butterfly u1_s2 (
        .clk(clk), .rst_n(rst_n),
        .ar(ar_u1_s1), .ai(ai_u1_s1),
        .br(ar_u2_s1), .bi(ai_u2_s1),
        .wr(W4_0_R),   .wi(W4_0_I),
        .ar_out_reg(ar_u1_s2), .ai_out_reg(ai_u1_s2),
        .br_out_reg(br_u1_s2), .bi_out_reg(bi_u1_s2)
    );

    butterfly u2_s2 (
        .clk(clk), .rst_n(rst_n),
        .ar(br_u1_s1), .ai(bi_u1_s1),
        .br(br_u2_s1), .bi(bi_u2_s1),
        .wr(W4_1_R),   .wi(W4_1_I),
        .ar_out_reg(ar_u2_s2), .ai_out_reg(ai_u2_s2),
        .br_out_reg(br_u2_s2), .bi_out_reg(bi_u2_s2)
    );

    // Butterfly Group 2 (u3_s1 & u4_s1) -> Twiddle W8^0 & W8^2
    butterfly u3_s2 (
        .clk(clk), .rst_n(rst_n),
        .ar(ar_u3_s1), .ai(ai_u3_s1),
        .br(ar_u4_s1), .bi(ai_u4_s1),
        .wr(W4_0_R),   .wi(W4_0_I),
        .ar_out_reg(ar_u3_s2), .ai_out_reg(ai_u3_s2),
        .br_out_reg(br_u3_s2), .bi_out_reg(bi_u3_s2)
    );

    butterfly u4_s2 (
        .clk(clk), .rst_n(rst_n),
        .ar(br_u3_s1), .ai(bi_u3_s1),
        .br(br_u4_s1), .bi(bi_u4_s1),
        .wr(W4_1_R),   .wi(W4_1_I),
        .ar_out_reg(ar_u4_s2), .ai_out_reg(ai_u4_s2),
        .br_out_reg(br_u4_s2), .bi_out_reg(bi_u4_s2)
    );
    // =========================================================
    // Stage 3 H = 4
    // =========================================================

    butterfly u1_s3 (
        .clk(clk), .rst_n(rst_n),
        .ar(ar_u1_s2), .ai(ai_u1_s2),
        .br(ar_u3_s2), .bi(ai_u3_s2),
        .wr(W8_0_R),   .wi(W8_0_I),
        .ar_out_reg(X0_r), .ai_out_reg(X0_i),
        .br_out_reg(X4_r), .bi_out_reg(X4_i)
    );

    butterfly u2_s3 (
        .clk(clk), .rst_n(rst_n),
        .ar(ar_u2_s2), .ai(ai_u2_s2),
        .br(ar_u4_s2), .bi(ai_u4_s2),
        .wr(W8_1_R),   .wi(W8_1_I),
        .ar_out_reg(X1_r), .ai_out_reg(X1_i),
        .br_out_reg(X5_r), .bi_out_reg(X5_i)
    );

    // Butterfly Group 2 (u3_s1 & u4_s1) -> Twiddle W8^0 & W8^2
    butterfly u3_s3 (
        .clk(clk), .rst_n(rst_n),
        .ar(br_u1_s2), .ai(bi_u1_s2),
        .br(br_u3_s2), .bi(bi_u3_s2),
        .wr(W8_2_R),   .wi(W8_2_I),
        .ar_out_reg(X2_r), .ai_out_reg(X2_i),
        .br_out_reg(X6_r), .bi_out_reg(X6_i)
    );

    butterfly u4_s3 (
        .clk(clk), .rst_n(rst_n),
        .ar(br_u2_s2), .ai(bi_u2_s2),
        .br(br_u4_s2), .bi(bi_u4_s2),
        .wr(W8_3_R),   .wi(W8_3_I),
        .ar_out_reg(X3_r), .ai_out_reg(X3_i),
        .br_out_reg(X7_r), .bi_out_reg(X7_i)
    );


endmodule