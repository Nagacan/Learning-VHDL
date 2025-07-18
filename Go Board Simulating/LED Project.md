## Project Description
# Make LEDS on the Go Board blink at different rates: 1, 2, 5, and 10 Hz

<p align="center">
<img width="269" height="208" alt="image" src="https://github.com/user-attachments/assets/e8160ac8-2b37-47a6-81ec-c0912a66af85" />

Since we are using all 4 LEDs, we need to **keep the state of each LED individually**

Each LED **blinks at different rates**, so we will need to keep counters to keep track of time for each LED

Use this link for VHDL [https://www.edaplayground.com/. ](https://www.edaplayground.com/x/W8L)

On this website there will be two files, the file on the right "design.vhd" is the LED blinking code, and the one on the left is the testbench code, "testbench.vhd".

The testbench file stimulates your UUT to test it. We will be looking at how the UUT responds to stimulus and verifying that it is behaving as you expect it to. 

**This code won't be used to build the FPGA, it's not going to be synthesized. **

A generic is used to make the code portable and reusable. If your clock frequency changes, you dont have to change values inside the VHDL code, instead just modify the generics, which can be set by the instantiating module. The testbench sets the generics to values that are smaller than the values that we will use for synthesis. The purpose of this is to speed up simulation time. If the simulation needed to count 2 million it would take a long time. 

In the testbench exists:
```
r_clock <= not r_Clock after c_CLK_Period/2;
```
This line of code is not synthesizable. It is for simulation only. The word `after` relies on time. Since FPGA has no knowledge of time, and can only count clock cycles (which is hohw it will keep track of time).

## Running the Simulation
To run it click the run button at the top. EPwave should open and we can look at the waveforms to verify everything is behaving as expected. Click get signals to look at, then clock LED_blink_insta, then click append all. You should be able to see the waveforms now. The waveforms has counters inside the code that should be counting correcly and the LEds should be toggling. 


Now we need to instantiate the file at the top-level of our FPGA design. This is required because we need to set the generics to their correct value. Let’s look at that code.

In the context of Field-Programmable Gate Arrays (FPGAs) and Hardware Description Languages (HDLs) like VHDL or Verilog, instantiating refers to the process of creating a specific, usable instance of a pre-defined module or component within your larger design

## VHDL Code – LED_Blink_Top.vhd:
```
library ieee;
use ieee.std_logic_1164.all;
 
entity LED_Blink_Top is
  port (
    i_Clk   : in  std_logic;
    o_LED_1 : out std_logic;
    o_LED_2 : out std_logic;
    o_LED_3 : out std_logic;
    o_LED_4 : out std_logic
    );
end LED_Blink_Top;
 
architecture RTL of LED_Blink_Top is
 
begin
 
  -- Input clock is 25 MHz
  -- Generics represent count values to which internals count
  -- before toggling their LEDs
  LED_Blink_Inst : entity work.LED_Blink 
    generic map (
      g_COUNT_10HZ => 1250000,
      g_COUNT_5HZ  => 2500000, 
      g_COUNT_2HZ  => 6250000,
      g_COUNT_1HZ  => 12500000)
    port map (
      i_Clk   => i_Clk,
      o_LED_1 => open,    -- this is perfectly OK to do
      o_LED_2 => o_LED_2,
      o_LED_3 => o_LED_3,
      o_LED_4 => o_LED_4
      );
 
end RTL;
```
