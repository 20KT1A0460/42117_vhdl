----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.03.2025 14:49:08
-- Design Name: 
-- Module Name: fifo_32_8bit - fifo_design
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

entity fifo_32_8bit is
    Port ( clk,reset,wr_in : in STD_LOGIC;
           full,empty : inout STD_LOGIC;
           data_in : in STD_LOGIC_VECTOR (7 downto 0);
           data_out : out STD_LOGIC_VECTOR (7 downto 0));
end fifo_32_8bit;

architecture fifo_design of fifo_32_8bit is
    signal w_ptr,r_ptr:integer range 0 to 40;
    type mem_in is array (0 to 32)of std_logic_vector( 7 downto 0);
    signal mem_out: mem_in;
begin
    process(clk,reset,data_in,full,empty)begin
          if(rising_edge(clk))then
               if(reset='0')then
                      w_ptr<=0;
                      r_ptr<=0;    
               else
                   if(wr_in='1'and full='0'and data_in /=x"00"and w_ptr<32)then
                       w_ptr<=w_ptr+1;
                   elsif(wr_in='0'and empty='0'and r_ptr<32)then
                       r_ptr<=r_ptr+1;
                   end if;
               end if;
          end if;
    end process;
    
    process (clk,reset,data_in,full,empty)begin
            if(rising_edge(clk) )then
                if(reset='0')then
                     data_out<=x"00";
                     for i in 0 to 32 loop
                         mem_out(i)<=x"00";
                     end loop;
                else
                if(wr_in='1'and full='0')then
                    mem_out(w_ptr)<=data_in;
                elsif(wr_in='0'and empty='0')then
                    data_out<=mem_out(r_ptr);
                end if; 
                end if; 
            end if;
    end process;
  
  process (clk,reset,data_in)begin
            if(rising_edge(clk))then
                if(reset='0')then
                     full<='0';
                     empty<='1';
                else
                  if( w_ptr= 31 and r_ptr=0)then
                       full<='1';
                  else
                       full<='0';
                  end if;  
                  
                  if( r_ptr = w_ptr)then
                       empty<='1';
                  else
                       empty<='0';
                  end if; 
                     
                end if;  
                
            end if;
    end process;
  
end fifo_design;
