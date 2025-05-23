library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity dmem_tb is
end dmem_tb;

architecture structure of dmem_tb is 
component dmem
       port (clk : in std_logic;
        memwrite : in std_logic;
        aluout : in std_logic_vector(31 downto 0); 
        writedata : in std_logic_vector(31 downto 0);
        readdata : out std_logic_vector(31 downto 0)
     );
end component;


signal clk, memwrite : std_logic;
signal aluout, writedata, readdata : std_logic_vector(31 downto 0);


begin

dmmem1: dmem port map(clk, memwrite, aluout, writedata, readdata);
	
  process begin
  	-- ich werde die Zahl 6 in register 2 speichern
	clk <= '0';
	memwrite <= '1';
	aluout <= "00000000000000000000000000000010"; 
	writedata <= "00000000000000000000000000000110"; 
	wait for 10 ns;
	clk <= '1';
	memwrite <= '1';
	aluout <= "00000000000000000000000000000010";
	writedata <= "00000000000000000000000000000110";
	wait for 10 ns;
	--wir lesen die 6 aus Register 2
	clk <= '0';
	memwrite <= '0';
	aluout <= "00000000000000000000000000000010";
	writedata <= "00000000000000000000000000000110"; 
	wait for 10 ns;
	wait;
	
	end process; 
end structure;

