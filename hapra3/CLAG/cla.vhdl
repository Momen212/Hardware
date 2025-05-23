library ieee;
use ieee.std_logic_1164.all;
--hier verwenden wir die clag und facla datei, die wir schon implemntiert haben

entity cla is
  port (
    a : in std_logic_vector(3 downto 0);
    b : in std_logic_vector(3 downto 0);
    cin : in std_logic;
    cout : out std_logic;
    sum : out std_logic_vector(3 downto 0)
  );
end cla;

-- a simple example for an implementation using 2 predefined components can be found in the nandgate related to exercise sheet 1
-- Ein einfaches Beispiel fuer eine Implementierung die 2 vordefinierte Komponenten verwendet kann im nandgate das Uebungsblatt 1 beilag gefunden werden

architecture rtl of cla is
  component facla is
    port (
  -- ports of the facla
    a : in std_logic;
    b : in std_logic;
    cin : in std_logic;
    g : out std_logic;
    p : out std_logic;
    sum : out std_logic
    );
  end component facla;

  component clag is
    port(
  -- ports of the clag 
    gin : in std_logic_vector(3 downto 0);
    pin : in std_logic_vector(3 downto 0);
    cin : in std_logic;
    cout : out std_logic_vector(3 downto 0);
    pout : out std_logic;
    gout : out std_logic
    );
  end component clag;

-- signals 
  signal g_s : std_logic_vector(3 downto 0);
  signal p_s : std_logic_vector(3 downto 0);
  signal c_s    : std_logic_vector(3 downto 0);
  signal pout_s : std_logic; 
  signal gout_s : std_logic; 


begin
-- implement cla here
	F0: facla port map (a =>a(0), b => b(0) , cin=>cin, sum=> sum(0),g=>g_s(0),p=>p_s(0) );
	F1: facla port map (a =>a(1), b => b(1) , cin=>c_s(0), sum=> sum(1),g=>g_s(1),p=>p_s(1) );
	F2: facla port map (a =>a(2), b => b(2) , cin=>c_s(1), sum=> sum(2),g=>g_s(2),p=>p_s(2) );
	F3: facla port map (a =>a(3), b => b(3) , cin=>c_s(2), sum=> sum(3),g=>g_s(3),p=>p_s(3) );
	
	C0: clag port map (gin  => g_s,pin  => p_s,cin  => cin,cout => c_s, pout => pout_s,  gout => gout_s);
	cout<=c_s(3);
end rtl;
