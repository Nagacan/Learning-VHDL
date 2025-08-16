-- Code your design here
library IEEE;
use IEEE.std_logic_1164.all;

entity xor_gate is
    port (
        a : in STD_LOGIC;
        b : in STD_LOGIC;
        c : out STD_LOGIC
    );
end xor_gate;

architecture behavioral of xor_gate is
begin
    c <= a xor b;
end behavioral;
