# 📘 6-Input LUT Based Even Parity Generator – Verilog

## 🔹 Overview

This project implements a **6-input Look-Up Table (LUT) based Even Parity Generator** in Verilog along with a **self-checking testbench**.

The design uses a **User Defined Primitive (UDP)** to describe parity behavior via a truth table.
It demonstrates how LUTs can be modeled in Verilog for combinational logic.

---

## 🔹 Features

* 6 input bits (`a_i` to `f_i`)
* Generates **even parity bit**
* Uses **UDP (primitive)** for LUT-style implementation
* Includes **intentional missing combinations** for verification testing
* Self-checking testbench with random inputs

---

## 🔹 Module Description

### 📌 Inputs

* `a_i, b_i, c_i, d_i, e_i, f_i` → 6-bit input data

### 📌 Outputs

* `parityBit_o` → Even parity output

---

## 🔹 Working Principle

### 🔸 Even Parity Rule

* Parity bit ensures **total number of 1s is even**

### 🔸 Logic Used

* Ideal parity equation:

  ```
  parity = a ⊕ b ⊕ c ⊕ d ⊕ e ⊕ f
  ```
* Implemented using **UDP truth table**

---

## 🔹 LUT (UDP) Implementation

* The `primitive LUTparity` defines output for specific input combinations
* Missing combinations intentionally cause:

  * Unknown (`X`) outputs
  * Helps verify robustness of testbench

⚠️ Note:

> This is for **learning/testing purposes only**.
> Real LUT designs must include all input combinations.

---

## 🔹 Alternative Implementation (Recommended)

A more efficient LUT-based design:

```id="lut_alt"
localparam [63:0] mem = 64'h6996966996696996;
assign pBit = mem[a_i];
```

* Uses a **64-bit memory** for all input combinations
* Faster and compact compared to large truth tables

---

## 🔹 Testbench Details

The testbench (`tb_LUT`) is **self-checking**:

### 🔸 Features

* Random input generation using `$urandom`
* Compares DUT output with expected parity:

  ```
  exp_result = ^a_ti
  ```
* Tracks:

  * Total checks
  * Pass count
  * Fail count

---

## 🔹 Error Detection

Mismatch is reported as:

```id="lut_error"
Error | Time: X | Input: XXXXXX | Output: X, Expected: X
```

Missing LUT entries will intentionally trigger errors.

---

## 🔹 Simulation

### ▶️ Tools

* ModelSim / QuestaSim
* Xilinx Vivado
* Icarus Verilog + GTKWave

### ▶️ Run (Icarus Verilog Example)

```bash id="lut_run"
iverilog -o LUT.vvp LUT.v tb_LUT.v
vvp LUT.vvp
gtkwave evenParity_LUT.vcd
```

---

## 🔹 Output

* Console output using `$monitor`
* Error logs for mismatches
* Final summary:

  ```
  Total Checks: X | Pass: Y, Fail: Z
  ```
* Waveform dump file:

  ```
  evenParity_LUT.vcd
  ```

---

## 🔹 Sample Output Format

```id="lut_sample"
Time: 10 | Input: 101011 | Output: 0
```

---

## 🔹 Applications

* FPGA LUT-based logic design
* Error detection systems
* Digital communication systems
* Educational understanding of LUT behavior

---

## 🔹 Design Insights

* UDP provides low-level control of logic behavior
* Missing truth table entries highlight verification importance
* LUT-based implementation is closer to FPGA architecture
* Memory-based LUT is more scalable than truth tables

---

## 🔹 File Structure

```id="lut_struct"
├── LUT.v                 # LUT + UDP Design
├── tb_LUT.v              # Self-checking Testbench
├── evenParity_LUT.vcd    # Waveform output (generated)
└── README.txt            # Documentation
```
