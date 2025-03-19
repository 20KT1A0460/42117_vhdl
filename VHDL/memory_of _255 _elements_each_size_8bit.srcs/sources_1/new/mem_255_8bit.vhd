----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.03.2025 12:49:27
-- Design Name: 
-- Module Name: mem_255_8bit - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mem_255_8bit is
    Port ( clk,reset,w_r_in : in STD_LOGIC;
           data_in,addr_in : in STD_LOGIC_VECTOR (7 downto 0);
           data_out : out STD_LOGIC_VECTOR (7 downto 0));
end mem_255_8bit;

architecture mem_design of mem_255_8bit is

type in_mem is array ( 0 to 255 )of std_logic_vector(7 downto 0); 
signal mem_out : in_mem;
begin
process(clk,reset,w_r_in,data_in,addr_in)begin
   if(rising_edge(clk))then
       if(reset='0')then
           data_out<=x"00";
           for i in 0 to 255 loop
              mem_out(i)<=x"00";
           end loop;
       else
           if(w_r_in='1')then
             mem_out(TO_INTEGER(unsigned(addr_in)))<=data_in;
           else
            data_out<=mem_out(TO_INTEGER(unsigned(addr_in)));
           end if;          
       end if;
   end if;
end process;

end mem_design;
