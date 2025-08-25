library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_mux6 is
end tb_mux6;

architecture Behavioral of tb_mux6 is

component and_gate is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           C : out  STD_LOGIC);
end component;

signal A1,B1,C1 : std_logic := '0';

begin

--Instantiate the unit under test(the module we want to test)
ANDGATE : and_gate port map(
				A => A1,
				B => B1,
				C => C1);

Stimulus_process: process
begin
	A1 <= '0';	B1 <= '0';   wait for 100 ns;
	A1 <= '0';	B1 <= '1';   wait for 100 ns;
	A1 <= '1';	B1 <= '0';   wait for 100 ns;
	A1 <= '1';	B1 <= '1';   wait for 100 ns;
	wait;

end process;

end Behavioral;
