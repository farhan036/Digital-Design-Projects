# Digital Design Projects

A collection of digital design, RTL, computer architecture, hardware acceleration, and FPGA projects developed using Verilog/SystemVerilog and related hardware-design tools.

The repository is organized into separate projects, ranging from fundamental digital systems and communication interfaces to pipelined processors, hardware accelerators, and DSP architectures.

---

## 📂 Projects

| # | Project | Description |
|---|---|---|
| 01 | [MobileViT AI Hardware Accelerator](#01--mobilevit-ai-hardware-accelerator) | Hardware accelerator for MobileViT neural-network inference |
| 02 | [MIPS Pipelined Processor](#02--mips-pipelined-processor) | Pipelined MIPS processor implementation |
| 03 | [STREAMED Intermediate Result Processing Unit](#03--streamed-intermediate-result-processing-unit) | Streaming hardware processing unit |
| 04 | [8-bit Pipelined Processor](#04--8-bit-pipelined-processor) | Pipelined 8-bit processor implemented in Verilog |
| 05 | [Low-Power Multi-Clock Digital](#05--low-power-multi-clock-digital) | Low-power multi-clock digital design |
| 06 | [CORDIC](#06--cordic) | Hardware implementation of CORDIC algorithms |
| 07 | [16-Point FFT](#07--16-point-fft) | Fully pipelined Radix-2 16-point FFT |
| 08 | [Single-Cycle RV32I Processor](#08--single-cycle-rv32i-processor) | Single-cycle RISC-V RV32I processor |
| 09 | [Asynchronous FIFO](#09--asynchronous-fifo) | Clock-domain-crossing asynchronous FIFO |
| 10 | [SPI](#10--spi) | SPI communication interface |
| 11 | [UART](#11--uart) | UART communication interface |
| 12 | [Spartan-6 DSP48A1](#12--spartan-6-dsp48a1) | FPGA DSP48A1-based design |

---

# 01 · MobileViT AI Hardware Accelerator

A hardware accelerator project targeting MobileViT neural-network inference.

The project contains RTL, testbench, Python modeling, documentation, and implementation-related files.

### Main Areas

- Hardware acceleration
- Neural-network inference
- RTL design
- SystemVerilog / Verilog
- FPGA-oriented implementation
- Python modeling
- Hardware/software co-design

The project is maintained as a separate repository and included here as a Git submodule.

---

# 02 · MIPS Pipelined Processor

A pipelined MIPS processor implementation developed as a computer-architecture and RTL design project.

### Main Concepts

- MIPS ISA
- Pipeline architecture
- Instruction Fetch
- Instruction Decode
- Execute
- Memory
- Write Back
- Pipeline registers
- Forwarding
- Hazard handling
- Branch handling
- RTL implementation
- Processor verification

The project is maintained as a separate repository and included here as a Git submodule.

---

# 03 · STREAMED Intermediate Result Processing Unit

A streaming hardware processing unit designed for intermediate-result processing.

### Main Concepts

- Streaming datapath
- RTL design
- Pipelined processing
- Hardware data processing
- Verilog/SystemVerilog
- Testbench-based verification

The project is maintained as a separate repository and included here as a Git submodule.

---

# 04 · 8-bit Pipelined Processor

An 8-bit pipelined processor implemented in Verilog.

### Main Concepts

- 8-bit datapath
- Processor architecture
- Pipelining
- RTL design
- Instruction processing
- Verilog
- Simulation and verification

The project is maintained as a separate repository and included here as a Git submodule.

---

# 05 · Low-Power Multi-Clock Digital

A digital design project focused on multi-clock and low-power-oriented hardware design.

### Main Concepts

- Multiple clock domains
- Clock management
- Low-power digital design
- RTL architecture
- Clock-domain considerations
- Verilog/SystemVerilog

---

# 06 · CORDIC

A hardware implementation of the CORDIC algorithm.

CORDIC (Coordinate Rotation Digital Computer) provides an efficient method for performing mathematical operations using iterative shift-and-add operations.

### Main Concepts

- CORDIC algorithm
- Iterative hardware architecture
- Shift-and-add arithmetic
- Fixed-point arithmetic
- RTL design
- Verilog
- Mathematical hardware accelerators

### Applications

CORDIC architectures can be used for operations such as:

- Trigonometric functions
- Vector rotation
- Angle calculation
- Coordinate transformation

---

# 07 · 16-Point FFT

A fully-unrolled and fully-pipelined **16-point Radix-2 Decimation-in-Time FFT** implemented in Verilog.

### Architecture

```text
                 16 Inputs
                     │
                     ▼
             ┌───────────────┐
             │    Stage 1    │
             │  8 Butterflies│
             └───────┬───────┘
                     │
                     ▼
             ┌───────────────┐
             │    Stage 2    │
             │  8 Butterflies│
             └───────┬───────┘
                     │
                     ▼
             ┌───────────────┐
             │    Stage 3    │
             │  8 Butterflies│
             └───────┬───────┘
                     │
                     ▼
             ┌───────────────┐
             │    Stage 4    │
             │  8 Butterflies│
             └───────┬───────┘
                     │
                     ▼
                X0 ... X15
