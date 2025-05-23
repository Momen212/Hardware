Library IEEE;
USE IEEE.Std_logic_1164.all;

entity piso_register is
    port(
        pinput : in std_logic_vector(3 downto 0);
        Clk : in std_logic;
        clear : in std_logic;
        write : in std_logic; -- write auf 1: es kann geschrieben werden. 
        sout : out std_logic
    );
end piso_register;

architecture behavioral of piso_register is
    component DFlipFlop is
        port(
            D : in std_logic;
            Clk : in std_logic;
            reset : in std_logic;
            Q : out std_logic
        );
        end component;

        -- ob paralle geschrieben oder seriel geschoben wird ist hier als 21mux implementiert 
        component mux21 is
            port(
                i1 : IN std_logic;
                i2 : IN std_logic;
                sel : IN std_logic; 
                y : OUT std_logic
            );
            end component;

signal d1: std_logic;
signal d2: std_logic;   
signal d3: std_logic;

signal m1: std_logic;
signal m2: std_logic;   
signal m3: std_logic;
signal m4: std_logic;

    begin
  
mux1 : mux21 port map(i1 => pinput(0), i2 => '0', sel =>write, y => m1);
flipflop1 : DFlipFlop port map(d => m1, clk => Clk, reset => clear, Q => d1);


mux2 : mux21 port map(i1 => pinput(1), i2 => d1, sel =>write, y => m2);
flipflop2 : DFlipFlop port map(d => m2, clk => Clk, reset => clear, Q => d2);


mux3 : mux21 port map(i1 => pinput(2), i2 => d2, sel =>write, y => m3);
flipflop3 : DFlipFlop port map(d => m3, clk => Clk, reset => clear, Q => d3);

mux4  : mux21 port map(i1 => pinput(3), i2 => d3, sel =>write, y => m4);
flipflop4 : DFlipFlop port map(d => m4, clk => Clk, reset => clear, Q => sout);


    end behavioral;    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
