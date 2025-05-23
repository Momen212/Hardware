LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY mux21 IS
    PORT (
        i1 : IN std_logic;
        i2 : IN std_logic;
        sel : IN std_logic; 
        y : OUT std_logic
        );
END mux21;

ARCHITECTURE rtl OF mux21 IS

    signal not_sel : std_logic; 
    signal wire1 : std_logic;
    signal wire2 : std_logic;
    signal result : std_logic;


BEGIN
        not_sel <= not sel;
        wire1 <= i1 and not_sel;
        wire2 <= i2 and sel;
    
    result <= wire1 or wire2;
    
	y <= result;
END rtl;

