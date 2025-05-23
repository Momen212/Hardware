library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity imem is 
    port (
        pc : in std_logic_vector(31 downto 0); 
        instr : out std_logic_vector(31 downto 0)
    );
end imem;

architecture imem_behave of imem is
    -- Das array von std_logic_vector (also instruktionen Array!!)
    type SPEICHER_MATRIX is array (NATURAL range <>) of std_logic_vector(31 downto 0);

    -- Wir haben hier insgesamt 9 Instruktionen !!  
    constant ram_m : SPEICHER_MATRIX := 
    (
        "00100000000001010000000000000011",
        "00100000000001100000000000000111",
        "10001100101001010000000000000000",
        "10001100110001100000000000000000",
        "10001100110001100000000000000000",
        "00000000101001100011100000100000",
        "10001100111001110000000000000000",
        "00001000000000000000000000000011",
        "00010000101010100000000000000011"
    );

begin
    -- Prozess für den Lesezugriff auf den Speicher
    Lesezugriff: process 
    begin
        -- Warten auf Änderungen am PC also wir warten bis sich der Wert von pc ändert ! 
        wait on pc;
        -- wir divideren die pc durch 4, also shift right 2 !! dann konverten wir zu integer und zugrifen auf das Element in der 
        --Instruktionen Matrix wir speichern das in der instr.
        --das alles passiert nur wenn die index in range ist !! dann könenn wir in es speichern
   	 if to_integer(shift_right(unsigned(pc), 2)) < ram_m'length then 
        instr <= ram_m(to_integer(shift_right(unsigned(pc), 2)));
   	 else
      	  instr <= (others => '0'); -- einfach alles 0 wenn es out of range ist.
   	 end if;
    end process;

end imem_behave;


