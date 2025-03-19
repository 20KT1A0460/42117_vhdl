----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.03.2025 14:29:11
-- Design Name: 
-- Module Name: vm_fsm_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

library std;
use std.env.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity vm_fsm_tb is
--  Port ( );
end vm_fsm_tb;

architecture Behavioral of vm_fsm_tb is
      component vm_fsm is 
           Port ( clk,reset : in STD_LOGIC;
                   rupee : in std_logic_vector(7 downto 0);
                  y_ex_rupee,y_less_rupee: inout std_logic_vector(7 downto 0) ;
                   y_final_out : out STD_LOGIC);
       end component;
       
       signal clk,reset :  STD_LOGIC;
       signal rupee :  std_logic_vector(7 downto 0);
       signal y_ex_rupee,y_less_rupee: std_logic_vector(7 downto 0);
       signal y_final_out :  STD_LOGIC;
begin
       vm : vm_fsm port map(clk => clk,
                            reset => reset,
                            rupee => rupee,
                            y_ex_rupee => y_ex_rupee,
                            y_less_rupee =>y_less_rupee,
                            y_final_out =>y_final_out);
                            
                            
      process begin 
      clk <='0';
      wait for 5 ns;
      clk <='1';
      wait for 5 ns;
      end process;
      
      process begin
          reset <='0';
         
          wait for 15 ns;
          
          reset <='1';
          
          rupee <= x"0f";
          
          wait for 40 ns;
          
           rupee <= x"05";
          
          wait for 20 ns;
          
             rupee <=x"25";
         
         
          wait for 100  ns;
          
          finish(0);
      end process;
end Behavioral;
