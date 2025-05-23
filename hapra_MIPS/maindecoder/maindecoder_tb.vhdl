library ieee;
use ieee.std_logic_1164.all;

entity maindecoder_tb is
end maindecoder_tb;


architecture structure of maindecoder_tb is 

    component maindecoder is 
    port(
	op: in std_logic_vector(5 downto 0);
	memtoreg: out std_logic;
	memwrite: out std_logic;
	branch: out std_logic;
	alusrc: out std_logic;
	regdst: out std_logic;
	regwrite: out std_logic;
	jump: out std_logic;
	aluop: out std_logic_vector(1 downto 0)
    );
    end component;
    

    signal op : std_logic_vector(5 downto 0) := (others => '0');
    signal memtoreg : std_logic := '0';
    signal memwrite : std_logic := '0';
    signal branch : std_logic := '0';
    signal alusrc : std_logic := '0';
    signal regdst : std_logic := '0';
    signal regwrite : std_logic := '0';
    signal jump : std_logic := '0';
    signal aluop : std_logic_vector(1 downto 0) := (others => '0');
begin
    mainde : maindecoder port map (op, memtoreg, memwrite, branch, alusrc, regdst, regwrite, jump, aluop);
    
process begin

	 ------Initialisierung--
	op <= "000000";
	wait for 10 ns;
	op <= "100011";
	wait for 10 ns;
	op <= "101011";
	wait for 10 ns;
	op <= "000100";
	wait for 10 ns;
	op <= "001000";
	wait for 10 ns;
	op <= "000010";
	wait for 10 ns;
	op <= "111111"; -- others !! also hier ist die Ausgabe :- ---------
	wait for 10 ns;
        
        wait;
    end process; 

end structure;

