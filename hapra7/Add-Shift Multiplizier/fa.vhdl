library ieee;
use ieee.std_logic_1164.all;

entity fa is
  port (
    a : in std_logic; --Eingang 1
    b : in std_logic; --Eingang 2
	cin : in std_logic; --Eingang Carry-Bit
    cout : out std_logic; --Ausgang Carry-Bit
	s : out std_logic --Ausgang Summen-Bit
  );
end fa;

architecture rtl of fa is
-- Es werden 3 Signale genutzt, um die Komponenten zu "verkabeln"
  signal wire_1 : std_logic;
  signal wire_2 : std_logic;
  signal wire_3 : std_logic;
	component ha
		port(a, b : in std_logic;
			o, c : out std_logic);
	end component;
begin
-- Es werden zwei Halbaddierer und ein Oder-Gatter verwendet (entsprechend der Zeichnung)
ha1: ha port map (a=>a, b=> b, o=>wire_1, c=>wire_2);
ha2: ha port map (a=>wire_1, b=> cin, o=>s, c=>wire_3);
cout <= wire_3 or wire_2;
end rtl;
