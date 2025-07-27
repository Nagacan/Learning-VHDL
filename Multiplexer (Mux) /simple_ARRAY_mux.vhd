-- If the number of the MUX input is a power of two, we can take advantage of the VHDL syntax.
-- To take advantage of the power of two number of input, we use the VHDL array structure.
-- In the VHDL code below, we define a user type that is an array of a signal using the same VHDL type of the MUX input.
-- The selector signal will be used as the index of the array.

library ieee ;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity mux4 is
port(
  d0     : in  std_logic_vector(1 downto 0);
  d1     : in  std_logic_vector(1 downto 0);
  d2     : in  std_logic_vector(1 downto 0);
  d3     : in  std_logic_vector(1 downto 0);
  s      : in  std_logic_vector(1 downto 0);
  m      : out std_logic_vector(1 downto 0));
end mux4;
architecture rtl of mux4 is
type t_array_mux is array (0 to 3) of std_logic_vector(1 downto 0);
signal array_mux  : t_array_mux;
begin
  array_mux(0)  <= d0;
  array_mux(1)  <= d1;
  array_mux(2)  <= d2;
  array_mux(3)  <= d3;
  m <= array_mux(to_integer(unsigned(s)));
  
end rtl;
