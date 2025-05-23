library ieee;
use ieee.std_logic_1164.all;

entity D_Latch_tb is
end D_Latch_tb;

architecture testbench of D_Latch_tb is

component D_Latch is
    port (
      D,clk : in std_logic;
      Q,not_Q : out std_logic
    );
  end component;

signal D, clk, Q, not_Q : std_logic;

begin

d1 : D_Latch port map(D => D, clk => clk,Q => Q, not_Q => not_Q);
d2 : D_Latch port map(D => D, clk => clk,Q => Q, not_Q => not_Q);
d3 : D_Latch port map(D => D, clk => clk,Q => Q, not_Q => not_Q);
d4 : D_Latch port map(D => D, clk => clk,Q => Q, not_Q => not_Q);

    process begin
        clk <= '1';
        d <= '0';
        wait for 10 ns;
        clk <= '0';
        d <= '0';
        wait for 10 ns;
        clk <= '1';
        d <= '0';
        wait for 10 ns;
        clk <= '0';
        d <= '1';
        wait for 10 ns;
        clk <= '1';
        d <= '1';
        wait for 10 ns;
		clk <= '0';
        d <= '0';
        wait for 10 ns;
        wait;
    end process;
end testbench;
