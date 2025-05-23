library ieee;
use ieee.std_logic_1164.all;

entity nor_gate is
  port (
    input1 : in std_logic;
    input2 : in std_logic;
    nor_result : out std_logic
  );
end nor_gate;

architecture rtl of nor_gate is

  component or_gate is
    port (
      input1 : in std_logic;
      input2 : in std_logic;
      or_result : out std_logic
    );
  end component;
  
    component not_gate is
    port (
      input1 : in std_logic;
      not_result : out std_logic
    );
  end component;
  
  signal or_gate_signal : std_logic;
  signal not_gate_signal : std_logic;
  
begin

or_gate_1 : or_gate port map(input1 => input1, input2 => input2, or_result => or_gate_signal);
or_gate_2 : not_gate port map(input1 => or_gate_signal, not_result => nor_result);

end rtl;
