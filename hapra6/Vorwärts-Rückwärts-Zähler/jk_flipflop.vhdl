library ieee;
use ieee.std_logic_1164.all;

entity jk_flipflop is
    port(
        j,k, clk, reset : in std_logic;
        Q : out std_logic
    );
end jk_flipflop;


architecture bh of jk_flipflop is
        signal q_int : std_logic;
    begin
        q <= q_int;
        process begin
            wait until rising_edge(clk);
                if (reset = '1') then
                    q_int <= '0';
                elsif (j = '0' and k = '1') then
                    q_int <= '0';
                elsif (j = '1' and k = '0') then
                    q_int <= '1';
                elsif (j = '1' and k = '1') then
                    q_int <= not q_int;
                end if;
        end process;
end bh;
