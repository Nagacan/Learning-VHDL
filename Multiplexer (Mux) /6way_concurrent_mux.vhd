-- 6-way mux using a concurrent representation of SELECT statement
-- so for this 6-1 mux we need 6 bits wide but since its only by 2^(number of bits) we have to go with 3, since 2 isn't enough 2^2=4
-- 2^3=8, which is enough but we have 2 extra ones which we gave to a6 in the extras bucket
-- stdlogicvector does this for us, and you can imagine it as a bus of wires in a cable
-- To address 6 choices uniquely, you need at least 3 bits:
  --2 bits only give 4 choices (not enough).
  --3 bits give 8 choices (more than enough).
  --That’s why sel is std_logic_vector(2 downto 0) (3 bits).

--Think of sel as a binary selector switch:
--sel = "000" → a1
--sel = "001" → a2
--sel = "010" → a3
--sel = "011" → a4
--sel = "100" → a5
--sel = "101" → a6
--sel = "110","111" → a6 (because of `others`)
--It’s like a knob with 8 positions, but you only wired up the first 6.

--sel is 3 bits wide (std_logic_vector(2 downto 0)), which gives you 2^3 = 8 possible values.
--You mapped 6 of those values (000 through 101) to your six inputs (a1 … a6).
--You used others to safely handle the leftover cases (110 and 111).
--Each input (a1 … a6) and output (b) is 3 bits wide, so the mux selects an entire 3-bit bus at once.

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
