library ieee;
use ieee.std_logic_1164.all;

entity datapath_tb is
end datapath_tb;

architecture test of datapath_tb is
  component datapath
    port(
      clk: in STD_LOGIC;
      reset: in STD_LOGIC;
      memtoreg: STD_LOGIC;
      pcsrc: STD_LOGIC;
      alusrc: in STD_LOGIC;
      regdst: in STD_LOGIC;
      regwrite: in STD_LOGIC;
      jump: in STD_LOGIC;
      alucontrol: in STD_LOGIC_VECTOR(2 downto 0);
      readdata: in STD_LOGIC_VECTOR(31 downto 0);
      instr: in STD_LOGIC_VECTOR(31 downto 0);
      zero: out STD_LOGIC;
      pc: buffer STD_LOGIC_VECTOR(31 downto 0);
      aluout: buffer STD_LOGIC_VECTOR(31 downto 0);
      writedata: buffer STD_LOGIC_VECTOR(31 downto 0)        
    );
  end component;

signal clk_t, reset_t, memtoreg_t, pcsrc_t, alusrc_t, regdst_t, regwrite_t, jump_t: STD_LOGIC;
signal alucontrol_t: STD_LOGIC_VECTOR(2 downto 0);
signal instr_t, readdata_t: STD_LOGIC_VECTOR(31 downto 0);

signal zero_t: std_logic;
signal pc_t: STD_LOGIC_VECTOR(31 downto 0);
signal aluout_t, writedata_t: STD_LOGIC_VECTOR(31 downto 0);


begin
  datapath_test: datapath
    port map(clk_t, reset_t, memtoreg_t, pcsrc_t, alusrc_t, regdst_t, 
    regwrite_t, jump_t, alucontrol_t, instr_t, readdata_t, zero_t,
    pc_t, aluout_t, writedata_t
    );

  process begin
    -- store to registers
    -- ich will die Zaheln 2 , 6 speicheren.
    --Die Zahl 2 in register 7 speichern :-
    
	clk_t <= '0';
	reset_t <= '1';
	memtoreg_t <= '0';
	pcsrc_t <= '0';
	alusrc_t <= '1';
	jump_t <= '0';
	alucontrol_t <= "001";
	readdata_t <= "00000000000000000000000000000000";
	regwrite_t <= '1';
	regdst_t <= '0';
	instr_t(31 DOWNTO 16) <= "0000000000000111"; -- DIE REGISTER 7
	instr_t(15 DOWNTO 0) <= "0000000000000010"; --DIE ZAHL 2
	wait for 10 ns;
	clk_t <= '1';
	reset_t <= '0';
	alusrc_t <= '1';
	alucontrol_t <= "001";
	regwrite_t <= '1';
	regdst_t <= '0';
	instr_t(31 DOWNTO 16) <= "0000000000000111"; -- DIE REGISTER 7
	instr_t(15 DOWNTO 0) <= "0000000000000010"; --DIE ZAHL 2
	wait for 10 ns;
	
	--Die Zahl 6  in Register 8 speichern :-
    
	clk_t <= '0';
	reset_t <= '1';
	memtoreg_t <= '0';
	pcsrc_t <= '0';
	alusrc_t <= '1';
	jump_t <= '0';
	alucontrol_t <= "001";
	readdata_t <= "00000000000000000000000000000000";
	regwrite_t <= '1';
	regdst_t <= '0';
	instr_t(31 DOWNTO 16) <= "0000000000001000"; -- DIE REGESTER 8
	instr_t(15 DOWNTO 0) <= "0000000000000110"; --DIE ZAHL 6
	wait for 10 ns;
	clk_t <= '1';
	reset_t <= '0';
	alusrc_t <= '1';
	alucontrol_t <= "001";
	regwrite_t <= '1';
	regdst_t <= '0';
	instr_t(31 DOWNTO 16) <= "0000000000001000"; -- DIE REGESTER 8
	instr_t(15 DOWNTO 0) <= "0000000000000110"; --DIE ZAHL 6
	wait for 10 ns;
	

    -- read from registers
    -- wir lesen jetzt beide register 7 und register 8
    	-- Auslesen von register 8 (die zahl 6)
	clk_t <= '0';
	reset_t <= '0';
	alusrc_t <= '1';
	alucontrol_t <= "001";
	regwrite_t <= '1';
	regdst_t <= '0';
	instr_t(31 DOWNTO 16) <= "0000000100001000"; 
	instr_t(15 DOWNTO 0) <= "0000000000000000"; 
	wait for 10 ns;
	-- Auslesen von register 7 (die zahl 2)
	clk_t <= '0';
	reset_t <= '0';
	alusrc_t <= '1';
	alucontrol_t <= "001";
	regwrite_t <= '1';
	regdst_t <= '0';
	instr_t(31 DOWNTO 16) <= "0000000011100111"; 
	instr_t(15 DOWNTO 0) <= "0000000000000000"; 
	wait for 10 ns;

    -- addition of registers and storing the result
    -- wir addieren register 8 und register 7 (die zahlen 6 und 2) und speichern das Ergebnis in Register 5 !!
    	clk_t <= '0';
    	reset_t <= '0';
    	alucontrol_t <= "010"; -- das ist die control-signal damit wir die zwei register addieren !
    	alusrc_t <= '0';
    	regwrite_t <= '1';
	regdst_t <= '1';
	instr_t(31 DOWNTO 16) <= "0000000100000111"; -- WIR SUMMIEREN DIE REGISTER 7 UND DIE REGISTER 8
	instr_t(15 DOWNTO 0) <= "0010100000000000"; --DIE SUMME IN REGISTER 5
	wait for 10 ns;
	clk_t <= '1';
	reset_t <= '0';
	alusrc_t <= '0';
	alucontrol_t <= "010";
	regwrite_t <= '1';
	regdst_t <= '1';
	instr_t(31 DOWNTO 16) <= "0000000100000111"; -- WIR SUMMIEREN DIE REGISTER 7 UND DIE REGISTER 8
	instr_t(15 DOWNTO 0) <= "0010100000000000"; --DIE SUMME IN REGISTER 5 SPEICHERN
	wait for 10 ns;
    
    -- read register 
    --wir lesen register 5 (die summe von die zahlen 2 und 6 also 8)
    	clk_t <= '0';
	reset_t <= '0';
	alusrc_t <= '1';
	alucontrol_t <= "001";
	regwrite_t <= '1';
	regdst_t <= '0';
	instr_t(31 DOWNTO 16) <= "0000000010100101"; 
	instr_t(15 DOWNTO 0) <= "0000000000000000"; 
	wait for 10 ns;
    
    -- add Offset 
    -- der Offset ist die Zahl 4 !! also wir addieren auf die register 5 (dritter Register) der Offset 4.
    -- wir speicher den wert im Register 9
    	clk_t <= '0';
	reset_t <= '0';
	alusrc_t <= '1'; --hier Steuersignal 1,damit wir den Offset auszuwaehlen
	alucontrol_t <= "010"; --wir addieren 
	regwrite_t <= '1';
	regdst_t <= '0';
	instr_t(31 DOWNTO 16) <= "0000000010101001"; -- DRITTE UND VIERTER REGISTER
	instr_t(15 DOWNTO 0) <= "0000000000000100"; -- hier ist der Offset 4
	wait for 10 ns;	
	clk_t <= '1';
	reset_t <= '0';
	alusrc_t <= '1'; 
	alucontrol_t <= "010";
	regwrite_t <= '1';
	regdst_t <= '0';
	instr_t(31 DOWNTO 16) <= "0000000010101001"; -- DRITTE UND VIERTER REGISTER
	instr_t(15 DOWNTO 0) <= "0000000000000100"; -- hier ist der Offset 4
	wait for 10 ns;	
    	
        -- read register 
    	--das ergebnis auslesen, also wir lesen den Register 9 aus: es muss (4 + 8 ) 12 rauskommen
	clk_t <= '0';
	reset_t <= '0';
	alusrc_t <= '1'; 
	alucontrol_t <= "010";
	regwrite_t <= '1';
	regdst_t <= '0';
	instr_t(31 DOWNTO 16) <= "0000000100101001";
	instr_t(15 DOWNTO 0) <= "0000000000000000";
	wait for 10 ns;

        -- test jump (Wert 2 !!)
	clk_t <= '0';
	reset_t <= '0';
	alusrc_t <= '1'; 
	jump_t <= '1';
	alucontrol_t <= "010";
	regwrite_t <= '1';
	regdst_t <= '0';
	instr_t(31 DOWNTO 16) <= "0000000000000000";
	instr_t(15 DOWNTO 0) <= "0000000000000010";
	wait for 10 ns;
	clk_t <= '1';
	reset_t <= '0';
	alusrc_t <= '1'; 
	jump_t <= '1';
	alucontrol_t <= "010";
	regwrite_t <= '1';
	regdst_t <= '0';
	instr_t(31 DOWNTO 16) <= "0000000000000000";
	instr_t(15 DOWNTO 0) <= "0000000000000010";
	wait for 10 ns;

        -- test beq 
	clk_t <= '0';
	reset_t <= '0';
	alusrc_t <= '1'; 
	pcsrc_t <= '1';
	jump_t <= '0';
	alucontrol_t <= "010";
	regwrite_t <= '1';
	regdst_t <= '0';
	instr_t <= "00000000000000000000000000000111"; 
	wait for 10 ns;
	clk_t <= '1';
	reset_t <= '0';
	alusrc_t <= '1'; 
	pcsrc_t <= '1';
	jump_t <= '1';
	alucontrol_t <= "010";
	regwrite_t <= '1';
	regdst_t <= '0';
	instr_t <= "00000000000000000000000000000111"; 
	wait for 10 ns;
	wait for 10 ns;

    wait;
  end process;
end test;
