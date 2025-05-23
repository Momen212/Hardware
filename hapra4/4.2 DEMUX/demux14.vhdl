LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY demux14 IS
    PORT (
        I_n : IN std_logic_vector(2 DOWNTO 0); 
        sel : IN std_logic_vector(1 DOWNTO 0); 
        Y0 : OUT std_logic_vector(2 DOWNTO 0);
        Y1 : OUT std_logic_vector(2 DOWNTO 0);
        Y2 : OUT std_logic_vector(2 DOWNTO 0);
        Y3 : OUT std_logic_vector(2 DOWNTO 0)
        );
END demux14;

ARCHITECTURE rtl OF demux14 IS
--missing
	component and_gate is 
		port(input1 : in std_logic;
		input2 : in std_logic;
		input3 : in std_logic;
		and_output : out std_logic
	);
	end component;
	component not_gate is
		 port (
		input1 : in std_logic;
		not_output : out std_logic
		);
	end component;
    signal not_sel : std_logic_vector(1 DOWNTO 0); 
begin
		and_gate_assignment : for i in 0 to 2 generate
        and_output01: and_gate port map(input1 => not_sel(0), input2 => not_sel(1), input3 => I_n(i), and_output => Y0(i));
        and_output02: and_gate port map(input1 => sel(0), input2 => not_sel(1), input3 => I_n(i), and_output => Y1(i));
        and_output03: and_gate port map(input1 => not_sel(0), input2 => sel(1), input3 => I_n(i), and_output => Y2(i));
        and_output04: and_gate port map(input1 => sel(0), input2 => sel(1), input3 => I_n(i), and_output => Y3(i));
    end generate and_gate_assignment;
	not_sel1: not_gate port map(input1 => sel(0), not_output => not_sel(0));
	not_sel2: not_gate port map(input1 => sel(1), not_output => not_sel(1));
	

END rtl;

