----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.03.2025 10:30:11
-- Design Name: 
-- Module Name: d_sr_jk_t_ff - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity d_sr_jk_t_ff is
    Port ( in_1,in_2,clk,reset : in STD_LOGIC;
           d_out,sr_out,jk_out,t_out : out STD_LOGIC);
end d_sr_jk_t_ff;

architecture Behavioral of d_sr_jk_t_ff is

signal in_sr,in_jk,in_d,in_t :std_logic;

begin
       sr_out<=in_sr;
       jk_out<=in_jk;
       d_out<=in_d;
       t_out<=in_t;
       
       
   sr_ff:process (clk,reset,in_1,in_2) begin
        if(rising_edge(clk))then
               if(reset='0')then
                     in_sr<='0';
               else
                  if(in_1='0'and in_2='0')then
                       in_sr<=in_sr;
                  elsif (in_1='0'and in_2='1') then
                        in_sr<='0';  
                  elsif (in_1='1'and in_2='0') then
                        in_sr<='1';  
                  else
                    in_sr<='-';
                  end if;
              end if;                
        end if;
       
   end process sr_ff;
   
   jk_ff: process (clk,reset,in_1,in_2) begin
        if(rising_edge(clk))then
               if(reset='0')then
                     in_jk<='0';
               else
                  if(in_1='0'and in_2='0')then
                       in_jk<=in_jk;
                  elsif (in_1='0'and in_2='1') then
                        in_jk<='0';  
                  elsif (in_1='1'and in_2='0') then
                        in_jk<='1';  
                  else
                        in_jk<=not in_jk;  
                  end if;
              end if;                
        end if;
        
   end process jk_ff;
   
   
  d_ff:  process (clk,reset,in_1) begin
        if(rising_edge(clk))then
               if(reset='0')then
                     in_d<='0';
               else
                     in_d<=in_1;
              end if;                
        end if;
       
   end process d_ff;
   
   t_ff:  process (clk,reset,in_2) begin
        if(rising_edge(clk))then
               if(reset='0')then
                     in_t<='0';
               else
                  if(in_2<='0')then
                       in_t<=in_t;
                  else 
                       in_t<=not in_t;
                  end if;
                     
              end if;                
        end if;
       
   end process t_ff;
   

end Behavioral;
