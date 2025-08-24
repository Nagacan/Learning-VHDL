-- 6-way mux using a concurrent representation of SELECT statement

library IEEE;
use IEEE.std_logic_1164.all;
entity mux6 is
port(
  a1      : in  std_logic_vector(2 downto 0);
  a2      : in  std_logic_vector(2 downto 0);
  a3      : in  std_logic_vector(2 downto 0);
  a4      : in  std_logic_vector(2 downto 0);
  a5      : in  std_logic_vector(2 downto 0);
  a6      : in  std_logic_vector(2 downto 0);
  sel     : in  std_logic_vector(2 downto 0);
  b       : out std_logic_vector(2 downto 0));
end mux6;
architecture rtl of mux6 is
  -- declarative part: empty
begin
  with sel select
    b <= a1 when "000",
       a2 when "001",
       a3 when "010",
       a4 when "011",
       a5 when "100",
       a6 when others;
end rtl;

-- so for this 6-1 mux we need 6 bits wide but since its only by 2^(number of bits) we have to go with 3, since 2 isn't enough 2^2=4
-- 2^3=8, which is enough but we have 2 extra ones which we gave to a6 in the extras bucket
-- stdlogicvector does this for us, and you can imagine it as a bus of wires in a cable
-- To address 6 choices uniquely, you need at least 3 bits:
  --2 bits only give 4 choices (not enough).
  --3 bits give 8 choices (more than enough).
  --That’s why sel is std_logic_vector(2 downto 0) (3 bits).

--Think of sel as a binary selector switch:
--sel = "000" → connect a1 to the output
--sel = "001" → connect a2 to the output
--sel = "010" → connect a2 to the output
--sel = "011" → connect a2 to the output
--sel = "100" → connect a2 to the output
--sel = "101" → connect a6 to the output
--sel = "110" or "111" → fall back to the others case
--It’s like a knob with 8 positions, but you only wired up the first 6.
