LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY mux81 IS
    PORT (
        i0_81 : IN std_logic_vector(2 DOWNTO 0); 
        i1_81 : IN std_logic_vector(2 DOWNTO 0);
        i2_81 : IN std_logic_vector(2 DOWNTO 0);
        i3_81 : IN std_logic_vector(2 DOWNTO 0);
        i4_81 : IN std_logic_vector(2 DOWNTO 0);
        i5_81 : IN std_logic_vector(2 DOWNTO 0);
        i6_81 : IN std_logic_vector(2 DOWNTO 0);
        i7_81 : IN std_logic_vector(2 DOWNTO 0);
        sel_81 : IN std_logic_vector(2 DOWNTO 0); 
        y_81 : OUT std_logic_vector(2 DOWNTO 0));
END mux81;

ARCHITECTURE rtl OF mux81 IS

    COMPONENT mux41 IS
        PORT (
            i0 : IN std_logic_vector(2 DOWNTO 0); 
            i1 : IN std_logic_vector(2 DOWNTO 0);
            i2 : IN std_logic_vector(2 DOWNTO 0);
            i3 : IN std_logic_vector(2 DOWNTO 0);
            sel : IN std_logic_vector(1 DOWNTO 0); 
            y : OUT std_logic_vector(2 DOWNTO 0)
        );
    END COMPONENT;
	
    
    -- weitere Komponenten 
    signal multi_output1 : std_logic_vector(2 DOWNTO 0); 
    signal multi_output2 : std_logic_vector(2 DOWNTO 0); 
    signal multi_output3 : std_logic_vector(2 DOWNTO 0); 
    signal multi_output4 : std_logic_vector(2 DOWNTO 0);
    
    
    -- Signale
begin

    --missing;
    -- hier werden die einzelnen Komponenten verschaltet
	multiplex1: mux41 port map(i0 => i0_81, i1 => i1_81, i2 => i2_81, i3 => i3_81, sel => sel_81(1 downto 0), y => multi_output1);
    multiplex2: mux41 port map(i0 => i4_81, i1 => i5_81, i2 => i6_81, i3 => i7_81, sel => sel_81(1 downto 0), y => multi_output2);
    mul_assignment : for i in 0 to 2 generate
        multi_output3(i) <= multi_output1(i) and not (sel_81(2));
        multi_output4(i) <= multi_output2(i) and sel_81(2);
        
    end generate mul_assignment;
    
    mul_or_assignment : for i in 0 to 2 generate
        y_81(i) <= multi_output3(i) or multi_output4(i);
        
    end generate mul_or_assignment;

end rtl;

