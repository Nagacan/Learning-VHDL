Latches are created when you create a combinational process or conditional assignment in VHDL, or a combinational always block in Verilog with an output that is not assigned under all possible input conditions. 

This creates an incomplete assignment by the synthesis tools and the assignment of the output is not complete under all input possibilities:
