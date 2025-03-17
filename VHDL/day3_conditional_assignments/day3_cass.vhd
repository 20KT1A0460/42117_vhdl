library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity day_cass is 
port (a,b: in std_logic_vector(2 downto 0);
      sel: in std_logic;
      y: out std_logic_vector(2 downto 0));
end day_cass;

architecture dataflow of day_cass is
begin
    y<= a when (sel='0') else b;
end dataflow;


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity day_cass_tb is
end day_cass_tb;

architecture sim of day_cass_tb is
    component day_cass is
       port(a,b: in  std_logic_vector(2 downto 0);
         sel: in std_logic;
         y: out std_logic_vector(2 downto 0));
    end component;

    signal a,b : std_logic_vector(2 downto 0);
    signal sel :std_logic;
    signal y :std_logic_vector(2 downto 0);
begin
    dut:day_cass port map(a=>a,
                          b=>b,
                          sel=>sel,
                          y=>y);

  sim_pro:process 
  begin
     report " starting sim";
    a<="111"; b<="100"; sel<='0';
    wait for 4 ns;
    a<="011"; b<="100"; sel<='1';
    wait for 4 ns;
    a<="101"; b<="110"; sel<='0'; 
    wait for 4 ns;
    a<="111"; b<="101"; sel<='1'; 
    wait for 4 ns;
    a<="110"; b<="101"; sel<='0'; 
    wait for 4 ns;
    report "end sim";
    wait;  
  end process sim_pro;
end sim;
