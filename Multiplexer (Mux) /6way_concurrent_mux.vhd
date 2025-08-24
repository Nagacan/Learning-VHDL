-- 4-way mux using a concurrent representation of SELECT statement

library IEEE;
use IEEE.std_logic_1164.all;
entity mux4 is
port(
  a1      : in  std_logic_vector(2 downto 0);
  a2      : in  std_logic_vector(2 downto 0);
  a3      : in  std_logic_vector(2 downto 0);
  a4      : in  std_logic_vector(2 downto 0);
  sel     : in  std_logic_vector(1 downto 0);
  b       : out std_logic_vector(2 downto 0));
end mux4;
architecture rtl of mux4 is
  -- declarative part: empty
begin
  with sel select
    b <= a1 when "00",
       a2 when "01",
       a3 when "10",
       a4 when others;
end rtl;
