library IEEE;
use IEEE.std_logic_1164.all;

entity xor_gate_test is
end xor_gate_test;

architecture behavior of xor_gate_test is
    -- component declaration for the unit under test (UUT)
    component xor_gate
        port(
            a : in std_logic;
            b : in std_logic;
            c : out std_logic
        );
    end component;

    -- inputs
    signal a : std_logic := '0';
    signal b : std_logic := '0';

    -- outputs
    signal c : std_logic;

begin

    -- instantiate the unit under test (UUT)
    uut : xor_gate
        port map (
            a => a,
            b => b,
            c => c
        );

    -- stimulus process
    stim_proc : process
    begin
        a <= '0'; b <= '0';    wait for 100 ns;

        a <= '0'; b <= '1';    wait for 100 ns;

        a <= '1'; b <= '0';    wait for 100 ns;

        a <= '1'; b <= '1';    wait for 100 ns;

        wait;
    end process;

end behavior;
