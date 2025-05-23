library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity imem_tb is
end imem_tb;

architecture structure of imem_tb is
    
    component imem
        port(
            pc : in std_logic_vector(31 downto 0);
            instr : out std_logic_vector(31 downto 0) 
        );
    end component;

    -- Die Signale !
    signal pc : std_logic_vector(31 downto 0);
    signal instr : std_logic_vector(31 downto 0);

begin
    
    instrmom: imem port map(pc, instr);
    
    process
    begin
        -- Wir testen mit diesen 6 Verschieden AdressWerten (Achtung :- alle zahlen hier müssen durch 4 teilbaren !! also mit Rest 0)
        pc <= "00000000000000000000000000010000"; -- Index 4
        wait for 10 ns;
        pc <= "00000000000000000000000000011000"; -- Index 6
        wait for 10 ns;
        pc <= "00000000000000000000000000100000"; -- Index 8
        wait for 10 ns;
        pc <= "00000000000000000000000000101000"; -- Index 10 -- out of bound, also nicht in range
        wait for 10 ns;
        pc <= "00000000000000000000000000110000"; -- Index 12 -- out of bound, also nicht in range
        wait for 10 ns;

        wait;
    end process;
end structure;

