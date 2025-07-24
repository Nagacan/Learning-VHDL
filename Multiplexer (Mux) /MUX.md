A mux is like a selector, and acts like a railroad switch, where two possible source tracks can be connected to a single destination track. The railroad switch controls via some external control which train gets to connect to the destination track. This exact same concept is used with a 2-1 Mux. Two inputs can connect to a single output. 

In other words, two inputs can be connected to a single output. 

<p align="center">
<img width="206" height="179" alt="image" src="https://github.com/user-attachments/assets/d65e91b1-dfd2-4deb-a3a0-b470ef37af98" />

Here this is a 2 to 1 mux, where "A, B, sel" are the inputs to the mux, and the output is "out". 

A and B are data inputs that get selected to the ouput and sel is the control signal. 

Typically some number of inputs can be selected to a single output, but the reverse could be true and it would be considered a mux. A single input could be selected to any number of outputs. 

All the code uses combinational code, no clocks needed in the design. Ensure that when you write your combinational code that your assignments are complete. An incomplete assignment can generate a latch, which you almost surely do not want to do. It is important to note that a mux is not actually a dedicated piece of logic on your FPGA. A mux is constructed out of Look-Up Table (LUT) elements inside your chip.

**Latches** should never be used in FGPA design. Here is an example of a Gated D latch. A Gated D latch has two inputs, D-data, and E-enable input. It has one ouput Q and only gets the value of D when Enable is 1. If enable is 0, output does not change, and keeps its previous value (latch; output is latched when enable is low)

In general, when trying to answer the question, “Should this be in its own module?” you should ask yourself how often is the code going to be reused and if making it a dedicated module will be easier than writing the code each time you need it. For a mux, it’s actually more code to make it portable, rather than just designing a mux where and when you need it.

# VHDL Implementation of Multiplexers

## Simple 2 to 1 MUX in VHDL:

```
library ieee;
use ieee.std_logic_1164.all;

entity Mux_2_to_1 is
  port (
    i_select : in std_logic;
    i_data1 : in std_logic
    i_data2 : in std_logic;
    o_data : out std_logic
    );
end entity Mux_2_to_1;

architecture RTL of Mux_2_to_1 is
begin
  o_data <= i_data1 when i_select = '0' else i_data2;
end architecture RTL;

```

## 2 to 1 Mux in VHDL (using std_logic_vector):

```
library ieee;
use ieee.std_logic_1164.all;

entity Mux_2_to_1_width is
  generic (
    g_WIDTH : integer :=8); -- Override when instantiated
  port (
    i_select : in std_logic;
    i_data1: in std_logic_vector(g_WIDTH-1 downto 0);
    i_data2: in std_logic_vector(g_WIDTH-1 downto 0);
    o_data : out std_logic_vector(g_WIDTH-1 downto 0)
    );
end entity Mux_2_to_1_Width;

architecture RTL of Mux_2_to_1 is
begin
  o_data <= i_data1 when i_select = '0' else i_data2;
end architecture RTL;
```

## 4 to 1 Mux in VHDL:

```
library ieee;
use ieee.std_logic_1164.all;

entity Mux_4_to_1 is
  port (
    i_select : in std_logic_vector(1 downto 0);
    i_data1 : in std_logic;
    i_data2 : in std_logic;
    i_data3 : in std_logic;
    0_data : out std_logic
    );
end entity Mux_4_to_1;

archirwcture RTL of Mux_4to_1 is
begin
