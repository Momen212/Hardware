library ieee;
use ieee.std_logic_1164.all;

entity SR_Latch is
    port (
      S,R : in std_logic;
      Q,not_Q : out std_logic
    );
  end SR_Latch;

architecture Behavioral of SR_Latch is

  component nor_gate is
    port (
      input1 : in std_logic;
      input2 : in std_logic;
      nor_result : out std_logic
    );
  end component;

signal nor_gate_1: std_logic;
signal nor_gate_2: std_logic;

begin


or_output1 : nor_gate port map(input1 => S, input2 => nor_gate_2, nor_result => nor_gate_1);
or_output2 : nor_gate port map(input1 => R, input2 => nor_gate_1, nor_result => nor_gate_2);

Q <= nor_gate_2;
not_Q <= nor_gate_1;

end Behavioral;

