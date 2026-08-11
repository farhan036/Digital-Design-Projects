# 16-Point Radix-2 Pipelined DIT FFT Accelerator

## Project Overview
This repository contains a 16-point Radix-2 Decimation-in-Time (DIT) Fast Fourier Transform (FFT) hardware architecture implemented in Verilog. Designed for high-throughput streaming digital signal processing, the architecture utilizes a 4-stage fully unrolled pipeline operating on 16-bit Q1.14 fixed-point complex numbers. It includes validation testbenches and MATLAB verification scripts to measure system Signal-to-Quantization-Noise Ratio (SQNR) and error against floating-point models.

---

## Technical Specifications
* **Architecture**: Pipelined, fully unrolled Radix-2 DIT FFT (32 total butterfly processors).
* **Data Format**: Signed 16-bit Q1.14 fixed-point ($1\text{ sign/integer bit}, 14\text{ fractional bits}$, range $[-1.0, +1.0)$).
* **Latency**: 4 clock cycles (1 cycle per pipeline stage).
* **Throughput**: 1 complete 16-point transform per clock cycle (streaming mode).
* **Fixed-Point Scaling**: 17-bit intermediate arithmetic with a $1/2$ right-shift per stage (overall hardware scale factor: $1/16$).
* **Twiddle Memory Efficiency**: Stored twiddle factors use half-period symmetry $W_N^{k+N/2} = -W_N^k$ to reduce memory footprint by 50%.

---

## File Structure

### Hardware Logic (RTL)
* **`butterfly.v`**: Atomic butterfly processing element. Executes complex multiplication $(B \times W)$ and complex addition/subtraction $(A \pm BW)$ with intermediate overflow protection and pipeline registers.
* **`top_fft_16.v`**: Top-level 16-point FFT pipeline module interconnecting 32 butterfly instances across 4 stages with bit-reversed input mapping and natural-order output wiring.
* **`top.v`**: Standard 8-point FFT core module for scaled testing.

### Testbenches & Simulation
* **`FFT_tb_16.v`**: Testbench for the 16-point FFT pipeline. Loads input vectors from hex files, drives execution across clock edges, and logs hex results.
* **`FFT_tb.v`**: Debug testbench designed to monitor inter-stage outputs on the 8-point FFT architecture.

### MATLAB System Verification
* **`Model16_point.m`**: MATLAB verification tool that synthesizes Q1.14 test signals, calculates golden reference values, parses RTL simulation output (`fft16_rtl_outputs.hex`), and plots frequency bins alongside per-bin SQNR calculations.
* **`Model.m`**: Verification and plotting script tailored for 8-point test cases.
* **`FFT_16Point_Design_Report.pdf`**: Design documentation covering mathematical derivations, fixed-point precision tradeoffs, and datapath routing schemes.

---

## Datapath Architecture

### Butterfly Calculation Unit
Each `butterfly.v` module implements the fundamental Radix-2 execution steps:

1. **Complex Multiply**:
   $$\text{Re}(B \cdot W) = b_r w_r - b_i w_i$$
   $$\text{Im}(B \cdot W) = b_r w_i + b_i w_r$$
   Multiplying two Q1.14 numbers generates 32-bit Q2.28 intermediate values (`bw_r_full`, `bw_i_full`). Bit slice `[29:14]` extracts the scaled 16-bit Q1.14 word.

2. **Bit-Growth Overflow Guard**:
   Addition and subtraction paths sign-extend the operands to 17 bits (`sum_r`, `diff_r`).

3. **Stage Re-scaling**:
   Arithmetic right shifts (`>>> 1`) scale values down back to 16-bit constraints, introducing a predictable per-stage scaling factor of $1/2$.
## Hardware Execution Workflow

### 1. Vector Generation & System Reference (MATLAB)
Run the verification script to synthesize sample signals and build golden hex vectors:
```matlab
run('Model16_point.m')
### 2. Run TestBench
```
Run the FFT_tb_16 to Check  
```matlab
run('FFT_tb_16.v')
