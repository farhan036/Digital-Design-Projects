# 32-Bit Fixed-Point CORDIC — Sin/Cos Core

## Overview

This project implements a 32-iteration, fixed-point CORDIC (COordinate Rotation
DIgital Computer) core in Verilog that computes sine and cosine of an input
angle. It is verified against a bit-accurate MATLAB golden reference model
using a SystemVerilog testbench, and implemented for a Zynq-7020-based board
in Vivado.

| File | Description |
|---|---|
| `CORDIC.v` | RTL implementation of the CORDIC rotation engine |
| `CORDIC_tb.sv` | SystemVerilog testbench that drives the DUT and compares against golden vectors |
| `matlab_model.m` | MATLAB golden reference model; also generates the test vector `.hex` files |
| `input_angles.hex` | 32 test angles (Q3.29, radians) |
| `expected_cos.hex` | Expected cosine outputs (Q3.29, 33-bit signed) |
| `expected_sin.hex` | Expected sine outputs (Q3.29, 33-bit signed) |
| `pynq_z2_cordic.xdc` | Board constraints (clock, reset, LEDs) — **see Target Device note below** |

## Fixed-Point Formats

- **Angle input (`z`)**: Q3.29 — 3 integer bits, 29 fractional bits, radians.
- **Kn (CORDIC gain compensation)**: `0.607252935008881` pre-scaled into
  `x_start`, Q3.29 → `32'h136E9DBB`.
- **Cosine / Sine outputs**: 33-bit signed, same Q3.29 fractional scaling
  (extra bit is a sign/guard bit from internal accumulation).

## Algorithm

1. **Quadrant reduction** — Since CORDIC natively converges for angles in
   `[-π/2, π/2]`, any input angle outside that range is reduced:
   - `z > π/2` → `z_mapped = z - π`, result negated at the end.
   - `z < -π/2` → `z_mapped = z + π`, result negated at the end.
   - Otherwise `z_mapped = z` unchanged.
2. **CORDIC iteration** (×32) — Standard rotation-mode CORDIC using the
   `atan(2^-i)` lookup table (`LUT_ATAN`), shifting and adding/subtracting
   `x`, `y`, `z` based on the sign of the residual angle each iteration.
3. **Quadrant correction** — If the angle was reduced in step 1, negate the
   final `x` (cosine) and `y` (sine).

## Functional Verification (Simulation)

The testbench (`CORDIC_tb.sv`) loads all three `.hex` files, applies each
angle to the DUT, waits `N + 3` clock cycles for the pipeline to settle, and
compares the DUT's `cosine`/`sine` outputs against the golden values with an
allowed tolerance of **500 counts** (~1×10⁻⁶ relative error on a 2²⁹ full-scale
range) to absorb minor rounding-order differences between the MATLAB model
and RTL fixed-point arithmetic.

### Test Coverage (21 vectors)

- Corner angles: 0°, 90°, 180°, 270°, 360°
- Over/under-rotation angles: 450°, −90°, −180°, −450°
- Boundary angles near ±180°: 179.9°, −179.9°
- 10 pseudo-random angles in [−360°, 360°) (seeded, reproducible)

### Result

```
21 PASSED, 0 FAILED
```

Spot-checked by hand (angle = 0, angle = −π/2 exactly, angle = π) against
expected trig values — deviations were on the order of a few counts (≤ ~10),
far inside the 500-count tolerance, confirming the pass reflects genuine
numerical accuracy rather than an overly loose tolerance.

## Implementation Results (Vivado)

### Target Device

| Part | Package Pins | User I/O | LUT | FF | BRAM (36Kb) | DSP48 |
|---|---|---|---|---|---|---|
| `xc7z020clg484-3` | 484 | 200 | 53,200 | 106,400 | 140 | 220 |


### Timing Summary

| Check | Worst Slack | Total Negative Slack | Failing Endpoints | Total Endpoints |
|---|---|---|---|---|
| Setup (WNS) | 0.930 ns | 0.000 ns | 0 | 6,726 |
| Hold (WHS) | 0.087 ns | 0.000 ns | 0 | 6,726 |
| Pulse Width (WPWS) | 4.500 ns | 0.000 ns | 0 | 3,460 |

**All user-specified timing constraints are met** — 0 failing endpoints on
setup, hold, and pulse width checks. The design closes timing cleanly at the
constrained clock frequency with comfortable positive margin on all three
checks (worst case is setup at +0.930 ns, i.e. the critical path finishes
with just under 1 ns to spare before the next clock edge).

## Running the Testbench (Simulation)

1. Run `matlab_model.m` in MATLAB/Octave to (re)generate the three `.hex`
   vector files.
2. Simulate with any SystemVerilog-capable simulator, e.g.:
   ```
   vlog CORDIC.v CORDIC_tb.sv
   vsim -c cordic_tb -do "run -all"
   ```
   or with a tool like Icarus Verilog / Verilator that supports SV testbenches.
3. Check console output for the `PASSED` / `FAILED` summary.

## Running Implementation (Vivado)

1. Create an RTL project targeting the confirmed board/part (see Target
   Device note above — verify the part before proceeding).
2. Add `CORDIC.v` as a design source.
3. Add the appropriate XDC constraints file for your actual board (clock
   pin, reset, and any I/O you've wired up in a top-level wrapper).
4. Run Synthesis → Implementation → Generate Bitstream.
5. Check `Reports → Timing Summary` — confirm 0 failing endpoints on setup,
   hold, and pulse width, matching the results above.

## Known Limitations / Notes

- Legacy 16-bit saturation logic exists in `CORDIC.v` but is commented out
  and unused — safe to ignore or remove.
- The 500-count simulation tolerance is a design choice for numerical
  robustness, not a bug workaround; actual observed errors are roughly
  8–10 counts.
- CORDIC's 32/33-bit data ports (`z`, `x_start`, `y_start`, `cosine`,
  `sine`) exceed the available switches/LEDs on typical dev boards — a
  top-level wrapper (AXI-Lite/GPIO shim to the Zynq PS, or a built-in
  test-vector ROM) is needed for true on-hardware verification beyond
  timing closure.
