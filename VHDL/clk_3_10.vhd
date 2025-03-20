library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity clk_3_10 is port (clk,reset: in std_logic;
                        clk_3_out,clk_10_out:out std_logic);
end clk_3_10;

architecture design of clk_3_10 is
   signal count_3 :std_logic_vector(1 downto 0);
   signal count_10: std_logic_vector(3 downto 0);
 begin

 process (clk,reset) begin

   if(rising_edge(clk))then
       if(reset ='0')then
           count_3<="00";
           count_10<="0000";
       else 
           if(count_3 ="10"  )then
               count_3<="00";
           else 
              count_3<=std_logic_vector(unsigned(count_3)+1); 
           end if;
       clk_3_out<=count_3(1) or count_3(0);
          if( count_10 = "1001" ) then
               count_10<="0000";
          else 
               count_10<=std_logic_vector(unsigned(count_10)+1); 
          end if;
      clk_10_out<=count_10(3) or count_10(2);
      end if;
   end if;
 end process;
    
end design;


library IEEE;
use IEEE.std_logic_1164.all;
library std;
use std.env.all;

entity clk_3_10_tb is end clk_3_10_tb;

architecture sim of clk_3_10_tb is
     component  clk_3_10 is
         port (clk,reset: in std_logic;
               clk_3_out,clk_10_out:out std_logic);
     end component;

     signal clk,reset: std_logic;
     signal clk_3_out,clk_10_out: std_logic;
  begin
 dut : clk_3_10  port map(clk=>clk,reset=>reset,clk_3_out=>clk_3_out,clk_10_out=>clk_10_out);

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
