`timescale 1ns / 1ps

module cordic_tb;

    parameter N          = 32;          // 32 CORDIC Iterations
    parameter CLK_PERIOD = 10;
    parameter NUM_TESTS  = 21;
    parameter KN_Q3_29   = 32'h136E9DBB; // Kn ≈ 0.607252935 in Q3.29 (or 32'h4DBA76D4 in Q1.31)
    parameter TOLERANCE  = 32'd500;     // Adjusted bit-exact tolerance for 32-bit precision

    reg         clk;
    reg         rst_n;
    
    // Inputs: 32-bit Signed (Q3.29 in Radians)
    reg  signed [31:0] x_start;
    reg  signed [31:0] y_start;
    reg  signed [31:0] z;

    // Outputs: 33-bit Signed (Q2.30)
    wire signed [32:0] cosine;
    wire signed [32:0] sine;

    // Testbench Memories
    reg signed [31:0] angle_mem [0:NUM_TESTS-1]; // 32-bit inputs
    reg signed [32:0] gold_cos  [0:NUM_TESTS-1]; // 33-bit expected outputs
    reg signed [32:0] gold_sin  [0:NUM_TESTS-1]; // 33-bit expected outputs
    
    integer i, pass_count = 0, fail_count = 0;
    longint signed_cos_dut, signed_cos_gold;
    longint signed_sin_dut, signed_sin_gold;
    longint err_cos, err_sin;

    // Instantiate 32-bit DUT
    cordic #(.N(N)) dut (
        .clk(clk), 
        .rst_n(rst_n),
        .x_start(x_start), 
        .y_start(y_start), 
        .z(z),
        .cosine(cosine), 
        .sine(sine)
    );

    always #(CLK_PERIOD/2) clk = ~clk;

    initial begin
        clk = 0; rst_n = 0;
        
        // Load updated 32-bit / 33-bit hex files
        $readmemh("input_angles.hex", angle_mem);
        $readmemh("expected_cos.hex", gold_cos);
        $readmemh("expected_sin.hex", gold_sin);

        $display("---------------------------------------------------------");
        $display("   VERIFYING 32-BIT CORDIC AGAINST MATLAB GOLDEN MODEL   ");
        $display("---------------------------------------------------------");

        for (i = 0; i < NUM_TESTS; i = i + 1) begin
            // Apply new inputs
            rst_n   = 1'b0;
            x_start = KN_Q3_29;
            y_start = 32'sd0;
            z       = angle_mem[i];
            #(CLK_PERIOD * 2);

            // Release reset & execute N iterations
            rst_n = 1'b1;
            #(CLK_PERIOD * (N + 3)); // N cycles + 1 pipeline + pre/post-processing

            // Cast to 64-bit signed integers for absolute difference calculation
            signed_cos_dut  = $signed(cosine);
            signed_cos_gold = $signed(gold_cos[i]);
            signed_sin_dut  = $signed(sine);
            signed_sin_gold = $signed(gold_sin[i]);

            err_cos = (signed_cos_dut > signed_cos_gold) ? 
                      (signed_cos_dut - signed_cos_gold) : (signed_cos_gold - signed_cos_dut);

            err_sin = (signed_sin_dut > signed_sin_gold) ? 
                      (signed_sin_dut - signed_sin_gold) : (signed_sin_gold - signed_sin_dut);

            if (err_cos <= TOLERANCE && err_sin <= TOLERANCE) begin
                $display("[PASS] Vector %2d | Angle: 32'h%08h | DUT (Cos: 33'h%09h, Sin: 33'h%09h)", 
                        i, angle_mem[i], cosine, sine);
                pass_count = pass_count + 1;
            end else begin
                $display("[FAIL] Vector %2d | Angle: 32'h%08h | Expected (Cos: 33'h%09h, Sin: 33'h%09h) | Got (Cos: 33'h%09h, Sin: 33'h%09h)", 
                        i, angle_mem[i], gold_cos[i], gold_sin[i], cosine, sine);
                fail_count = fail_count + 1;
            end
        end

        $display("---------------------------------------------------------");
        $display("MATLAB COMPARISON SUMMARY: %0d PASSED, %0d FAILED", pass_count, fail_count);
        $display("---------------------------------------------------------");
        $finish;
    end

endmodule
