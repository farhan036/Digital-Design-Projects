# Fixed-Point CORDIC Sine/Cosine Generator

## Project Overview
This repository implements an iterative Fixed-Point CORDIC (Coordinate Rotation Digital Computer) algorithm in Verilog to calculate sine and cosine functions[cite: 1]. It features a fixed-point numerical model, a Verilog testbench, and a MATLAB golden reference script used to validate the hardware design against fixed-point outputs[cite: 2, 3].

---

## File Structure
* **`CORDIC.v`**: Top-level CORDIC module implementing iterative vector rotation using a lookup table (`LUT_ATAN`)[cite: 1].
* **`CORDIC_tb.sv`**: SystemVerilog testbench that reads generated input/expected test vectors, runs the CORDIC module, and checks outputs against tolerance limits.
* **`matlab_model.m`**: MATLAB golden reference script that calculates fixed-point expected outputs and exports hex memory files (`input_angles.hex`, `expected_cos.hex`, `expected_sin.hex`).

---

## Architecture Details

### Fixed-Point Precision & Specifications
* **Input Registers (`x_start`, `y_start`, `z`)**: 16-bit Q1.15 fixed-point representation.
* **Output Registers (`cosine`, `sine`)**: 17-bit Q2.15 signed representation (ranging from -1 to 1)[cite: 1, 2].
* **Scale Factor ($K_n$)**: Initialized with scaling value `16'h4DBA` ($\approx 0.60725$)[cite: 1, 2, 3].
* **Iterations ($N$)**: Parameterized execution, default set to 16 iterations in testbench and MATLAB model[cite: 1, 2, 3].

---

## Verification & Testing Workflow

### 1. Generate Test Vectors (MATLAB)
Run the MATLAB script to create the required test angle vectors and golden output reference files:
```matlab
run('matlab_model.m')
run('CORDIC_tb.sv')
