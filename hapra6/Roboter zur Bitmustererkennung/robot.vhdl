library ieee;
use ieee.std_logic_1164.all;

entity robot is 
    port(
        pattern : in std_logic_vector(3 downto 0); 
        sensor, reset, clock : in std_logic; 
        alarm : out std_logic 
    );
end robot;

architecture rtl of robot is
 
    component sipo_register is
        port(
            serial_in, clear, clock : in std_logic;
            Q : out std_logic_vector(3 downto 0) 
        );
    end component;
 
    signal serial_in : std_logic;  
    signal Q : std_logic_vector(3 downto 0); 

begin
    
    schieb1 : sipo_register port map(serial_in => sensor, clear => reset, clock => clock, Q => Q);

    process(clock)
    begin
        if rising_edge(clock) then
            if Q = pattern then
                alarm <= '1'; 
            else
                alarm <= '0'; 
            end if;
        end if;
    end process;

end rtl;

