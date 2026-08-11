`timescale 1ns / 1ps

module cordic_tb;

    parameter N = 16;
    parameter CLK_PERIOD = 10;
    parameter NUM_TESTS  = 21; // Total Spec Test Cases from MATLAB
    parameter KN_Q1_15   = 16'h4DBA;
    parameter TOLERANCE  = 16'd60; // Tolerance for bit-exact fixed-point match

    reg         clk;
    reg         rst_n;
    // Inputs: 16-bit Q1.15
    reg  signed [15:0] x_start;
    reg  signed [15:0] y_start;
    reg  signed [15:0] z;

    // Outputs: 17-bit Q2.15
    wire signed [16:0] cosine;
    wire signed [16:0] sine;

    // Memories
    reg signed [15:0] angle_mem [0:NUM_TESTS-1]; // 16-bit inputs
    reg signed [16:0] gold_cos  [0:NUM_TESTS-1]; // 17-bit golden model
    reg signed [16:0] gold_sin  [0:NUM_TESTS-1]; // 17-bit golden model
    integer i, pass_count = 0, fail_count = 0;
    integer signed_cos_dut, signed_cos_gold;
    integer signed_sin_dut, signed_sin_gold;
    integer err_cos, err_sin;

    // Instantiate DUT
    cordic #(.N(N)) dut (
        .clk(clk), .rst_n(rst_n),
        .x_start(x_start), .y_start(y_start), .z(z),
        .cosine(cosine), .sine(sine)
    );

    always #(CLK_PERIOD/2) clk = ~clk;

    initial begin
        clk = 0; rst_n = 0;
        
        // Load golden reference vectors exported by MATLAB
        $readmemh("input_angles.hex", angle_mem);
        $readmemh("expected_cos.hex", gold_cos);
        $readmemh("expected_sin.hex", gold_sin);

        $display("---------------------------------------------------------");
        $display("   VERIFYING VERILOG CORDIC AGAINST MATLAB GOLDEN MODEL  ");
        $display("---------------------------------------------------------");

        for (i = 0; i < NUM_TESTS; i = i + 1) begin
            // Reset and apply new angle vector
            rst_n   = 1'b0;
            x_start = KN_Q1_15;
            y_start = 16'sd0;
            z       = angle_mem[i];
            #(CLK_PERIOD * 2);

            // Release reset & execute N iterations
            rst_n = 1'b1;
            #(CLK_PERIOD * (N + 2));

            // Cast to signed integers for exact signed difference calculation
            signed_cos_dut  = $signed(cosine);
            signed_cos_gold = $signed(gold_cos[i]);
            signed_sin_dut  = $signed(sine);
            signed_sin_gold = $signed(gold_sin[i]);

            err_cos = (signed_cos_dut > signed_cos_gold) ? 
                      (signed_cos_dut - signed_cos_gold) : (signed_cos_gold - signed_cos_dut);

            err_sin = (signed_sin_dut > signed_sin_gold) ? 
                      (signed_sin_dut - signed_sin_gold) : (signed_sin_gold - signed_sin_dut);

            if (err_cos <= TOLERANCE && err_sin <= TOLERANCE) begin
                $display("[PASS] Vector %2d | Angle: 16'h%04h | DUT (Cos: 17'h%05h, Sin: 17'h%05h)", 
                        i, angle_mem[i], cosine, sine);
                pass_count = pass_count + 1;
            end else begin
                $display("[FAIL] Vector %2d | Angle: 16'h%h | Expected (Cos: 17'h%h, Sin: 17'h%h) | Got (Cos: 17'h%h, Sin: 17'h%h)", 
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