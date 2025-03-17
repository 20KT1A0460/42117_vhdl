library IEEE;
use IEEE.std_logic_1164.all;

entity fsm is 
   port( clk,x,reset: in std_logic;
          y : out std_logic);
end fsm;

architecture  fsm_design of fsm is
  type state is  (A,B,C,D);

  attribute enum_encoding:string;
  attribute enum_encoding of state : type is "00 01 10 11";

  signal ps,ns: state;
   begin
     
     process (clk,reset,x) begin
         if(reset = '0' and rising_edge(clk)) then
             ps<= A;
             y<='0';
         else
             ps<=ns;
         end if;
         
         if (rising_edge(clk)) then
         case(ps) is 
            when A =>  if x='1' then ns <= B; y<='0'; else ns <= A;  end if;
            when B =>  if x='0' then ns <= C; y<='0'; else ns <= B;  end if;
            when C =>  if x='0' then ns <= D; y<='0'; else ns <= B;  end if;
            when D =>  if x='1' then ns <= B; Y<='1'; else ns <= A;  end if;
            when others => ns <= A;
         end case;
        end if;
     end process;
 end fsm_design;

library IEEE;
use IEEE.std_logic_1164.all;
library std;
use std.env.all;


entity  fsm_tb is
end fsm_tb ;

architecture sim of fsm_tb is
   component  fsm  is
        port( clk,x,reset: in std_logic;
               y : out std_logic);
   end component;

   signal clk,reset,x,y :std_logic;
  begin
        dut : fsm port map (clk => clk,reset=>reset,x=>x,y=>y);

        process begin
           clk<= '0';
           wait for 5 ns;
           clk<='1';
           wait for 5 ns;
        end process;

        process begin
         -- clk<= '0';
          reset <='0';
          wait for  10 ns;

          reset<= '1';
          wait for 5 ns;

          x<= '1';
          wait for 10 ns;
          x<= '0';
          wait for 10 ns;
          x<= '0';
          wait for 10 ns;
          x<= '1';
          wait for 10 ns;
          x<= '0'; 
          wait for 10 ns;
           x<= '1';
          wait for 10 ns;
          x<= '0';
          wait for 10 ns;
          x<= '0';
          wait for 10 ns;
          x<= '1';
          wait for 10 ns;
          x<= '0'; 
          wait for 10 ns;



        -- assert false report " end simulation " severity failure;
        finish(0);

        end process;
  end sim;


