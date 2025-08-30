library IEEE;
use IEEE.std_logic_1164.all;

-- Testbenches usually have no ports
entity mux6_tb is
end mux6_tb;

architecture behavior of mux6_tb is
    -- 1. Declare the component (the Unit Under Test, UUT)
    component mux6
        port(
            a1  : in  std_logic_vector(2 downto 0);
            a2  : in  std_logic_vector(2 downto 0);
            a3  : in  std_logic_vector(2 downto 0);
            a4  : in  std_logic_vector(2 downto 0);
            a5  : in  std_logic_vector(2 downto 0);
            a6  : in  std_logic_vector(2 downto 0);
            sel : in  std_logic_vector(2 downto 0);
            b   : out std_logic_vector(2 downto 0)
        );
    end component;

    -- 2. Declare signals to connect to the UUT
    signal a1, a2, a3, a4, a5, a6 : std_logic_vector(2 downto 0);
    signal sel : std_logic_vector(2 downto 0);
    signal b   : std_logic_vector(2 downto 0);

begin
    -- 3. Instantiate the UUT
    uut: mux6
        port map (
            a1  => a1,
            a2  => a2,
            a3  => a3,
            a4  => a4,
            a5  => a5,
            a6  => a6,
            sel => sel,
            b   => b
        );

    -- 4. Stimulus process goes here
    stim_proc : process
    begin
        -- <<< you will write this part >>>
    end process;

end behavior;
