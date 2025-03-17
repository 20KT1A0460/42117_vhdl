library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity fun_prod is  
    port( 
        a_in, b_in, c_in, d_in : in unsigned(3 downto 0);
        m_in : in std_logic; 
        y_out, z_out : out unsigned(7 downto 0)
    ); 
end fun_prod;

architecture function_design of fun_prod is  
   -- Modified function to explicitly handle 4-bit inputs and return 8-bit output
   function addition(signal s1, s2: unsigned(3 downto 0)) return unsigned is 
       variable y : unsigned(7 downto 0);
   begin   
       -- Resize inputs to 8 bits to prevent overflow
       y := resize(s1, 8) + resize(s2, 8);
       return y;
   end addition;
   
   procedure multiplication(
       signal s1, s2: in unsigned(3 downto 0);  
       signal y: out unsigned(7 downto 0)
   ) is 
   begin
       y <= s1 * s2;
   end multiplication;
begin
    y_out <= addition(a_in, b_in);
    
    process (m_in, c_in, d_in) 
    begin
        if(m_in = '1') then  
            multiplication(c_in, d_in, z_out); 
        end if;
    end process;
end function_design;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity fun_prod_tb is  
end fun_prod_tb;

architecture sim of fun_prod_tb is 
    component fun_prod is   
        port( 
            a_in, b_in, c_in, d_in : in unsigned(3 downto 0);
            m_in : in std_logic; 
            y_out, z_out : out unsigned(7 downto 0)
        ); 
    end component;
    
    signal a_in, b_in, c_in, d_in : unsigned(3 downto 0);
    signal m_in : std_logic; 
    signal y_out, z_out : unsigned(7 downto 0); 
begin
    dut : fun_prod 
    port map( 
        a_in => a_in,
        b_in => b_in,
        c_in => c_in,
        d_in => d_in,
        m_in => m_in,
        y_out => y_out,
        z_out => z_out
    );
       
    process 
    begin
        -- Corrected literal syntax
        a_in <= to_unsigned(14, 4);  -- 14 decimal in 4 bits
        b_in <= to_unsigned(12, 4);  -- 12 decimal in 4 bits
        m_in <= '1';
        c_in <= to_unsigned(7, 4);   -- 7 decimal in 4 bits
        d_in <= to_unsigned(8, 4);   -- 8 decimal in 4 bits
        wait for 5 ns;
        
        a_in <= to_unsigned(12, 4);  -- 12 decimal in 4 bits
        b_in <= to_unsigned(13, 4);  -- 13 decimal in 4 bits
        m_in <= '1';
        c_in <= to_unsigned(2, 4);   -- 2 decimal in 4 bits
        d_in <= to_unsigned(5, 4);   -- 5 decimal in 4 bits
        wait for 5 ns;
              
        a_in <= to_unsigned(10, 4);  -- 10 decimal in 4 bits
        b_in <= to_unsigned(13, 4);  -- 13 decimal in 4 bits
        m_in <= '1';
        c_in <= to_unsigned(5, 4);   -- 5 decimal in 4 bits
        d_in <= to_unsigned(6, 4);   -- 6 decimal in 4 bits
        wait for 5 ns;
        
        assert false report "Finished simulation" severity failure;
    end process;
end sim;
