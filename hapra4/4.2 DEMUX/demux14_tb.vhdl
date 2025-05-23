library ieee;
use ieee.std_logic_1164.all;

entity demux14_tb is
end demux14_tb;

architecture testbench of demux14_tb is
--missing
	component demux14 is 
		PORT (
        I_n : IN std_logic_vector(2 DOWNTO 0); 
        sel : IN std_logic_vector(1 DOWNTO 0); 
        Y0 : OUT std_logic_vector(2 DOWNTO 0);
        Y1 : OUT std_logic_vector(2 DOWNTO 0);
        Y2 : OUT std_logic_vector(2 DOWNTO 0);
        Y3 : OUT std_logic_vector(2 DOWNTO 0)
        );
	end component;
	signal I_n :  std_logic_vector(2 DOWNTO 0);
	signal sel :  std_logic_vector(1 DOWNTO 0);
	signal Y0 :  std_logic_vector(2 DOWNTO 0);
	signal Y1 :  std_logic_vector(2 DOWNTO 0);
	signal Y2 :  std_logic_vector(2 DOWNTO 0);
	signal Y3 :  std_logic_vector(2 DOWNTO 0);
	
Begin
	demux14_output: demux14 port map ( I_n => I_n , sel => sel ,Y0 =>Y0,Y1 =>Y1,Y2 =>Y2,Y3 =>Y3);
	
	    process begin
    --setting the input values
        I_n <= "100";
        --switching which input is propagated
        sel <= "00";
        wait for 10 ns;
        sel <= "01";
        wait for 10 ns;
        sel <= "10";
        wait for 10 ns;
        sel <= "11";
        wait for 10 ns;
        sel <= "10";
        wait for 10 ns;
	    sel <= "11";
        wait for 10 ns;
        		
        wait;
    end process;
end testbench;