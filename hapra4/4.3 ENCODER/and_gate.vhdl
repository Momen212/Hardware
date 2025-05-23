library ieee;
use ieee.std_logic_1164.all;

entity and_gate is
  port (
    input1 : in std_logic;
    input2 : in std_logic;
    input3 : in std_logic;
    and_output : out std_logic
  );
end and_gate;

architecture rtl of and_gate is
  signal andgate : std_logic;
begin
  andgate <= input1 and input2 and input3;
  and_output <= andgate;
end rtl;
