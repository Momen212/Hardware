library ieee;
use ieee.std_logic_1164.all;

entity mips_tb is
end mips_tb;

architecture test of mips_tb is
  component mips
    port(
      clk: in std_logic;
      reset: in std_logic;
      pc: buffer std_logic_vector(31 downto 0);
      instr: in std_logic_vector(31 downto 0);
      readdata: in std_logic_vector(31 downto 0);
      aluout: buffer std_logic_vector(31 downto 0);
      writedata: buffer std_logic_vector(31 downto 0);
      memwrite: out std_logic
    );
  end component;

signal clk_t, reset_t, memwrite_t: std_logic;
signal pc_t, instr_t, aluout_t, writedata_t, readdata_t: std_logic_vector(31 downto 0);

begin
  mips_test: mips port map(
 	clk_t, reset_t, pc_t, instr_t, readdata_t, aluout_t, writedata_t, memwrite_t
  );

  process begin
  

      -- use addi to store data in registers
      -- also es muss so sein :- instr(31 downto 25) <= 001000
      
      -- ich will die Zaheln 2 , 6 speicheren :-
      
      --Die Zahl 2 in register 7 speichern :-
	clk_t <= '0';
	reset_t <= '1';
	instr_t <= "00100000000001110000000000000010";
	readdata_t <= "00000000000000000000000000000000";
	wait for 10 ns;
	clk_t <= '1';
	reset_t <= '0';
	instr_t <= "00100000000001110000000000000010";
	wait for 10 ns;
      
      --Die Zahl 6 in register 8 speichern :-
        clk_t <= '0';
	reset_t <= '1';
	instr_t <= "00100000000010000000000000000110";
	readdata_t <= "00000000000000000000000000000000";
	wait for 10 ns;
	clk_t <= '1';
	reset_t <= '0';
	instr_t <= "00100000000010000000000000000110";
	wait for 10 ns;
    
        -- read from registers
      	
	-- Auslesen von 2 (register 7)
	clk_t <= '0';
	reset_t <= '0';
	instr_t <= "10001100111001110000000000000000";
	wait for 10 ns;
	clk_t <= '1';
	reset_t <= '0';
	instr_t <= "10001100111001110000000000000000";
	wait for 10 ns;
	
        -- Auslesen von 6 (register 8)
	clk_t <= '0';
	reset_t <= '0';
	instr_t <= "10001101000010000000000000000000";
	wait for 10 ns;
	clk_t <= '1';
	reset_t <= '0';
	instr_t <= "10001101000010000000000000000000";
	wait for 10 ns;

        -- addition of registers and storing the result
        -- wir addieren register 8 und register 7 (die zahlen 6 und 2) und speichern das Ergebnis in Register 5 !!
        
	clk_t <= '0';
	reset_t <= '0';
	instr_t <= "00000001000001110010100000100000";
	wait for 10 ns;
	clk_t <= '1';
	reset_t <= '0';
	instr_t <= "00000001000001110010100000100000";
	wait for 10 ns;
    
        -- read register 
      	--Auslesen von 8 (2 + 6) aus Register 5
	clk_t <= '0';
	reset_t <= '0';
	instr_t <= "10001100101001010000000000000000";
	wait for 10 ns;
	clk_t <= '1';
	reset_t <= '0';
	instr_t <= "10001100101001010000000000000000";
	wait for 10 ns;

        -- test jump (Wert 2)
	clk_t <= '0';
	reset_t <= '0';
	instr_t <= "00001000000000000000000000000010";
	wait for 10 ns;
	clk_t <= '1';
	reset_t <= '0';
	instr_t <= "00001000000000000000000000000010";
	wait for 10 ns;
	
       -- test beq (Wert 2 wieder) register 7 und register 5
      	clk_t <= '0';
	reset_t <= '0';
	instr_t <= "00010000101001110000000000000010";
	wait for 10 ns;
	clk_t <= '1';
	reset_t <= '0';
	instr_t <= "00010000101001110000000000000010";
	wait for 10 ns;
    
    
    wait;		
  end process;
end test;
