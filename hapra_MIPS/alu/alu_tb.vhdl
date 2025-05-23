library ieee;
use ieee.std_logic_1164.all;

entity alu_tb is 
end alu_tb;

architecture behavior of alu_tb is

    component alu is 
    port(
   	 a: in std_logic_vector(31 downto 0);
	 b: in std_logic_vector(31 downto 0);
	 alucontrol: in std_logic_vector(2 downto 0);
         result: buffer std_logic_vector(31 downto 0);
	 zero: out std_logic
    );
    end component;
    
    signal a : std_logic_vector(31 downto 0) := (others => '0');
    signal b : std_logic_vector(31 downto 0) := (others => '0');
    signal alucontrol : std_logic_vector(2 downto 0) := (others => '0');  
    signal result : std_logic_vector(31 downto 0) := (others => '0');
    signal zero : std_logic := '0';

begin
    alu_1 : alu port map (a => a, b => b, alucontrol => alucontrol, result => result, zero => zero);


    process begin
    
	wait for 10 ns;
	a <= "01101011001010110110101100101011";
	b <= "11001100101010101001001000111010";
	alucontrol <= "000"; -- 1 case
	wait for 10 ns;
	alucontrol <= "001"; -- 2 case
	wait for 10 ns;
	alucontrol <= "010"; -- 3 case
	wait for 10 ns;
	alucontrol <= "001"; -- 4 case
	wait for 10 ns;
	alucontrol <= "110"; -- 5 case
	wait for 10 ns;
	alucontrol <= "111"; -- 6 case
	wait for 10 ns;
	alucontrol <= "011"; -- others
	wait for 10 ns;
	a <= "11111111111111110000000000000000";
	b <= "00000000000000001111111111111111";
	alucontrol <= "000";
	wait for 10 ns;
	
        wait;
    end process; 
    
end behavior; 

