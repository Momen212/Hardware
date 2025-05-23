library ieee;
use ieee.std_logic_1164.all;

-- ein serieler Input, 8 bit parallel Output
entity sipo_register is
    port(
        serial_in, clear, clock : in std_logic;
        Q : out std_logic_vector(3 downto 0)
    );
end sipo_register;

architecture rtl of sipo_register is
    component DFlipFlop is 
        port (
            d, clk, reset: in std_logic;
            Q : out std_logic
        );
    end component;

signal q1: std_logic;
signal q2: std_logic;   
signal q3: std_logic;
signal q4: std_logic;


begin

flipflop1 : DFlipFlop port map(d => serial_in, clk => clock, reset => clear, Q => q1);
flipflop2 : DFlipFlop port map(d => q1, clk => clock, reset => clear, Q => q2);
flipflop3 : DFlipFlop port map(d => q2, clk => clock, reset => clear, Q => q3);
flipflop4 : DFlipFlop port map(d => q3, clk => clock, reset => clear, Q => q4);

Q(0) <= q1;
Q(1) <= q2;
Q(2) <= q3;
Q(3) <= q4;

end rtl;
