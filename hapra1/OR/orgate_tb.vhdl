library ieee;
use ieee.std_logic_1164.all;

-- create testbench for or_gate
entity orgate_tb is
end orgate_tb;

architecture test of orgate_tb is
  -- component declaration, so that it can be instantiated later
  -- must have same name and port list as the entity
  component orgate
      port (
        input1 : in std_logic;
        input2 : in std_logic;
        or_result : out std_logic
      );
  end component;
-- define the signals that will be used in test
  signal a, b, c : std_logic;
-- begin test code
begin
  -- creates an instance of andgate
  or_g: orgate port map(input1 => a, input2 => b, or_result => c);

  process begin
    a <= '0';
    b <= '0';
    wait for 10 ns;
    a <= '0';
    b <= '1';
    wait for 10 ns;
    a <= '1';
    b <= '0';
    wait for 10 ns;
    a <= '1';
    b <= '1';
    wait for 10 ns;
    a <= 'X';
    b <= 'W';
    wait for 10 ns;
    assert false report "End of test";
    wait;
  end process;
end test;
