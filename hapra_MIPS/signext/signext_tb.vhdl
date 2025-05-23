library ieee;
use ieee.std_logic_1164.all;

entity signext_tb is 
end signext_tb;

architecture behavior of signext_tb is

    component signext is 
    port(
   	 a: in std_logic_vector(15 downto 0);
    	aext: out std_logic_vector(31 downto 0)
    );
    end component;
    
    signal a : std_logic_vector(15 downto 0) := (others => '0');
    signal aext : std_logic_vector(31 downto 0) := (others => '0');

begin
    verz : signext port map (a => a, aext => aext);


    process begin
    
	wait for 10 ns;
	a <= "0110101100101011";
	wait for 10 ns;
	a <= "1100110011001100";
	wait for 10 ns;
	a <= "0101010101010101";
	wait for 10 ns;

        wait;
    end process; 
    
end behavior; 

