----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.03.2025 13:43:04
-- Design Name: 
-- Module Name: mem_255_8bit_tb - Behavioral
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

entity mem_255_8bit_tb is
--  Port ( );
end mem_255_8bit_tb;

architecture sim of mem_255_8bit_tb is
       component mem_255_8bit is 
       Port ( clk,reset,w_r_in : in STD_LOGIC;
           data_in,addr_in : in STD_LOGIC_VECTOR (7 downto 0);
           data_out : out STD_LOGIC_VECTOR (7 downto 0)); 
       end component;
       signal clk,reset,w_r_in :  STD_LOGIC;
       signal    data_in,addr_in : STD_LOGIC_VECTOR (7 downto 0);
       signal    data_out :  STD_LOGIC_VECTOR (7 downto 0);
begin
       dut : mem_255_8bit port map(clk=>clk,reset=>reset,w_r_in=>w_r_in,data_in=>data_in,addr_in=>addr_in,data_out=>data_out);
       
       process begin
          clk<='0';
          wait for 5 ns;
          clk<='1';
          wait for 5 ns;
       end process;
       
       
       process begin
           reset<='0';
           wait for 15 ns;
           
           reset<='1';
           
           w_r_in<='1';
           for i in 0 to 20 loop
              addr_in <= std_logic_vector(to_unsigned(i, 8));
              data_in <= std_logic_vector(to_unsigned(i+10, 8));
             wait for 10 ns;
           end loop;
          
          
          w_r_in<='0';
          data_in<=x"00";
            for i in 0 to 20 loop
              addr_in <= std_logic_vector(to_unsigned(i, 8));
             wait for 10 ns;
           end loop;
          
          
          wait for 50 ns;
          
          finish(0);
       end process;

end sim;
