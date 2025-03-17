library IEEE;
use IEEE.std_logic_1164.all;
entity loops is 
end loops;
architecture  sim of loops is
      signal a_in ,b_in,c_in : integer;
   begin
     process begin
        for i in  0 to 10 loop
             a_in <= i;
             b_in <= i+2;
             wait for 10 ns;
             c_in <= a_in+b_in;
             wait for 10 ns;
             report "--- a_in =" &integer'image(a_in) & "---- b_in=" &integer'image(b_in)& "---c_in="&integer'image(c_in);
        end loop;
        wait;
     end process;
 end sim;
