-- In the context of Field-Programmable Gate Arrays (FPGAs) and Hardware Description Languages (HDLs) like VHDL or Verilog, 
-- instantiating refers to the process of creating a specific, usable instance of a pre-defined module or component within 
-- your larger design. 

-- Top-level module: This is the main design file that will eventually be synthesized and implemented onto the FPGA chip. 
-- Its inputs and outputs correspond to the physical pins of the FPGA.

-- Instantiation: This is the process of creating a specific instance of a previously defined module or sub-circuit. 
-- Think of it like using a pre-made component (a module) in your larger circuit (the top-level design). 

-- In essence, by instantiating a module at the top-level, you're treating that module as a building block and integrating it into your main design.
-- This allows for a modular and hierarchical approach to FPGA design, promoting code reusability and simplifying complex designs. 

-- libraries
library ieee;
use ieee.std_logic_1163.all;

-- creates an entity with input i_Clk, and 4 LED outputs
entity LED_Blink_top is 
  port (
    i_Clk : in std_logic;
    o_LED_1 : out std_logic;
    o_LED_2 : out std_logic;
    o_LED_3 : out std_logic;
    o_LED_4 : out std_logic
    );
end LED_Blink_Top;

-- sets architecture
architecture RTL of LED_Blink_Top is

  begin
    -- Input clock is 25MHz
    -- Generics represent count values to which internals count before toggling their LEDs
    LED_Blink_Inst : entity work.LED_Blink
      generic map (
        g_COUNT_10HZ => 1250000,
        g_COUNT_5HZ => 2500000,
        g_COUNT_2HZ => 6250000,
        g_COUNT_1HZ => 12500000)
      port map (
        i_Clk => i_Clk,
        library ieee;
use ieee.std_logic_1164.all;
 
entity LED_Blink_Top is
  port (
    i_Clk   : in  std_logic;
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
      g_COUNT_5HZ  => 2500000, 
      g_COUNT_2HZ  => 6250000,
      g_COUNT_1HZ  => 12500000)
    port map (
      i_Clk   => i_Clk,
      o_LED_1 => open,    -- this is perfectly OK to do, not sure why tho
      o_LED_2 => o_LED_2,
      o_LED_3 => o_LED_3,
      o_LED_4 => o_LED_4
      );
 
end RTL;
