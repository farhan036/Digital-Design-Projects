module FFT_16Point (
    input clk, rst_n,
    input enable,
    // 16 Real Inputs (Natural Order Inputs)
    input  wire signed [15:0] x0_r,  x1_r,  x2_r,  x3_r,  x4_r,  x5_r,  x6_r,  x7_r,
    input  wire signed [15:0] x8_r,  x9_r,  x10_r, x11_r, x12_r, x13_r, x14_r, x15_r,
    
    // 16 Real Outputs (Natural Order X0..X15)
    output wire signed [15:0] X0_r,  X1_r,  X2_r,  X3_r,  X4_r,  X5_r,  X6_r,  X7_r,
    output wire signed [15:0] X8_r,  X9_r,  X10_r, X11_r, X12_r, X13_r, X14_r, X15_r,
    
    // 16 Imaginary Outputs (Natural Order X0..X15)
    output wire signed [15:0] X0_i,  X1_i,  X2_i,  X3_i,  X4_i,  X5_i,  X6_i,  X7_i,
    output wire signed [15:0] X8_i,  X9_i,  X10_i, X11_i, X12_i, X13_i, X14_i, X15_i
);

    // =========================================================================
    // 1. Inter-Stage Wire Arrays
    // =========================================================================
    wire signed [15:0] s1_r [0:15], s1_i [0:15];
    wire signed [15:0] s2_r [0:15], s2_i [0:15];
    wire signed [15:0] s3_r [0:15], s3_i [0:15];

    // =========================================================================
    // 2. 16-Bit Q1.14 Fixed-Point Twiddle Factors
    // =========================================================================
    localparam signed [15:0] W16_0_R = 16'h4000, W16_0_I = 16'h0000; //  1.0    + j0.0
    localparam signed [15:0] W16_1_R = 16'h3B21, W16_1_I = 16'hE8C5; //  0.9239 - j0.3827
    localparam signed [15:0] W16_2_R = 16'h2D41, W16_2_I = 16'hD2BF; //  0.7071 - j0.7071
    localparam signed [15:0] W16_3_R = 16'h187E, W16_3_I = 16'hC4DF; //  0.3827 - j0.9239
    localparam signed [15:0] W16_4_R = 16'h0000, W16_4_I = 16'hC000; //  0.0    - j1.0
    localparam signed [15:0] W16_5_R = 16'hE782, W16_5_I = 16'hC4DF; // -0.3827 - j0.9239
    localparam signed [15:0] W16_6_R = 16'hD2BF, W16_6_I = 16'hD2BF; // -0.7071 - j0.7071
    localparam signed [15:0] W16_7_R = 16'hC4DF, W16_7_I = 16'hE8C5; // -0.9239 - j0.3827

    localparam signed [15:0] ZERO_16 = 16'sd0;

    // =========================================================================
    // STAGE 1: Distance H = 1 (Bit-Reversed Inputs, Twiddles = W16_0)
    // =========================================================================
    // Input pairing follows bit-reversed index map (0,8), (4,12), (2,10), (6,14), (1,9), (5,13), (3,11), (7,15)
    butterfly u1_s1 (.clk(clk), .rst_n(rst_n), .ar(x0_r),  .ai(ZERO_16), .br(x8_r),  .bi(ZERO_16), .wr(W16_0_R), .wi(W16_0_I), .ar_out_reg(s1_r[0]), .ai_out_reg(s1_i[0]), .br_out_reg(s1_r[1]), .bi_out_reg(s1_i[1]), .en(enable));
    butterfly u2_s1 (.clk(clk), .rst_n(rst_n), .ar(x4_r),  .ai(ZERO_16), .br(x12_r), .bi(ZERO_16), .wr(W16_0_R), .wi(W16_0_I), .ar_out_reg(s1_r[2]), .ai_out_reg(s1_i[2]), .br_out_reg(s1_r[3]), .bi_out_reg(s1_i[3]), .en(enable));
    butterfly u3_s1 (.clk(clk), .rst_n(rst_n), .ar(x2_r),  .ai(ZERO_16), .br(x10_r), .bi(ZERO_16), .wr(W16_0_R), .wi(W16_0_I), .ar_out_reg(s1_r[4]), .ai_out_reg(s1_i[4]), .br_out_reg(s1_r[5]), .bi_out_reg(s1_i[5]), .en(enable));
    butterfly u4_s1 (.clk(clk), .rst_n(rst_n), .ar(x6_r),  .ai(ZERO_16), .br(x14_r), .bi(ZERO_16), .wr(W16_0_R), .wi(W16_0_I), .ar_out_reg(s1_r[6]), .ai_out_reg(s1_i[6]), .br_out_reg(s1_r[7]), .bi_out_reg(s1_i[7]), .en(enable));
    butterfly u5_s1 (.clk(clk), .rst_n(rst_n), .ar(x1_r),  .ai(ZERO_16), .br(x9_r),  .bi(ZERO_16), .wr(W16_0_R), .wi(W16_0_I), .ar_out_reg(s1_r[8]), .ai_out_reg(s1_i[8]), .br_out_reg(s1_r[9]), .bi_out_reg(s1_i[9]), .en(enable));
    butterfly u6_s1 (.clk(clk), .rst_n(rst_n), .ar(x5_r),  .ai(ZERO_16), .br(x13_r), .bi(ZERO_16), .wr(W16_0_R), .wi(W16_0_I), .ar_out_reg(s1_r[10]),.ai_out_reg(s1_i[10]),.br_out_reg(s1_r[11]),.bi_out_reg(s1_i[11]), .en(enable));
    butterfly u7_s1 (.clk(clk), .rst_n(rst_n), .ar(x3_r),  .ai(ZERO_16), .br(x11_r), .bi(ZERO_16), .wr(W16_0_R), .wi(W16_0_I), .ar_out_reg(s1_r[12]),.ai_out_reg(s1_i[12]),.br_out_reg(s1_r[13]),.bi_out_reg(s1_i[13]), .en(enable));
    butterfly u8_s1 (.clk(clk), .rst_n(rst_n), .ar(x7_r),  .ai(ZERO_16), .br(x15_r), .bi(ZERO_16), .wr(W16_0_R), .wi(W16_0_I), .ar_out_reg(s1_r[14]),.ai_out_reg(s1_i[14]),.br_out_reg(s1_r[15]),.bi_out_reg(s1_i[15]), .en(enable));

    // =========================================================================
    // STAGE 2: Distance H = 2 (Twiddles = W16_0 & W16_4)
    // =========================================================================
    butterfly u1_s2 (.clk(clk), .rst_n(rst_n), .ar(s1_r[0]),  .ai(s1_i[0]),  .br(s1_r[2]),  .bi(s1_i[2]),  .wr(W16_0_R), .wi(W16_0_I), .ar_out_reg(s2_r[0]), .ai_out_reg(s2_i[0]), .br_out_reg(s2_r[2]),  .bi_out_reg(s2_i[2]), .en(enable));
    butterfly u2_s2 (.clk(clk), .rst_n(rst_n), .ar(s1_r[1]),  .ai(s1_i[1]),  .br(s1_r[3]),  .bi(s1_i[3]),  .wr(W16_4_R), .wi(W16_4_I), .ar_out_reg(s2_r[1]), .ai_out_reg(s2_i[1]), .br_out_reg(s2_r[3]),  .bi_out_reg(s2_i[3]), .en(enable));
    butterfly u3_s2 (.clk(clk), .rst_n(rst_n), .ar(s1_r[4]),  .ai(s1_i[4]),  .br(s1_r[6]),  .bi(s1_i[6]),  .wr(W16_0_R), .wi(W16_0_I), .ar_out_reg(s2_r[4]), .ai_out_reg(s2_i[4]), .br_out_reg(s2_r[6]),  .bi_out_reg(s2_i[6]), .en(enable));
    butterfly u4_s2 (.clk(clk), .rst_n(rst_n), .ar(s1_r[5]),  .ai(s1_i[5]),  .br(s1_r[7]),  .bi(s1_i[7]),  .wr(W16_4_R), .wi(W16_4_I), .ar_out_reg(s2_r[5]), .ai_out_reg(s2_i[5]), .br_out_reg(s2_r[7]),  .bi_out_reg(s2_i[7]), .en(enable));
    butterfly u5_s2 (.clk(clk), .rst_n(rst_n), .ar(s1_r[8]),  .ai(s1_i[8]),  .br(s1_r[10]), .bi(s1_i[10]), .wr(W16_0_R), .wi(W16_0_I), .ar_out_reg(s2_r[8]), .ai_out_reg(s2_i[8]), .br_out_reg(s2_r[10]), .bi_out_reg(s2_i[10]), .en(enable));
    butterfly u6_s2 (.clk(clk), .rst_n(rst_n), .ar(s1_r[9]),  .ai(s1_i[9]),  .br(s1_r[11]), .bi(s1_i[11]), .wr(W16_4_R), .wi(W16_4_I), .ar_out_reg(s2_r[9]), .ai_out_reg(s2_i[9]), .br_out_reg(s2_r[11]), .bi_out_reg(s2_i[11]), .en(enable));
    butterfly u7_s2 (.clk(clk), .rst_n(rst_n), .ar(s1_r[12]), .ai(s1_i[12]), .br(s1_r[14]), .bi(s1_i[14]), .wr(W16_0_R), .wi(W16_0_I), .ar_out_reg(s2_r[12]),.ai_out_reg(s2_i[12]),.br_out_reg(s2_r[14]), .bi_out_reg(s2_i[14]), .en(enable));
    butterfly u8_s2 (.clk(clk), .rst_n(rst_n), .ar(s1_r[13]), .ai(s1_i[13]), .br(s1_r[15]), .bi(s1_i[15]), .wr(W16_4_R), .wi(W16_4_I), .ar_out_reg(s2_r[13]),.ai_out_reg(s2_i[13]),.br_out_reg(s2_r[15]), .bi_out_reg(s2_i[15]), .en(enable));

    // =========================================================================
    // STAGE 3: Distance H = 4 (Twiddles = W16_0, W16_2, W16_4, W16_6)
    // =========================================================================
    butterfly u1_s3 (.clk(clk), .rst_n(rst_n), .ar(s2_r[0]),  .ai(s2_i[0]),  .br(s2_r[4]),  .bi(s2_i[4]),  .wr(W16_0_R), .wi(W16_0_I), .ar_out_reg(s3_r[0]), .ai_out_reg(s3_i[0]), .br_out_reg(s3_r[4]),  .bi_out_reg(s3_i[4]), .en(enable));
    butterfly u2_s3 (.clk(clk), .rst_n(rst_n), .ar(s2_r[1]),  .ai(s2_i[1]),  .br(s2_r[5]),  .bi(s2_i[5]),  .wr(W16_2_R), .wi(W16_2_I), .ar_out_reg(s3_r[1]), .ai_out_reg(s3_i[1]), .br_out_reg(s3_r[5]),  .bi_out_reg(s3_i[5]), .en(enable));
    butterfly u3_s3 (.clk(clk), .rst_n(rst_n), .ar(s2_r[2]),  .ai(s2_i[2]),  .br(s2_r[6]),  .bi(s2_i[6]),  .wr(W16_4_R), .wi(W16_4_I), .ar_out_reg(s3_r[2]), .ai_out_reg(s3_i[2]), .br_out_reg(s3_r[6]),  .bi_out_reg(s3_i[6]), .en(enable));
    butterfly u4_s3 (.clk(clk), .rst_n(rst_n), .ar(s2_r[3]),  .ai(s2_i[3]),  .br(s2_r[7]),  .bi(s2_i[7]),  .wr(W16_6_R), .wi(W16_6_I), .ar_out_reg(s3_r[3]), .ai_out_reg(s3_i[3]), .br_out_reg(s3_r[7]),  .bi_out_reg(s3_i[7]), .en(enable));
    butterfly u5_s3 (.clk(clk), .rst_n(rst_n), .ar(s2_r[8]),  .ai(s2_i[8]),  .br(s2_r[12]), .bi(s2_i[12]), .wr(W16_0_R), .wi(W16_0_I), .ar_out_reg(s3_r[8]), .ai_out_reg(s3_i[8]), .br_out_reg(s3_r[12]), .bi_out_reg(s3_i[12]), .en(enable));
    butterfly u6_s3 (.clk(clk), .rst_n(rst_n), .ar(s2_r[9]),  .ai(s2_i[9]),  .br(s2_r[13]), .bi(s2_i[13]), .wr(W16_2_R), .wi(W16_2_I), .ar_out_reg(s3_r[9]), .ai_out_reg(s3_i[9]), .br_out_reg(s3_r[13]), .bi_out_reg(s3_i[13]), .en(enable));
    butterfly u7_s3 (.clk(clk), .rst_n(rst_n), .ar(s2_r[10]), .ai(s2_i[10]), .br(s2_r[14]), .bi(s2_i[14]), .wr(W16_4_R), .wi(W16_4_I), .ar_out_reg(s3_r[10]),.ai_out_reg(s3_i[10]),.br_out_reg(s3_r[14]), .bi_out_reg(s3_i[14]), .en(enable));
    butterfly u8_s3 (.clk(clk), .rst_n(rst_n), .ar(s2_r[11]), .ai(s2_i[11]), .br(s2_r[15]), .bi(s2_i[15]), .wr(W16_6_R), .wi(W16_6_I), .ar_out_reg(s3_r[11]),.ai_out_reg(s3_i[11]),.br_out_reg(s3_r[15]), .bi_out_reg(s3_i[15]), .en(enable));

    // =========================================================================
    // STAGE 4: Distance H = 8 (Twiddles = W16_0 to W16_7, Outputs = Natural X0..X15)
    // =========================================================================
    butterfly u1_s4 (.clk(clk), .rst_n(rst_n), .ar(s3_r[0]),  .ai(s3_i[0]),  .br(s3_r[8]),  .bi(s3_i[8]),  .wr(W16_0_R), .wi(W16_0_I), .ar_out_reg(X0_r), .ai_out_reg(X0_i), .br_out_reg(X8_r),  .bi_out_reg(X8_i), .en(enable));
    butterfly u2_s4 (.clk(clk), .rst_n(rst_n), .ar(s3_r[1]),  .ai(s3_i[1]),  .br(s3_r[9]),  .bi(s3_i[9]),  .wr(W16_1_R), .wi(W16_1_I), .ar_out_reg(X1_r), .ai_out_reg(X1_i), .br_out_reg(X9_r),  .bi_out_reg(X9_i), .en(enable));
    butterfly u3_s4 (.clk(clk), .rst_n(rst_n), .ar(s3_r[2]),  .ai(s3_i[2]),  .br(s3_r[10]), .bi(s3_i[10]), .wr(W16_2_R), .wi(W16_2_I), .ar_out_reg(X2_r), .ai_out_reg(X2_i), .br_out_reg(X10_r), .bi_out_reg(X10_i), .en(enable));
    butterfly u4_s4 (.clk(clk), .rst_n(rst_n), .ar(s3_r[3]),  .ai(s3_i[3]),  .br(s3_r[11]), .bi(s3_i[11]), .wr(W16_3_R), .wi(W16_3_I), .ar_out_reg(X3_r), .ai_out_reg(X3_i), .br_out_reg(X11_r), .bi_out_reg(X11_i), .en(enable));
    butterfly u5_s4 (.clk(clk), .rst_n(rst_n), .ar(s3_r[4]),  .ai(s3_i[4]),  .br(s3_r[12]), .bi(s3_i[12]), .wr(W16_4_R), .wi(W16_4_I), .ar_out_reg(X4_r), .ai_out_reg(X4_i), .br_out_reg(X12_r), .bi_out_reg(X12_i), .en(enable));
    butterfly u6_s4 (.clk(clk), .rst_n(rst_n), .ar(s3_r[5]),  .ai(s3_i[5]),  .br(s3_r[13]), .bi(s3_i[13]), .wr(W16_5_R), .wi(W16_5_I), .ar_out_reg(X5_r), .ai_out_reg(X5_i), .br_out_reg(X13_r), .bi_out_reg(X13_i), .en(enable));
    butterfly u7_s4 (.clk(clk), .rst_n(rst_n), .ar(s3_r[6]),  .ai(s3_i[6]),  .br(s3_r[14]), .bi(s3_i[14]), .wr(W16_6_R), .wi(W16_6_I), .ar_out_reg(X6_r), .ai_out_reg(X6_i), .br_out_reg(X14_r), .bi_out_reg(X14_i), .en(enable));
    butterfly u8_s4 (.clk(clk), .rst_n(rst_n), .ar(s3_r[7]),  .ai(s3_i[7]),  .br(s3_r[15]), .bi(s3_i[15]), .wr(W16_7_R), .wi(W16_7_I), .ar_out_reg(X7_r), .ai_out_reg(X7_i), .br_out_reg(X15_r), .bi_out_reg(X15_i), .en(enable));

endmodule