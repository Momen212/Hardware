library ieee;
use ieee.std_logic_1164.all;

entity not_gate is
  port (
    input1 : in std_logic;
    not_output : out std_logic
  );
end not_gate;

architecture rtl of not_gate is
  signal notgate : std_logic;
begin
  notgate <= NOT input1;
  not_output <= notgate;
end rtl;
