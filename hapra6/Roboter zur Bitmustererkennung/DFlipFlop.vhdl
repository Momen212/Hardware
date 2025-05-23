library ieee;
use ieee.std_logic_1164.all;

entity DFlipFlop is
    port (
      d, clk, reset: in std_logic;
      Q : out std_logic
    );
  end DFlipFlop;

architecture behavioral of DFlipFlop is

-- Verhalten des Flip Flops mit Reset

begin
  process begin
  wait on clk until clk = '1';
      Q <= d and (not reset);
  end process;
end behavioral ;
