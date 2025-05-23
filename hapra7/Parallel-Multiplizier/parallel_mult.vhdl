library ieee;
use ieee.std_logic_1164.all;

--Three blocks are provided in this template(block_1, block_2 and block_3), 
--you can complete the design of this multiplier by connecting these blocks,
--or you can also design your own block based on your implementation.

entity parallel_mult is
  port (
    x,y : in std_logic_vector(3 downto 0);
	z : out std_logic_vector(7 downto 0)
  );
end parallel_mult;

architecture rtl of parallel_mult is

	 signal output1,output2,output3,output4,output5,output6,output7,output8 : std_logic;
	 signal output9,output10,output11,output12,output13,output14,output15,output16 : std_logic; 
	  signal cout_1,cout_2,cout_3,cout_4,cout_5, cout_6, cout_7, cout_8, cout_9, cout_10, cout_11,cout_12 : std_logic; 
	
	component block_1
	port (
    andgate_in_1: in std_logic;
    andgate_in_2: in std_logic;
    andgate_out: out std_logic
	);
	end component;
	
    component block_2
	port (
    a,b,c,cin : in std_logic;
    cout,sum : out std_logic
	);
	end component;
    
	component block_3 
	port (
    a,b,c: in std_logic;
    cout,sum: out std_logic
	);
	end component;
	 
begin
-- (y,x)
    row_0_0 : block_1 port map (andgate_in_1 => y(0), andgate_in_2 => x(0), andgate_out => output1);
    row_0_1 : block_1 port map (andgate_in_1 => y(0), andgate_in_2 => x(1), andgate_out => output2);
    row_0_2 : block_1 port map (andgate_in_1 => y(0), andgate_in_2 => x(2), andgate_out => output3);
    row_0_3 : block_1 port map (andgate_in_1 => y(0), andgate_in_2 => x(3), andgate_out => output4);
	
	row_1_0 : block_3 port map (a => output2 , b=> x(0), c=> y(1), cout => cout_1, sum => output5);
	row_1_1 : block_2 port map (a =>output3 ,b =>x(1), c => y(1), cin => cout_1 ,cout =>  cout_2, sum => output6);
	row_1_2 : block_2 port map (a =>output4 ,b =>x(2), c => y(1), cin => cout_2 ,cout => cout_3, sum => output7);
	row_1_3 : block_3 port map (a => cout_3, b=> x(3), c=> y(1), cout => cout_4, sum => output8);
	
	row_2_0 : block_3 port map (a => output6 , b=> x(0), c => y(2), cout => cout_5, sum => output9);
	row_2_1 : block_2 port map (a =>output7 ,b =>x(1), c => y(2), cin => cout_5 ,cout =>  cout_6, sum => output10);
	row_2_2 : block_2 port map (a =>output8 ,b =>x(2), c => y(2), cin => cout_6 ,cout =>  cout_7, sum => output11);
	row_2_3 : block_2 port map (a =>cout_4 ,b =>x(3), c => y(2), cin => cout_7 ,cout =>  cout_8, sum => output12);
	
	row_3_0 : block_3 port map (a => output10 ,b=> x(0), c => y(3), cout => cout_9, sum => output13); 
	row_3_1 : block_2 port map (a =>output11 ,b =>x(1), c => y(3), cin => cout_9,cout => cout_10, sum => output14);
	row_3_2 : block_2 port map (a =>output12 ,b =>x(2), c => y(3), cin => cout_10 ,cout => cout_11, sum => output15);
	row_3_3 : block_2 port map (a =>cout_8 ,b =>x(3), c => y(3), cin => cout_11 ,cout => cout_12, sum => output16);
	
	z(0) <= output1;
	z(1) <= output5;
	z(2) <= output9;
	z(3) <= output13;
	z(4) <= output14;
	z(5) <= output15;
	z(6) <= output16;
	z(7) <= cout_12;
end rtl;

--first block
library ieee;
use ieee.std_logic_1164.all;

entity block_1 is
  port (
    andgate_in_1: in std_logic;
    andgate_in_2: in std_logic;
    andgate_out: out std_logic
  );
end block_1;

architecture rtl of block_1 is
begin
	andgate_out <= andgate_in_1 and andgate_in_2;
end rtl;

--second block.
library ieee;
use ieee.std_logic_1164.all;

entity block_2 is
  port (
    a,b,c,cin : in std_logic;
    cout,sum : out std_logic
  );
end block_2;

architecture rtl of block_2 is
  signal d : std_logic;
begin
	d <= b and c;
	cout <= (a and d) or (a and cin) or (d and cin);
	sum <= a xor d xor cin;
end rtl;

--third block.
library ieee;
use ieee.std_logic_1164.all;

entity block_3 is
  port (
    a,b,c: in std_logic;
    cout,sum: out std_logic
  );
end block_3;

architecture rtl of block_3 is
	signal d : std_logic;
begin
	d <= b and c;
	sum <= a xor d;
	cout <= a and d;
end rtl;

