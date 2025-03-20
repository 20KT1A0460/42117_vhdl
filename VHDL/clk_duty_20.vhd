library IEEE;
use IEEE.std_logic_1164.all;

entity clk_duty_20 is
    port (clk,reset : in std_logic;
           clk_20_out: out std_logic);
end clk_duty_20;

architecture design of clk_duty_20 is
   signal count :integer range -1 to 20;

   begin
         process (clk,reset) begin
              if(rising_edge(clk))then
                  if(reset='0') then
                        clk_20_out<='1';
                        count <=-1;
                  else 
                      count<=count+1;
                      if (count=1)then
                          clk_20_out<='0';
                      end if;

                      if(count= 9)then
                          clk_20_out<='1';
                          count<=0;
                      end if;
                  end if;
              end if;
         end process;
   end design;

library IEEE;
use IEEE.std_logic_1164.all;
library std;
use std.env.all;

entity clk_duty_20_tb is end clk_duty_20_tb;

architecture sim of clk_duty_20_tb is
     component  clk_duty_20 is
         port (clk,reset: in std_logic;
               clk_20_out:out std_logic);
     end component;

     signal clk,reset: std_logic;
     signal clk_20_out: std_logic;
  begin
 dut : clk_duty_20  port map(clk=>clk,reset=>reset,clk_20_out=>clk_20_out);

    process begin
       clk<='0';
       wait for 5 ns;
       clk <='1';
       wait for 5 ns;
    end process;

    process begin
       reset<='0';
       wait for 15 ns;
       reset<='1';

       wait for 200 ns;

       finish(0);
    end process;


  end sim;





