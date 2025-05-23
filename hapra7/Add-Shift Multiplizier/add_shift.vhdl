library ieee;
use ieee.std_logic_1164.all;

entity add_shift is
    port (
	  p_in_1, p_in_2: in std_logic_vector(3 downto 0);
      parallel_out : out std_logic_vector(7 downto 0)
    );
  end add_shift;
    
architecture behavioral of add_shift is

	type Zustand is (start, check, add, shift, check_finish);
	
	signal aktuellerZ, naechsterZ: Zustand;


	--PIPO Schieberegister 
	component PIPO is
		port (
			initial_in: std_logic_vector(7 downto 0);
		  parallel_in : in std_logic_vector(7 downto 0);
		  Clock, Clear: in std_logic;
		  parallel_out : out std_logic_vector(7 downto 0)
		);
	end component;
	
	
	--SIPO_L Schieberegister  (verschiebt nach links)
	component SIPO_L is
		port (
			initial_in: std_logic_vector(7 downto 0); 
		  serial_in, Clock, Clear: in std_logic;
		  parallel_out : out std_logic_vector(7 downto 0)
		);
	end component;
	
	--SIPO_R Schieberegister (verschiebt nach rechts)
	component SISO_R is
		port (
			initial_in: std_logic_vector(7 downto 0);
		  serial_in, Clock, Clear: in std_logic;
		  serial_out : out std_logic
		);
	end component;
	
	component addierer is
		port (
			a, b : in std_logic_vector(7 downto 0);
			control: in std_logic;
			summe : out std_logic_vector(7 downto 0)
		);
	end component;
	
	
	
	signal initial_PIPO, initial_SIPO, initial_SISO: std_logic_vector(7 downto 0);
	
	signal wire_PIPO_adder, wire_adder_PIPO, wire_SIPO_L_adder:std_logic_vector(7 downto 0);
	signal control_add, control_save, control_shift, control_clear : std_logic;
	signal SISO_R_in, SISO_R_out: std_logic;
	signal SIPO_L_in: std_logic;

	signal clock: std_logic;
	
begin
	
		multiplikand_register : SIPO_L 
    port map (
        initial_in => initial_SIPO,      
        serial_in => SIPO_L_in,          
        Clock => control_shift,        
        Clear => control_clear,         
        parallel_out => wire_SIPO_L_adder 
    );

	multiplikator_register : SISO_R 
    port map (
        initial_in => initial_SISO,
        serial_in => SISO_R_in,
        Clock => control_shift,
        Clear => control_clear,
        serial_out => SISO_R_out
    );

	produkt_register : PIPO 
    port map (
        initial_in => initial_PIPO,
        parallel_in => wire_adder_PIPO,
        Clock => control_save,
        Clear => control_clear,
        parallel_out => wire_PIPO_adder
    );

	addierwerk : addierer 
    port map (
        a => wire_PIPO_adder,
        b => wire_SIPO_L_adder,
        control => control_add,
        summe => wire_adder_PIPO
    );


	
-- Implemierung des Automaten für den Add-Shift Adder (fehlt)

process (clock)
    begin
        if rising_edge(clock) then
            aktuellerZ <= naechsterZ;
        end if;
    end process;

    process (aktuellerZ, SISO_R_out)
    begin
        -- Standardwerte
        naechsterZ <= aktuellerZ;
        control_add <= '0';
        control_save <= '0';
        control_shift <= '0';
        control_clear <= '0';

        case aktuellerZ is
            when start =>
                control_clear <= '1';
                naechsterZ <= check;

            when check =>
                if SISO_R_out = '1' then
                    naechsterZ <= add;
                else
                    naechsterZ <= shift;
                end if;

            when add =>
                control_add <= '1';
                control_save <= '1';
                naechsterZ <= shift;

            when shift =>
                control_shift <= '1';
                naechsterZ <= check_finish;

            when check_finish =>
                if wire_SIPO_L_adder(7) = '1' then -- Beispielbedingung für Ende
                    naechsterZ <= start;
                else
                    naechsterZ <= check;
                end if;

            when others =>
                naechsterZ <= start;
        end case;
    end process;

    -- Output des Produktes
    parallel_out <= wire_PIPO_adder;

end behavioral;


-- Implementierung eines addierers auf Basis eines ripple-carry-adders, jedoch angepasst an die Aufgabe
library ieee;
use ieee.std_logic_1164.all;
entity addierer is
	port (
		a, b : in std_logic_vector(7 downto 0);
		control: in std_logic;
		summe : out std_logic_vector(7 downto 0)
    );
end addierer;

architecture behavioral of addierer is
	
	--Der rca von Blatt 3
	component rca is
		port (
		a : in std_logic_vector(7 downto 0);
		b : in std_logic_vector(7 downto 0);
		cout : out std_logic;
		sum : out std_logic_vector(7 downto 0)
	  );
	  end component;
	
	signal s_out: std_logic_vector(7 downto 0);
	
begin

	ripple:rca port map (a=>a, b=>b, sum=>s_out);

	process (control) begin
		if(control'event and control = '1') then
			summe<=s_out;
		end if;
	end process;
	
	
end behavioral;


-- Implementierung eines PIPO Schieberegisters
library ieee;
use ieee.std_logic_1164.all;
entity PIPO is
	port (
		initial_in: std_logic_vector(7 downto 0);
      parallel_in : in std_logic_vector(7 downto 0);
	  Clock, Clear: in std_logic;
      parallel_out : out std_logic_vector(7 downto 0)
    );
end PIPO;

architecture behavioral of PIPO is
begin
	process (Clock) begin
		if(Clock'event and Clock = '1') then
		if(Clear = '1') then
				parallel_out <= initial_in;
			else
				parallel_out <= parallel_in;
			end if;
		end if;
	end process;
end behavioral;




-- Implementierung eines SIPO Schieberegisters, welches nach links verschiebt
library ieee;
use ieee.std_logic_1164.all;
entity SIPO_L is
	port (
		initial_in: std_logic_vector(7 downto 0); 
      serial_in, Clock, Clear: in std_logic;
      parallel_out : out std_logic_vector(7 downto 0)
    );
end SIPO_L;

architecture behavioral of SIPO_L is
	
	signal s_out: std_logic_vector(7 downto 0);
	
begin
	process (Clock) begin
		if(Clock'event and Clock = '1') then
			if(Clear = '1') then
				s_out <= initial_in;
			else
				for i in 7 downto 1 loop
					s_out(i) <= s_out(i-1);
				end loop;
				s_out(0) <= serial_in;
			end if;
			
		end if;
		
	end process;
	parallel_out<=s_out;
	
	
end behavioral;


-- Implementierung eines SIPO Schieberegisters, welches nach rechts verschiebt
library ieee;
use ieee.std_logic_1164.all;
entity SISO_R is
	port (
		initial_in: std_logic_vector(7 downto 0);
      serial_in, Clock, Clear: in std_logic;
      serial_out : out std_logic
    );
end SISO_R;

architecture behavioral of SISO_R is
	
	signal s_out: std_logic_vector(7 downto 0);
	
begin
	process (Clock) begin
		if(Clock'event and Clock = '1') then
			if(Clear = '1') then
				s_out <= initial_in;
			else
				for i in 0 to 6 loop
					s_out(i) <= s_out(i+1);
				end loop;
				s_out(7) <= serial_in;
			end if;
		end if;
	end process;
	
	serial_out<=s_out(0);
	
end behavioral;

