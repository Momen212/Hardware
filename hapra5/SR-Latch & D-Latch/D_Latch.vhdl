library ieee;
use ieee.std_logic_1164.all;

entity D_Latch is
    port(
        D, clk : in std_logic;
        Q, not_Q : out std_logic
    );
end D_Latch;

architecture Behavioral of D_Latch is

     component and_gate is
        port (
          input1 : in std_logic;
          input2 : in std_logic;
          and_result : out std_logic
        );
      end component;

    component SR_Latch is
        port (
          S,R : in std_logic;
          Q,not_Q : out std_logic
        );
      end component;


signal and_gate_1: std_logic;
signal and_gate_2: std_logic;
signal latch_1 : std_logic;
signal latch_2: std_logic;
signal not_d: std_logic;


begin

not_d <= not D;
and_1 : and_gate port map(input1 => clk, input2 => not_d, and_result => and_gate_1);
and_2 : and_gate port map(input1 => clk, input2 => D, and_result => and_gate_2);
latch_3 : SR_Latch port map(S => and_gate_2, R => and_gate_1, Q => latch_1, not_Q => latch_2);

Q <= latch_1;
not_Q <= latch_2;

end Behavioral;
