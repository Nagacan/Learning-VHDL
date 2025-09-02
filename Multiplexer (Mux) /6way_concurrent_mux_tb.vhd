library IEEE;
use IEEE.std_logic_1164.all;

entity tb_mux6 is
-- no ports in a testbench
end tb_mux6;

architecture sim of tb_mux6 is
  -- Component under test
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

  -- Signals for DUT
  signal a1_s, a2_s, a3_s, a4_s, a5_s, a6_s : std_logic_vector(2 downto 0);
  signal sel_s : std_logic_vector(2 downto 0);
  signal b_s   : std_logic_vector(2 downto 0);

begin
  -- Instantiate DUT
  uut: mux6
    port map (
      a1 => a1_s,
      a2 => a2_s,
      a3 => a3_s,
      a4 => a4_s,
      a5 => a5_s,
      a6 => a6_s,
      sel => sel_s,
      b => b_s
    );

  -- Stimulus
  stim_proc: process
  begin
    -- Set input values
    a1_s <= "000";
    a2_s <= "001";
    a3_s <= "010";
    a4_s <= "011";
    a5_s <= "100";
    a6_s <= "101";

    -- Cycle through sel, a1_s -> a_5
    sel_s <= "000"; wait for 10 ns;
    sel_s <= "001"; wait for 10 ns;
    sel_s <= "010"; wait for 10 ns;
    sel_s <= "011"; wait for 10 ns;
    sel_s <= "100"; wait for 10 ns;
    sel_s <= "101"; wait for 10 ns;
    -- these should go to a6_s as we gave it already 110,111,101  
    sel_s <= "110"; wait for 10 ns;
    sel_s <= "111"; wait for 10 ns;

    -- Finish simulation
    wait; -- wait makes it so that it doesn't loop
  end process;

end sim;
