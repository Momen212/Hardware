library ieee;
use ieee.std_logic_1164.all;

entity SR_Latch_tb is
end SR_Latch_tb;

architecture testbench of SR_Latch_tb is


component SR_Latch is
    port (
      S,R : in std_logic;
      Q,not_Q : out std_logic
    );
  end component;

signal S, Q, R, not_Q : std_logic;

begin

sr1 : SR_Latch port map(S => S, R => R,Q => Q, not_Q => not_Q);
sr2 : SR_Latch port map(S => S, R => R,Q => Q, not_Q => not_Q);
sr3 : SR_Latch port map(S => S, R => R,Q => Q, not_Q => not_Q);
sr4 : SR_Latch port map(S => S, R => R,Q => Q, not_Q => not_Q);

    process begin
        
        S <= '1';
        R <= '0';
        wait for 10 ns;
        S <= '0';
        R <= '1';
        wait for 10 ns;
        S <= '1';
        R <= '1';
        wait for 10 ns;
        S <= '0';
        R <= '0';
        wait for 10 ns;
        S <= '1';
        R <= '0';
        wait for 10 ns;
        S <= '0';
        R <= '1';
        wait for 10 ns;
        
        wait;
    end process;
end testbench;
