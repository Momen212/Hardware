library ieee;
use ieee.std_logic_1164.all;

entity robot_tb is 
end robot_tb;

architecture rtl of robot_tb is

    component robot is 
    port(
        pattern : in std_logic_vector(3 downto 0); 
        sensor, reset, clock : in std_logic;
        alarm : out std_logic
    );
    end component;
    

    signal alarm : std_logic;     
    signal reset : std_logic; 
    signal sensor : std_logic; 
    signal clock : std_logic; 
    signal pattern : std_logic_vector(3 downto 0); 
begin
    rbt : robot port map (sensor => sensor, reset => reset, clock => clock, alarm => alarm, pattern => pattern);


    process begin
        ------Initialisierung--
        pattern(0) <= '1';
        pattern(1) <= '0';
        pattern(2) <= '1';
        pattern(3) <= '1';

        sensor <= '0';
        reset <= '1';
        clock <= '1'; 
        wait for 10 ns; 
        -----------------------
        reset <= '0'; 
        clock <= '0'; 
        wait for 10 ns; 
        -----------------------

        -- Wir lesen die Bitfolge "101101111" bitweise in sensor ein 
        -- Nachdem "1011" erkannt wurde wird das Pattern auf "1101" gesetzt
        
        -----------------------
        sensor <= '1'; 
        clock <= '1'; 
        wait for 10 ns;
        clock <= '0';
        wait for 10 ns; 
        -----------------------
        sensor <= '0'; 
        clock <= '1'; 
        wait for 10 ns;
        clock <= '0';
        wait for 10 ns;
        -----------------------
        sensor <= '1'; 
        clock <= '1'; 
        wait for 10 ns;
        clock <= '0';
        wait for 10 ns;
        -----------------------
        sensor <= '1'; 
        clock <= '1'; 
        wait for 10 ns;
        clock <= '0';
        wait for 10 ns;
        -- hier sollte alarm = 1 sein (1011 wurde erkannt)
        -----------------------


        -- das zu suchende Pattern wird auf 1101 gesetzt 
        pattern(0) <= '1';
        pattern(1) <= '1';
        pattern(2) <= '0';
        pattern(3) <= '1';

        -----------------------
        sensor <= '0'; 
        clock <= '1'; 
        wait for 10 ns;
        clock <= '0';
        wait for 10 ns;
        -----------------------
        sensor <= '1'; 
        clock <= '1'; 
        wait for 10 ns;
        clock <= '0';
        wait for 10 ns;
        -- hier sollte alarm = 1 sein (1101 wurde erkannt, die 11 zu beginn wurden schon vor dem neu setzen des patterns gelesen)
        -----------------------
        sensor <= '1'; 
        clock <= '1'; 
        wait for 10 ns;
        clock <= '0';
        wait for 10 ns;
        -----------------------
        sensor <= '0'; 
        clock <= '1'; 
        wait for 10 ns;
        clock <= '0';
        wait for 10 ns;
        -----------------------
        sensor <= '1'; 
        clock <= '1'; 
        wait for 10 ns;
        clock <= '0';
        wait for 10 ns;
        -- hier sollte alarm = 1 sein (1101 wurde erkannt)

        wait;
    end process; 
    
end rtl; 

