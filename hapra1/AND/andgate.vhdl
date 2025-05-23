-- from the ieee library we use std_logic_1164
-- defines a standard for logic values used in electronic design
-- for more info check the std_logic_1164.vhdl file in ghdl/libraries/ieee
-- ieee library also defines operators and keywords

-- wir verwenden std_logic_1164 aus der IEEE libary
-- diese Datei definiert die Standards fuer logische Werte im elektronischen Design
-- Details finden sich in der Datei std_logic_1164.vhdl in ghdl/libraries/ieee
-- Die IEEE libary definiert auch operatoren und Schluesselwoerter

library ieee;
use ieee.std_logic_1164.all;

-- entities defined in a file can be seen as black boxes
-- entities have ports that defines all inputs and outputs 
-- std_logic can have 9 different values, it is part of std_logic_1164 package
-- you can think of it as a single bit

-- die in einer Datei definierten entities koennen als black box angesehen werden. 
-- entities haben ports die Eingaben und Ausgaben definieren
-- std_logic kann 9 unterschiedliche Werte annehmen (siehe Aufgabe 2.1)
-- kann als einzelnes bit verstanden werden

entity andgate is
  -- the andgate as two in ports named "input1" and "input2", and one out port named "and_result"
  -- das andgate hat zwei Eingangsports "input1" und "input2" sowie einen Ausgangsport "and_result"
  
  port (
    input1 : in std_logic;
    input2 : in std_logic;
    and_result : out std_logic
  );
end andgate;

-- architecture describes functionality of particular entity
-- like the implementation of a function
-- actually describes the "internal wiring" of block
-- interconnection signals, constants, or other components

-- die Architekture beschreibt die Funktionalitaet einer entity
-- aehnlich wie die Implementierung einer Funktion
-- beschreibt die "innere Verdrahtung" eines blocks
-- verbindet Signale, Konstanten oder andere Komponenten

architecture rtl of andgate is
  -- internal signal, not yet connected to the outside
  -- internes Signal, bisher nicht nach aussen verbunden
  signal and_gate : std_logic;
  
begin
  -- setting the internal signal, based on the desired logical functionality (here: logical and of the two input values)
  -- internes Signal wird entsprechend der benoetigten Funktionalitaet gesetzt (hier: logisches und der Eingabewerte)

  and_gate <= input1 and input2;
  -- internal signal gets connected to the outside
  -- internes Signal wird nach aussen verbunden
  and_result <= and_gate;
end rtl;
