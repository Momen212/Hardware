library ieee;
use ieee.std_logic_1164.all;

entity rca_tb is
end rca_tb;

architecture test of rca_tb is
  component rca
    port (
      a : in std_logic_vector(7 downto 0);
      b : in std_logic_vector(7 downto 0);
      cout : out std_logic;
      sum : out std_logic_vector(7 downto 0)
    );
  end component;

signal a : std_logic_vector(7 downto 0);
signal b : std_logic_vector(7 downto 0);
signal cout : std_logic;
signal sum : std_logic_vector(7 downto 0);
begin
  -- ?
  rca_adder: rca port map(a => a, b => b, cout => cout, sum => sum);

  process begin
    a <= "00000000";
    b <= "00000001";
    wait for 10 ns;
	    
    a <= "00100000";
    b <= "00000010";
    wait for 10 ns;
    
    a <= "00100010";
    b <= "10000001";
    wait for 10 ns;
    
    a <= "01010000";
    b <= "01000101";
    wait for 10 ns;
    wait;
  end process;
end test;
