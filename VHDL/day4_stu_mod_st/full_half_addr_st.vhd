library IEEE;
use IEEE.std_logic_1164.all;

entity half_addr is
  -- generic (n:positive);
   port(a_in,b_in:in std_logic;
        sum_out :out std_logic;
        carry_out :out std_logic);
end half_addr;

architecture st_mod of half_addr is
 begin
       sum_out<= a_in xor b_in;
       carry_out <= a_in and b_in;
end st_mod;




library IEEE;
use IEEE.std_logic_1164.all;

entity full_addr is
   
   port(a_in,b_in:in std_logic;
        c_in :in std_logic ;
        sum_out :out std_logic;
        carry_out :out std_logic);
end full_addr;

architecture st_mod_st of full_addr is
   component half_addr is
         
    port(a_in,b_in:in std_logic;
        sum_out :out std_logic;
        carry_out :out std_logic);
    end component;    

    signal s1:std_logic;
    signal c1,c2:std_logic;
 begin

   h1 : half_addr  port map (a_in =>a_in,b_in=>b_in,sum_out=>s1,carry_out=>c1);
   h2 : half_addr  port map (a_in =>s1,b_in=>c_in,sum_out=>sum_out,carry_out=>c2);
   carry_out <= c1 or c2;       
end st_mod_st;


