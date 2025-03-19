----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.03.2025 12:19:36
-- Design Name: 
-- Module Name: vm_fsm - fsm
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

entity vm_fsm is
    Port ( clk,reset : in STD_LOGIC;
           rupee : in std_logic_vector(7 downto 0);
           y_ex_rupee,y_less_rupee: inout std_logic_vector(7 downto 0);
           y_final_out : out STD_LOGIC);
end vm_fsm;

architecture fsm of vm_fsm is

type state is( A,B,C,D);

signal ns,ps : state;
        
begin
  process (clk,reset,rupee) begin
         
          if(rising_edge(clk))then
             if(reset = '0')then
                 y_final_out <= '0';
                 y_ex_rupee <= x"00";
                 y_less_rupee <= x"00";
                 ps <=A;
         
             else
                 ps<=ns;
             end if;
          end if;
          
      if(rising_edge(clk) and reset='1') then 
        case (ps) is
          when A =>   
                      if(rupee = x"14")then  
                         y_final_out <= '1';
                         y_ex_rupee <= x"00";
                         y_less_rupee <= x"00";
                         ns<=A;
                      else 
                       y_final_out<='0';
                       ns <=B;
                     end if;
        when  B =>
                      if  (rupee  < x"14") then
                         y_final_out <= '0';
                         y_ex_rupee <= x"00";
                         y_less_rupee <= std_logic_vector(20 - unsigned(rupee));
                         ns<=C;
                      else
                          ns<=D;
                      end if;
         when C =>  
                      if (rupee  = y_less_rupee)then
                         y_final_out <= '1';
                         y_ex_rupee <= x"00";
                         y_less_rupee <=x"00";
                         ns<=A;
                         
                      else 
                        ns<= A;
                        y_final_out<='0';
                      end if;
        when D =>   
                      if (rupee > x"14")then
                         y_final_out <= '1';
                         y_ex_rupee <=std_logic_vector( unsigned(rupee)-20) ;
                         y_less_rupee <=x"00";
                         ns<=A;
                      else
                         ns<=A;
                         y_final_out<='0';
                      end if;
                      
        when others => ns<= A;
          end case;
          
      end if;
          
         end process;

end fsm;
