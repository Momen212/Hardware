library ieee;
use ieee.std_logic_1164.all;

entity ha is
  port (
    a: in std_logic; --Eingang 1
    b: in std_logic; --Eingang 2
    o: out std_logic; --Summen-Bit
    c: out std_logic --Carry-Bit
  );
end ha;

architecture rtl of ha is
begin
o <= a xor b; --Berechnung für das Summen-Bit
c <= a and b; --Berechnung für das Carry-Bit
end rtl;

