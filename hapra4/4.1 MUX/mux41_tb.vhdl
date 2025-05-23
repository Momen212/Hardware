library ieee;
use ieee.std_logic_1164.all;

entity mux41_tb is
end mux41_tb;

architecture testbench of mux41_tb is
  component mux41
    port (
--missing
	    i0 : IN std_logic_vector(2 DOWNTO 0); 
        i1 : IN std_logic_vector(2 DOWNTO 0);
        i2 : IN std_logic_vector(2 DOWNTO 0);
        i3 : IN std_logic_vector(2 DOWNTO 0);
        sel : IN std_logic_vector(1 DOWNTO 0); 
        y : OUT std_logic_vector(2 DOWNTO 0)
        
    );
  end component;

--missing (signals)
       signal i0 :  std_logic_vector(2 DOWNTO 0); 
       signal i1 :  std_logic_vector(2 DOWNTO 0);
       signal i2 : std_logic_vector(2 DOWNTO 0);
       signal i3 :  std_logic_vector(2 DOWNTO 0);
       signal sel : std_logic_vector(1 DOWNTO 0); 
       signal y : std_logic_vector(2 DOWNTO 0);
	

begin
    multiplex: mux41 port map(i0 => i0, i1 => i1, i2 => i2, i3 => i3, sel => sel, y => y);

    process begin
    --setting the input values
        i0 <= "000";
        i1 <= "001";
        i2 <= "010";
        i3 <= "011";
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
