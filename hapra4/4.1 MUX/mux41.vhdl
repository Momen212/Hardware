LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
--the 4:1 multiplexer to be designed consists of four 3-bit inputs, i.e., i0, i1, i2 and i3.
--sel is a 2-bit select signal.
--y is the output.

ENTITY mux41 IS
    PORT (
        i0 : IN std_logic_vector(2 DOWNTO 0); 
        i1 : IN std_logic_vector(2 DOWNTO 0);
        i2 : IN std_logic_vector(2 DOWNTO 0);
        i3 : IN std_logic_vector(2 DOWNTO 0);
        sel : IN std_logic_vector(1 DOWNTO 0); 
        y : OUT std_logic_vector(2 DOWNTO 0)
        );
END mux41;

ARCHITECTURE rtl OF mux41 IS
--you can add more components you need
--you can also increase the number of inputs, e.g., the "and" gate below is extended to a 3-input gate.

    COMPONENT and_gate IS
        PORT (input1 : IN std_logic;
            input2 : IN std_logic;
			input3 : IN std_logic;
            and_output : OUT std_logic);
    END COMPONENT;
	    COMPONENT or_gate IS
        PORT (input1 : IN std_logic;
            input2 : IN std_logic;
			input3 : IN std_logic;
			input4 : IN std_logic;
            or_result : OUT std_logic);
    END COMPONENT;
		    COMPONENT not_gate IS
        PORT (input1 : IN std_logic;
            not_output : OUT std_logic);
    END COMPONENT;

--you can define more signals here if you need, e.g.,:
    signal not_sel : std_logic_vector(1 DOWNTO 0); 
    signal and_output1 : std_logic_vector(2 DOWNTO 0); 
    signal and_output2 : std_logic_vector(2 DOWNTO 0); 
    signal and_output3 : std_logic_vector(2 DOWNTO 0); 
    signal and_output4 : std_logic_vector(2 DOWNTO 0); 

BEGIN

--bitwise operation for each logic gate because the input signals are multilple-bit signals.
--please complete the implementation based on the schema you designed.
    and_gate_assignment : for i in 0 to 2 generate
        and_output01: and_gate port map(input1 => not_sel(0), input2 => not_sel(1), input3 => i0(i), and_output => and_output1(i));
        and_output02: and_gate port map(input1 => sel(0), input2 => not_sel(1), input3 => i1(i), and_output => and_output2(i));
        and_output03: and_gate port map(input1 => not_sel(0), input2 => sel(1), input3 => i2(i), and_output => and_output3(i));
        and_output04: and_gate port map(input1 => sel(0), input2 => sel(1), input3 => i3(i), and_output => and_output4(i));
    end generate and_gate_assignment;
   
   --missing
   -- hier werden die weiteren Komponenten verschaltet
    or_gate_assignment : for i in 0 to 2 generate
        or_output: or_gate port map(input1 => and_output1(i), input2 => and_output2(i), input3 => and_output3(i), input4 => and_output4(i),or_result=> y(i) );
    end generate or_gate_assignment;
	
	not_sel1: not_gate port map(input1 => sel(0), not_output => not_sel(0));
	not_sel2: not_gate port map(input1 => sel(1), not_output => not_sel(1));
	

END rtl;

