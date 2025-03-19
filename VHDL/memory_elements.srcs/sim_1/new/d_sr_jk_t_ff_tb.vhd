----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.03.2025 10:57:54
-- Design Name: 
-- Module Name: d_sr_jk_t_ff_tb - Behavioral
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

library std; 
use std.env.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity d_sr_jk_t_ff_tb is
--  Port ( );
end d_sr_jk_t_ff_tb;

architecture Behavioral of d_sr_jk_t_ff_tb is
     component d_sr_jk_t_ff is 
         Port ( in_1,in_2,clk,reset : in STD_LOGIC;
           d_out,sr_out,jk_out,t_out : out STD_LOGIC);
     end component;
      signal in_1,in_2,clk,reset :  STD_LOGIC;
       signal d_out,sr_out,jk_out,t_out : STD_LOGIC;
begin

    dut : d_sr_jk_t_ff port map(in_1 =>in_1,in_2=>in_2,clk=>clk,reset=>reset,d_out=>d_out,sr_out=>sr_out,jk_out=>jk_out,t_out=>t_out);
    
 clk_pro:   process begin
              clk<='0';
             wait for 5 ns;
              clk<='1';
             wait for 5 ns;
            
    end process clk_pro;
    
  sim_pro:  process begin
             
             reset<='0';
             wait for 15 ns ;
             reset<='1';
             
             in_1<='0';
             in_2<='0';
             
             wait for 10 ns;
             in_1<='0';
             in_2<='1';
             
             wait for 10 ns;
             in_1<='1';
             in_2<='0';
             
             wait for 10 ns;
             in_1<='1';
             in_2<='1';
             
             wait for 10 ns;
             
              in_1<='0';
             in_2<='0';
             
             wait for 10 ns;
             in_1<='0';
             in_2<='1';
             
             wait for 10 ns;
             in_1<='1';
             in_2<='0';
             
             wait for 10 ns;
             in_1<='1';
             in_2<='1';
             
             wait for 10 ns;
             
             in_1<='1';
             in_2<='0';
             
             wait for 50ns;
             
             finish(0);
             
    end process  sim_pro;


end Behavioral;
