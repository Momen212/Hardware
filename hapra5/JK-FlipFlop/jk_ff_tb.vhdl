library ieee;
use ieee.std_logic_1164.all;

entity jk_ff_tb is
end jk_ff_tb;

architecture testbench of jk_ff_tb is

component JK_FlipFlop is
    port (
      J,K, clk , reset : in std_logic;
      Q : out std_logic
    );
end component;

signal J,K, clk, reset, Q: std_logic;

begin

jk_ff_1 : JK_FlipFlop port map(J => J, K => K, clk => clk,reset => reset, Q => Q);

  process begin
            
        J <= '0';
        K <= '0';
        clk <= '0';
        reset <= '0';
        wait for 10 ns;
        J <= '0';
        K <= '1';
        clk <= '1';
        reset <= '0';
        wait for 10 ns;
        J <= '1';
        K <= '0';
        clk <= '0';
        wait for 10 ns;
        J <= '1';
        K <= '1';
        clk <= '1';
        wait for 10 ns;
        J <= '1';
        K <= '1';
        clk <= '0';
        reset <= '1';
        wait for 10 ns;
        J <= '1';
        K <= '0';
        clk <= '1';
        wait for 10 ns;
        J <= '0';
        K <= '1';
        clk <= '0';
        wait for 10 ns;
        J <= '0';
        K <= '0';
        clk <= '1';
        wait for 10 ns;
        wait;
    end process;
   
end testbench;
