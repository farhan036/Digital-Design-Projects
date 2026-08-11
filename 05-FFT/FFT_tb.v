`timescale 1ns/1ps

module tb_FFT();

      reg clk, rst_n;
    reg signed [15:0] x0_r, x1_r, x2_r, x3_r, x4_r, x5_r, x6_r, x7_r;
    wire signed [15:0] X0_r, X1_r, X2_r, X3_r, X4_r, X5_r, X6_r, X7_r;
    wire signed [15:0] X0_i, X1_i, X2_i, X3_i, X4_i, X5_i, X6_i, X7_i;

    reg [15:0] inputs [0:7];
    integer file_out;

    // Instantiate Top FFT Module
    FFT uut (
        .clk(clk), .rst_n(rst_n),
        .x0_r(x0_r), .x1_r(x1_r), .x2_r(x2_r), .x3_r(x3_r),
        .x4_r(x4_r), .x5_r(x5_r), .x6_r(x6_r), .x7_r(x7_r),
        .X0_r(X0_r), .X1_r(X1_r), .X2_r(X2_r), .X3_r(X3_r),
        .X4_r(X4_r), .X5_r(X5_r), .X6_r(X6_r), .X7_r(X7_r),
        .X0_i(X0_i), .X1_i(X1_i), .X2_i(X2_i), .X3_i(X3_i),
        .X4_i(X4_i), .X5_i(X5_i), .X6_i(X6_i), .X7_i(X7_i)
    );

    // Clock Generation (Period = 10ns)
    always #5 clk = ~clk;

    initial begin
        clk = 0; rst_n = 0;
        x0_r = 0; x1_r = 0; x2_r = 0; x3_r = 0;
        x4_r = 0; x5_r = 0; x6_r = 0; x7_r = 0;

        $readmemh("fft_inputs.hex", inputs);
        
        #20; rst_n = 1;
        
        // -------------------------------------------------------------
        // STEP 1: Apply Inputs
        // -------------------------------------------------------------
        @(posedge clk);
        #1;
        x0_r = inputs[0]; x1_r = inputs[1]; x2_r = inputs[2]; x3_r = inputs[3];
        x4_r = inputs[4]; x5_r = inputs[5]; x6_r = inputs[6]; x7_r = inputs[7];

        $display("\n=======================================================");
        $display("               FFT DEBUG MONITOR CONSOLE               ");
        $display("=======================================================");
        $display("[TIME %0t ns] Inputs Applied:", $time);
        $display("x0=%04X, x1=%04X, x2=%04X, x3=%04X, x4=%04X, x5=%04X, x6=%04X, x7=%04X\n", 
                 x0_r, x1_r, x2_r, x3_r, x4_r, x5_r, x6_r, x7_r);

        // -------------------------------------------------------------
        // STEP 2: Monitor Stage 1 Outputs (After 1st Clock)
        // -------------------------------------------------------------
        @(posedge clk);
        #1;
        $display("[TIME %0t ns] STAGE 1 OUTPUTS (Real | Imag):", $time);
        $display("u1_s1: ar=%04X ai=%04X | br=%04X bi=%04X", uut.ar_u1_s1, uut.ai_u1_s1, uut.br_u1_s1, uut.bi_u1_s1);
        $display("u2_s1: ar=%04X ai=%04X | br=%04X bi=%04X", uut.ar_u2_s1, uut.ai_u2_s1, uut.br_u2_s1, uut.bi_u2_s1);
        $display("u3_s1: ar=%04X ai=%04X | br=%04X bi=%04X", uut.ar_u3_s1, uut.ai_u3_s1, uut.br_u3_s1, uut.bi_u3_s1);
        $display("u4_s1: ar=%04X ai=%04X | br=%04X bi=%04X\n", uut.ar_u4_s1, uut.ai_u4_s1, uut.br_u4_s1, uut.bi_u4_s1);

        // -------------------------------------------------------------
        // STEP 3: Monitor Stage 2 Outputs (After 2nd Clock)
        // -------------------------------------------------------------
        @(posedge clk);
        #1;
        $display("[TIME %0t ns] STAGE 2 OUTPUTS (Real | Imag):", $time);
        $display("u1_s2: ar=%04X ai=%04X | br=%04X bi=%04X", uut.ar_u1_s2, uut.ai_u1_s2, uut.br_u1_s2, uut.bi_u1_s2);
        $display("u2_s2: ar=%04X ai=%04X | br=%04X bi=%04X", uut.ar_u2_s2, uut.ai_u2_s2, uut.br_u2_s2, uut.bi_u2_s2);
        $display("u3_s2: ar=%04X ai=%04X | br=%04X bi=%04X", uut.ar_u3_s2, uut.ai_u3_s2, uut.br_u3_s2, uut.bi_u3_s2);
        $display("u4_s2: ar=%04X ai=%04X | br=%04X bi=%04X\n", uut.ar_u4_s2, uut.ai_u4_s2, uut.br_u4_s2, uut.bi_u4_s2);

        // -------------------------------------------------------------
        // STEP 4: Monitor Stage 3 (Final Outputs) (After 3rd Clock)
        // -------------------------------------------------------------
        @(posedge clk);
        #1;
        $display("[TIME %0t ns] STAGE 3 FINAL OUTPUTS (Real Imag):", $time);
        $display("X0 = %04X %04X", X0_r, X0_i);
        $display("X1 = %04X %04X", X1_r, X1_i);
        $display("X2 = %04X %04X", X2_r, X2_i);
        $display("X3 = %04X %04X", X3_r, X3_i);
        $display("X4 = %04X %04X", X4_r, X4_i);
        $display("X5 = %04X %04X", X5_r, X5_i);
        $display("X6 = %04X %04X", X6_r, X6_i);
        $display("X7 = %04X %04X\n", X7_r, X7_i);
        $display("=======================================================\n");

        // Write to Output Hex File
        file_out = $fopen("fft_rtl_outputs.hex", "w");
        $fdisplay(file_out, "%04X %04X", X0_r, X0_i);
        $fdisplay(file_out, "%04X %04X", X1_r, X1_i);
        $fdisplay(file_out, "%04X %04X", X2_r, X2_i);
        $fdisplay(file_out, "%04X %04X", X3_r, X3_i);
        $fdisplay(file_out, "%04X %04X", X4_r, X4_i);
        $fdisplay(file_out, "%04X %04X", X5_r, X5_i);
        $fdisplay(file_out, "%04X %04X", X6_r, X6_i);
        $fdisplay(file_out, "%04X %04X", X7_r, X7_i);
        $fclose(file_out);

        $finish;
    end

endmodule