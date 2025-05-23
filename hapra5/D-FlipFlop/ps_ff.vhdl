library ieee;
use ieee.std_logic_1164.all;

entity ps_ff is
    port (
      d, clk, reset: in std_logic;
      Q, not_Q : out std_logic
    );
  end ps_ff;

architecture behavioral of ps_ff is

component D_Latch is
    port(
        D, clk : in std_logic;
        Q, not_Q : out std_logic
    );
end component;

signal output_latch_1_1: std_logic; -- this is the first Q output
signal otuput_latch_1_2: std_logic; -- this is the first not q output that we dont need 
signal not_clk: std_logic; -- negation von the tackt
signal new_d: std_logic; -- Das ist das neue D also nach dem reset (es wird nur zurückgesetzt nur wenn reset auf 1 ist und das tackt signal auf 1 auch)
-- ich habe gezeichent we ich das gemacht habe es ist einfach und-gate am afang mit negation der reset signal.

begin
not_clk <= not clk;
new_d <= d and (not reset); 
latch_1 : D_Latch port map(D => new_d, clk => not_clk, Q => output_latch_1_1, not_Q => otuput_latch_1_2);
latch_2 : D_Latch port map(D => output_latch_1_1, clk => clk, Q => Q, not_Q => not_Q);

end behavioral ;
