library ieee;
use ieee.std_logic_1164.all;

entity add_shift_tb is
end add_shift_tb;

architecture rtl of add_shift_tb is

	component add_shift 
	    port (
		  p_in_1, p_in_2: in std_logic_vector(3 downto 0);
	      parallel_out : out std_logic_vector(7 downto 0)
	    );
	  end component;

	signal p_in_1 : std_logic_vector(3 downto 0);
	signal p_in_2 : std_logic_vector(3 downto 0);
	signal parallel_out : std_logic_vector(7 downto 0);
begin

	add_shift_1 : add_shift port map (p_in_1 => p_in_1, p_in_2 => p_in_2, parallel_out => parallel_out);
	process begin
	p_in_1 <= "1010";
	p_in_2 <= "1101";
	wait for 10 ns;
	p_in_1 <= "1010";
	p_in_2 <= "0111";
	wait for 10 ns;
	p_in_1 <= "1001";
	p_in_2 <= "1101";
	wait for 10 ns;
	p_in_1 <= "1001";
	p_in_2 <= "0111";
	wait for 10 ns;

	wait;
	end process;
end rtl;

