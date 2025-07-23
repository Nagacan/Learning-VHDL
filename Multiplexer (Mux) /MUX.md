A mux is like a selector, and acts like a railroad switch, where the source tracks can be connected to a source track to a single destination track. The railroad switch controls via some control outside. 

In other words, two inputs can be connected to a single output. 

<p align="center">
<img width="206" height="179" alt="image" src="https://github.com/user-attachments/assets/d65e91b1-dfd2-4deb-a3a0-b470ef37af98" />

Here this is a 2 to 1 mux, where "A, B, sel" are the inputs to the mux, and the output is "out". 

A and B are data inputs that get selected to the ouput and sel is the control signal. 

Typically some number of inputs can be selected to a single output, but the reverse could be true and it would be considered a mux. A single input could be selected to any number of outputs. 

All the code uses combinational code, no clocks needed in the design. Ensure that when you write your combinational code that your assignments are complete. An incomplete assignment can generate a latch, which you almost surely do not want to do. It is important to note that a mux is not actually a dedicated piece of logic on your FPGA. A mux is constructed out of Look-Up Table (LUT) elements inside your chip.

**Latches** should never be used in FGPA design. Here is an example of a Gated D latch. A Gated D latch has two inputs, D-data, and E-enable input. It has one ouput Q and only gets the value of D when Enable is 1. If enable is 0, output does not change, and keeps its previous value (latch; output is latched when enable is low)

