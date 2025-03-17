library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


entity mx_2X1 is
   port (a_in,b_in,s_in:in std_logic;
         y_out:out std_logic);
end mx_2X1;

architecture behaviral of mx_2X1 is
    begin
 mx_pro: process(a_in,b_in,s_in) begin
             -- conditional statement
           /*  y_out<= a_in when (s_in = '0')  else b_in;*/

          /*  -- if else statement
             if (s_in='0') then
                 y_out<=a_in;
             else 
                  y_out<=b_in;
             end if;
        */
            -- case statement
          /*   case (s_in) is
             when  '0' => y_out<= a_in;
             when  '1' => y_out<=b_in;
             when others => y_out <= a_in;
             end case;*/

             -- with select statement
             
             with (s_in) select
             y_out <= a_in when '0',
                      b_in when '1',
                      a_in when others;
              
         end process mx_pro;
end behaviral;


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity mx_2X1_tb is
end mx_2X1_tb;

architecture sim  of mx_2X1_tb is
     component mx_2X1 is
       port(a_in,b_in,s_in :in std_logic;
                y_out:out  std_logic);
     end component;

     signal a_in,b_in,s_in,y_out :std_logic;

     begin

     mx_dut : mx_2X1 port map(a_in => a_in ,
                              b_in => b_in,
                              s_in => s_in,
                              y_out =>y_out);

    sim_pro: process begin
            
            report (" sim start ");
          
                 a_in <= '1';
                 b_in <= '0';
                 s_in <= '1';
            
                wait for 5 ns;

                 a_in <= '0';
                 b_in <= '1';
                 s_in <= '1';
                
                wait for 5 ns;

                 a_in <= '0';
                 b_in <= '1';
                 s_in <= '0';
                
                wait for 5 ns;


                 a_in <= '0';
                 b_in <= '1';
                 s_in <= '1';
                
                wait for 5 ns;

                report("sim stop");
                
                wait;

             end process sim_pro;


   end sim;


