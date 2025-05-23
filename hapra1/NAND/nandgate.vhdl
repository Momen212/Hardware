
-- wir verwenden std_logic_1164 aus der IEEE libary
-- diese Datei definiert die Standards fuer logische Werte im elektronischen Design
-- Details finden sich in der Datei std_logic_1164.vhdl in ghdl/libraries/ieee
-- Die IEEE libary definiert auch operatoren und Schluesselwoerter


library ieee;
use ieee.std_logic_1164.all;

entity nandgate is
  -- das nandgate hat zwei Eingangsports "input1" und "input2" sowie einen Ausgangsport "nand_result"
  port (
    input1 : in std_logic;
    input2 : in std_logic;
    nand_result : out std_logic
  );
end nandgate;
-- die Architekture beschreibt die Funktionalitaet einer entity
-- aehnlich wie die Implementierung einer Funktion
-- beschreibt die "innere Verdrahtung" eines blocks
-- verbindet Signale, Konstanten oder andere Komponenten

architecture rtl of nandgate is

  -- internes Signal, bisher nicht nach aussen verbunden
  
  signal nand_gate : std_logic;
  
begin
  -- internes Signal wird entsprechend der benoetigten Funktionalitaet gesetzt (hier: logisches und der Eingabewerte)
  nand_gate <= not(input1 and input2);
  -- internes Signal wird nach aussen verbunden
  nand_result <= nand_gate;
end rtl;
