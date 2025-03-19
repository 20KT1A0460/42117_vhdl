----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.03.2025 16:01:32
-- Design Name: 
-- Module Name: fifo_32_8bit_tb - Behavioral
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
use iEEE.numeric_std.all;

library std; 
use std.env.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity fifo_32_8bit_tb is
--  Port ( );
end fifo_32_8bit_tb;

architecture Behavioral of fifo_32_8bit_tb is
      component fifo_32_8bit is 
       Port ( clk,reset,wr_in : in STD_LOGIC;
           full,empty : inout STD_LOGIC;
           data_in : in STD_LOGIC_VECTOR (7 downto 0);
           data_out : out STD_LOGIC_VECTOR (7 downto 0));
      end component;
      
       signal clk,reset,wr_in :  STD_LOGIC;
        signal   full,empty :  STD_LOGIC;
        signal   data_in :  STD_LOGIC_VECTOR (7 downto 0);
       signal  data_out : STD_LOGIC_VECTOR (7 downto 0);
begin
   dut : fifo_32_8bit port map(clk=>clk,reset=>reset,wr_in=>wr_in,full=>full,empty=>empty,data_in=>data_in,data_out=>data_out);
   
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
           
           wr_in<='1';
           for i in 0 to 32 loop
              data_in <= std_logic_vector(to_unsigned(i+10, 8));
             wait for 10 ns;
           end loop;
          
          
          wr_in<='0';
          data_in<=x"00";
          wait for 450 ns;
          
          finish(0);
       end process;

        
end Behavioral;
