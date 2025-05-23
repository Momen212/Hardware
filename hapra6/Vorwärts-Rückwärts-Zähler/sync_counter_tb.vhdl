library ieee;
use ieee.std_logic_1164.all;

entity sync_counter_tb is
end sync_counter_tb;

architecture tb of sync_counter_tb is
    component sync_counter is
        port(
            reset, clk, C, D : in std_logic;
            q1, q0 : out std_logic
        );
    end component;
-- missing
signal  reset, clk, C, D , q1 , q0 : std_logic;
    begin

        rbt : sync_counter port map (reset => reset, clk => clk, C => C, D => D, q1 => q1, q0 => q0);
        process begin
	
    reset <= '1'; --zuerst reseten wir alles 
    C <= '0';
    D <= '0';
    clk <= '0';
    wait for 10 ns;
    C <= '0';
    D <= '0';
    clk <= '1';
    wait for 10 ns ;
    C <= '0';
    D <= '0';
    clk <= '0';
    wait for 10 ns ;
	reset <= '0';
    C <= '1';
    D <= '0';
    clk <= '0';
    wait for 10 ns;
    C <= '1';
    D <= '0';
    clk <= '1';
    wait for 10 ns ;
    C <= '1';
    D <= '0';
    clk <= '0';
    wait for 10 ns ;
    C <= '1';
    D <= '0';
    clk <= '1';
    wait for 10 ns ;
    C <= '1';
    D <= '0';
    clk <= '0';
    wait for 10 ns;
    C <= '1';
    D <= '0';
    clk <= '1';
    wait for 10 ns ;
    C <= '1';
    D <= '0';
    clk <= '0';
    wait for 10 ns ;
    C <= '1';
    D <= '0';
    clk <= '1';
    wait for 10 ns ;
    C <= '1';
    D <= '1';
    clk <= '0';
    wait for 10 ns;
    C <= '1';
    D <= '1';
    clk <= '1';
    wait for 10 ns ;
    C <= '1';
    clk <= '0';
    wait for 10 ns ;
    C <= '1';
    clk <= '1';
    wait for 10 ns ;
    C <= '1';
    D <= '0';
    clk <= '0';
    wait for 10 ns;
    C <= '1';
    clk <= '1';
    wait for 10 ns ;
    C <= '1';
    clk <= '0';
    wait for 10 ns ;
    C <= '1';
    clk <= '1';
    wait for 10 ns ;
    C <= '1';
    clk <= '0';
    wait for 10 ns ;
    C <= '1';
    clk <= '1';
    wait for 10 ns ;
    wait;
        end process;
end tb;
