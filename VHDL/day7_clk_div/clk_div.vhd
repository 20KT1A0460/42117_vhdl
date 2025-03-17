library IEEE;
use IEEE.std_logic_1164.all;

entity clk_div is port (clk ,reset : in std_logic;
                        clk_div_2,clk_div_4 : out std_logic);

end clk_div;

architecture clk_design of clk_div is
 signal count : integer range 0 to 10;
  begin
  process (clk,reset) begin
        if(rising_edge(clk)) then
             if(reset = '0') then
                  clk_div_2 <='0';
                  clk_div_4 <='0';
                  count<=0;
             else
                 clk_div_2 <= not clk_div_2;
                 count<=count+1;

                 if(count=2) then
                     count<=1;
                     clk_div_4<=not clk_div_4;
                 end if;
             end if;        
        end if;

        
  end process;

  end clk_design;

  library IEEE;
  use IEEE.std_logic_1164.all;

  library std;
  use std.env.all;

  entity clk_div_tb is
 
  end clk_div_tb;


  architecture sim of clk_div_tb is

  component clk_div is
          port (clk ,reset : in std_logic;
                        clk_div_2,clk_div_4 : out std_logic);
  end component;

  
   signal clk ,reset :  std_logic;
   signal clk_div_2,clk_div_4 :  std_logic;

   begin

   dut :clk_div port map(clk=> clk,reset=>reset,clk_div_2=>clk_div_2,clk_div_4=>clk_div_4);


   process begin
   clk<='0';
    wait for 5 ns;
   clk<='1';
    wait for 5 ns;
   end process;

   process begin
       reset<='0';
       wait for 10 ns ;
       reset<='1';

       wait for 200 ns;

       finish(0);
  end process;

  end sim;

