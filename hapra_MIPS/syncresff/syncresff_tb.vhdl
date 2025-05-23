library ieee;
use ieee.std_logic_1164.all;

entity syncresff_tb is 
end syncresff_tb;

architecture behavior of syncresff_tb is

    
    constant w: integer := 8;

    component syncresff is 
    generic (w: integer :=8);
    port(
        clk: in std_logic;
        reset: in std_logic;  
        d: in std_logic_vector(w-1 downto 0);
	q: buffer std_logic_vector(w-1 downto 0)
    );
    end component;
    
    signal reset : std_logic := '0';
    signal d : std_logic_vector(w-1 downto 0) := (others => '0');
    signal q : std_logic_vector(w-1 downto 0) := (others => '0'); 
    signal clk : std_logic := '0';

begin
    pc : syncresff generic map (w => w) port map (clk => clk, reset => reset, d => d, q => q);


    process begin
	
	clk <= '0';
	reset <= '0';
	wait for 10 ns;
	clk <= '1';
	d <= "00001111";
	wait for 10 ns;
	clk <= '0';
	wait for 10 ns;
	reset <= '1'; -- wir reseten alles
	wait for 10 ns;
	clk <= '0';
	reset <= '0';
	wait for 10 ns;
	clk <= '1';
	d <= "11001100";
	wait for 10 ns;

        wait;
    end process; 
    
end behavior; 

