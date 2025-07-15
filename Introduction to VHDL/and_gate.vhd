-- This is a simple AND Gate with 2 inputs (input 1/2) and an output (and_result) --
-- A simple And Gate has two inputs and one output. --
-- The output is equal to 1 only when both of the inputs are equal to 1. --

library ieee;
use ieee.std_logic_1164.all;

entity example_and is
  port(
    input1 : in std_logic;
    input2 : in std_logic;
    and_result : out std_logic
      ); 
  end example_and;

architecture rtl of example_and is
  signal and_gate : std_logic;
begin
  and_gate <= input1 and input2;
  and_result <= and_gate;
end rtl;
