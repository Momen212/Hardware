library ieee;
use ieee.std_logic_1164.all;

entity ps_ff_tb is
end ps_ff_tb;

architecture testbench of ps_ff_tb is

component ps_ff is
    port (
      d, clk, reset: in std_logic;
      Q, not_Q : out std_logic
    );
  end component;
  
signal d, clk, Q, not_Q, reset: std_logic;

begin
   
ps_ff_1 : ps_ff port map(d => d, clk => clk, reset => reset,Q => Q, not_Q => not_Q);

  process begin
  
        clk <= '0';
        d <= '0';
        reset <= '0';
        wait for 10 ns;
        clk <= '0';
        d <= '1';
        reset <= '0';
        wait for 10 ns;
        clk <= '1';
        d <= '1';
        reset <= '0';
        wait for 10 ns;
        clk <= '0';
        d <= '1';
        wait for 10 ns;
        clk <= '1';
        d <= '1';
        wait for 10 ns;
        clk <= '0';
        d <= '1';
        reset <= '1';
        wait for 10 ns;
        clk <= '1';
        d <= '1';
        wait for 10 ns;
        clk <= '0';
        d <= '0';
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
