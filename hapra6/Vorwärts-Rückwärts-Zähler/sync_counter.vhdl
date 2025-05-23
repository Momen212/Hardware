library ieee;
use ieee.std_logic_1164.all;

entity sync_counter is
    port(
        reset, clk, C, D : in std_logic;
        q1, q0 : out std_logic
    );
end sync_counter;

architecture bh of sync_counter is

    component jk_flipflop is
        port(
            j, k, clk, reset : in std_logic;
            Q : out std_logic
        );
    end component;

    signal j1, k1, j2, k2 : std_logic;
    signal z0, z1 : std_logic := '0';

begin

    j1 <= C and (not D) and not z0; -- hier berehcnen wir j1 (jump1)
    k1 <= (not C) or D or z0; --hier wird k1 berechenent (kill1)

    j2 <= C and (not D) and not z1; --hier brechnen wir j2 (jump2)
    k2 <= (not C) or D or z1; --hier wird k2 brechnet (kill2)
	
	
	--hier wrid beide JK FLipflops verwendent
    flipflop0: jk_flipflop port map(j => j1, k => k1, clk => clk, reset => reset, Q => z0); 
    flipflop1: jk_flipflop port map(j => j2, k => k2, clk => clk, reset => reset, Q => z1);
	
	--ausgang einsetzen
    q0 <= z0;
    q1 <= z1;

end bh;

