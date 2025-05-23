library ieee;
use ieee.std_logic_1164.all;

entity sipo_register_tb is 
end sipo_register_tb;

architecture rtl of sipo_register_tb is

component sipo_register is
    port(
        serial_in, clear, clock : in std_logic;
        Q : out std_logic_vector(3 downto 0)
    );
end component;
    
signal serial_data_input, clear, clock : std_logic;
signal Q : std_logic_vector(3 downto 0);

begin
   

sipo1 : sipo_register port map(serial_in => serial_data_input, clear => clear, clock => clock, Q => Q);


    process begin
       -- SIPO initialisieren indem man es zurueck setzt
	  clock <= '0'; 
	  clear <= '0';
	  serial_data_input <= '0';
	  wait for 10 ns;
	  --Zuruecksetzen.
	  clear <= '1';
	  clock <= '1';
	
	  wait for 10 ns;
	  clock <= '0'; 
	  clear <= '0';
	  wait for 10 ns;

        --Uebergebe die Bitsequenz 1000 
        --erstes Bit
        serial_data_input <= '1';
	    clock <= '1';
	    wait for 10 ns;
	    clock <= '0';
	    wait for 10 ns;

	    serial_data_input <= '0';
	    clock <= '1';
	    wait for 10 ns;
	    clock <= '0';
	    wait for 10 ns;

	    serial_data_input <= '0';
	    clock <= '1';
	    wait for 10 ns;
	    clock <= '0';
	    wait for 10 ns;

	    serial_data_input <= '0';
	    clock <= '1';
	    wait for 10 ns;
	    clock <= '0';
	    wait for 30 ns;
        --Zuruecksetzen.
	   clear <= '1';
	   clock <= '1';
	  serial_data_input <= '0';
	  wait for 10 ns;
	  clock <= '0'; 
	  clear <= '0';
	  wait for 10 ns;
        
        --Test Fall (0110)
	  serial_data_input <= '0';
	  clock <= '1';
          wait for 10 ns;
          clock <= '0';
          wait for 10 ns;

         serial_data_input <= '1';
         clock <= '1';
         wait for 10 ns;
         clock <= '0';
         wait for 10 ns;

	 serial_data_input <= '1';    
	 clock <= '1';
	 wait for 10 ns; 
	 clock <= '0';
         wait for 10 ns;

	 serial_data_input <= '0';
         clock <= '1';
         wait for 10 ns;
         clock <= '0';
         wait for 30 ns;
        
        wait;
    end process; 
    
end rtl; 
