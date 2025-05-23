library ieee;
use ieee.std_logic_1164.all;

entity and_gate is
  port (
    input1 : in std_logic;
    input2 : in std_logic;
    and_result : out std_logic
  );
end and_gate;

architecture rtl of and_gate is

begin
  and_result <= input1 and input2;
  
end rtl;
