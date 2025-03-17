library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity day_2_as is 
port(a,b,c:in std_logic;
       y:out std_logic);
end day_2_as;

architecture  dataflow of day_2_as is
begin
     y<=a or (b and c);
end dataflow;



library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity day_2_as_tb is 
end day_2_as_tb;

architecture sim of day_2_as_tb is
    -- Component declaration
    component day_2_as is
        port(
            a, b, c: in std_logic;
            y: out std_logic
        );
    end component;
    
    -- Signal declarations
    signal a, b, c: std_logic;
    signal y: std_logic;
    
begin
    -- Component instantiation
    dut: day_2_as 
        port map(
            a => a,
            b => b,
            c => c,
            y => y
        );
        
    -- Stimulus process
    sim_as: process
    begin
        a <= '0'; b <= '1'; c <= '1'; 
        wait for 5 ns;
        a <= '1'; b <= '1'; c <= '1'; 
        wait for 5 ns;
        a <= '0'; b <= '0'; c <= '1';
        wait for 5 ns;
        a <= '0'; b <= '1'; c <= '0';
        wait for 5 ns;
        a <= '1'; b <= '0'; c <= '0';
        wait;  -- Wait indefinitely at the end
    end process sim_as;
end sim;
