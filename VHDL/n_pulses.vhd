library IEEE;
use IEEE.std_logic_1164.all;

entity n_pulses is port (clk,reset: in std_logic;
                         n_pulse: in  integer range 0 to 255;
                         pulse_out:out std_logic);
end n_pulses;

architecture design of n_pulses is
   signal in_s: std_logic;
   signal count :integer range 0 to 255;
 begin

 process (clk,reset,n_pulse) begin

   if(rising_edge(clk))then
       if(reset ='0')then
           count<=0;
           in_s<='0';
       else 
           count<=count+1;

           if( count>2*n_pulse-1 )then
                in_s<=in_s;
           else 
               in_s<=not in_s;  
           end if;
      end if;
   end if;
 end process;
 pulse_out<=in_s;
    
end design;


library IEEE;
use IEEE.std_logic_1164.all;
library std;
use std.env.all;

entity n_pulses_tb is end n_pulses_tb;

architecture sim of n_pulses_tb is
     component  n_pulses is
         port (clk,reset: in std_logic;
                         n_pulse: in  integer range 0 to 255;
                         pulse_out:out std_logic);
     end component;

     signal clk,reset: std_logic;
     signal  n_pulse:  integer range 0 to 255;
     signal pulse_out: std_logic;
  begin
 dut : n_pulses port map(clk=>clk,reset=>reset,n_pulse=>n_pulse,pulse_out=>pulse_out);

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

       n_pulse<=7;

       wait for 200 ns;

       finish(0);
    end process;


  end sim;
