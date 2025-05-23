library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity dmem is 
	port (
		clk : in std_logic;
		memwrite : in std_logic;
		aluout : in std_logic_vector(31 downto 0);
		writedata : in std_logic_vector(31 downto 0);
		readdata : out std_logic_vector(31 downto 0)
	      );
end dmem;


architecture dmem_behave of dmem is

type SPEICHER_MATRIX is array (31 downto 0) of std_logic_vector(31 downto 0);

	signal ram_m : SPEICHER_MATRIX; -- ram also ist type speicher matrix

begin

process(clk, memwrite) -- wir warten auf die Änderung der Signalen clk, memwrite

begin
	if(memwrite = '1' and rising_edge(clk)) then -- wenn mem write 1 und clk von 0 auf 1 gegangen ist :- 
		ram_m(to_integer(shift_right(unsigned(aluout),2))) <= writedata; -- dann divideren wir die aluout durch 4
		-- und kovertiren wir es zu int and zugruen wir auf das element und speichern dort die writedata
		
	else if(memwrite = '0') then -- else, also wenn memwrite 0 ist :- 
		readdata <= ram_m(to_integer(shift_right(unsigned(aluout),2))); -- dann speciehrn wir in readdata
		--die ram_m mit index alouout durch 4 dividert und zu integer konvertiert ! 
	end if;
	end if;
end process;

end dmem_behave;

