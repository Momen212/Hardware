
-- wir verwenden std_logic_1164 aus der IEEE libary
-- diese Datei definiert die Standards fuer logische Werte im elektronischen Design
-- Details finden sich in der Datei std_logic_1164.vhdl in ghdl/libraries/ieee
-- Die IEEE libary definiert auch operatoren und Schluesselwoerter

library ieee;
use ieee.std_logic_1164.all;



entity xorgate is
  -- das xorgate hat zwei Eingangsports "input1" und "input2" sowie einen Ausgangsport "xor_result"
  port (
    input1 : in std_logic;
    input2 : in std_logic;
    xor_result : out std_logic
  );
end xorgate;

-- die Architekture beschreibt die Funktionalitaet einer entity
-- aehnlich wie die Implementierung einer Funktion
-- beschreibt die "innere Verdrahtung" eines blocks
-- verbindet Signale, Konstanten oder andere Komponenten
architecture rtl of xorgate is
  -- internes Signal, bisher nicht nach aussen verbunden
  signal xor_gate : std_logic;
  
begin
  -- internes Signal wird entsprechend der benoetigten Funktionalitaet gesetzt (hier: logisches und der Eingabewerte)

  xor_gate <= input1 xor input2;
  -- internes Signal wird nach aussen verbunden
  xor_result <= xor_gate;
end rtl;
