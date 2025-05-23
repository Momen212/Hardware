library ieee;
use ieee.std_logic_1164.all;

entity or_gate is
  port (
    input1 : in std_logic;
    input2 : in std_logic;
    input3 : in std_logic;
    input4 : in std_logic;
    or_result : out std_logic
  );
end or_gate;

architecture rtl of or_gate is
  signal orgate : std_logic;
begin
  orgate <= input1 or input2 or input3 or input4;
  or_result <= orgate;
end rtl;
