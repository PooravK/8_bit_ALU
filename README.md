 # 8-bit ALU (arithmetic logic unit) Design:
 A fully functional 8-bit ALU implemented in verilog supporting arithmetic and logical operations along with CPU style flag checks.

 Ever since I started delving into VLSI building a functional ALU has always been a goal and a challenge for me, to understand modular block generation, flag generation,
 which are essential basics as I journey towards building my own CPU design and more advanced processor designs.

  # Features:
   - Unsigned 8-bit operation
   - Arithmetic operations such as ADD and SUB
   - Logical operations such as AND, OR, XOR and XNOR
   - Flag outputs for: Zero and Overflow
   - MUX based operation selection

 # Architecture:
 This ALU is designed by combining several sub-modules for each arithmetic and logical operation. Separate blocks were built for separate functions such as:
  - RCA adder module for addition
  - Implementing 2's complement in the RCA module for subtraction
  - ADD, OR, XOR, XNOR modules
  - and finally a top multiplexer which selectes the desired operation using an input sel signal.
 ![Block Diagram](https://github.com/user-attachments/assets/cf7fe719-8d20-45e5-94f3-b05e415343b6)

 # Results:
  - ![Simulation outputs](https://github.com/user-attachments/assets/2ff7cb18-07f0-4472-8a9c-9513ab978c43)
  - ![Waveform outputs](https://github.com/user-attachments/assets/256e5cfa-b011-4c15-b71a-566ea61e8a27)

 # Future plans:
  - Plan to integrate signed operations
  - Plan to add bit-shift operations
  - Plan to add negative flag check
  - Potentially integrate with a simple CPU design after finishing the improvements

 # License:
  - MIT License
