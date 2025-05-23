library ieee;
use ieee.std_logic_1164.all;

entity aludecoder_tb is
end aludecoder_tb;


architecture structure of aludecoder_tb is 

    component aludecoder is 
    port(
	  funct: in std_logic_vector(5 downto 0);
	  aluop: in std_logic_vector(1 downto 0);
	  alucontrol: out std_logic_vector(2 downto 0)
    );
    end component;
    

    signal funct : std_logic_vector(5 downto 0) := (others => '0');
    signal aluop : std_logic_vector(1 downto 0) := (others => '0');
    signal alucontrol : std_logic_vector(2 downto 0) := (others => '0');
begin
    alucod : aludecoder port map (funct, aluop, alucontrol);
    
process begin

	 ------Initialisierung--
	aluop <= "00";
	wait for 10 ns;
	aluop <= "01";
	wait for 10 ns;
	aluop <= "11"; -- others in aloup, jetzt beginnt die funct case! 
	wait for 10 ns;
	funct <= "100000"; 
	wait for 10 ns;
	funct <= "100010"; 
	wait for 10 ns;
	funct <= "100100"; 
	wait for 10 ns;
	funct <= "100101"; 
	wait for 10 ns;
	funct <= "101010"; 
	wait for 10 ns;
        funct <= "000000"; -- others in funct !!
	wait for 10 ns;
        
        wait;
    end process; 

end structure;

