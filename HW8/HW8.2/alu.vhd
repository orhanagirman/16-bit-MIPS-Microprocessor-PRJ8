----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:57:03 08/14/2020 
-- Design Name: 
-- Module Name:    alu - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity alu is
    Port ( A : in  STD_LOGIC_VECTOR (15 downto 0);
           B : in  STD_LOGIC_VECTOR (15 downto 0);
           S : out  STD_LOGIC_VECTOR (15 downto 0);
           a_sel : in  STD_LOGIC_VECTOR (3 downto 0);
          -- carry_out : out  STD_LOGIC;
			 -- overflow : out  STD_LOGIC;
			 -- negative : out  STD_LOGIC;
			  zero : out  STD_LOGIC);
end alu;

architecture Behavioral of alu is

component mux4to1
    Port ( mux_in : in  STD_LOGIC_VECTOR (3 downto 0);
           mux_sel : in  STD_LOGIC_VECTOR (1 downto 0);
           output : out  STD_LOGIC);
end component;

component mux2to1
    Port ( mux_in : in  STD_LOGIC_VECTOR (1 downto 0);
           mux_sel : in  STD_LOGIC;
           output : out  STD_LOGIC);
end component;

component fulladder
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           cin : in  STD_LOGIC;
           s : out  STD_LOGIC;
           cout : out  STD_LOGIC);
end component;


signal mux4_out1 : STD_LOGIC_VECTOR (15 downto 0); 
signal mux2_out1 : STD_LOGIC_VECTOR (15 downto 0);
signal mux2_out2 : STD_LOGIC_VECTOR (15 downto 0); 
signal s_out : STD_LOGIC_VECTOR (15 downto 0);
signal fa_cout : STD_LOGIC_VECTOR (15 downto 0);
signal zero_port : STD_LOGIC;
signal sr : STD_LOGIC_VECTOR (15 downto 0);


begin


M1: mux4to1 port map (mux_in(3) => B(0), mux_in(2) => a_sel(0), mux_in(1) => '1', mux_in(0) => '0', mux_sel => a_sel(2 downto 1), output => mux4_out1(0));
M2: mux2to1 port map (mux_in(0) => B(0) ,mux_in(1) => not B(0), mux_sel => a_sel(0), output => mux2_out1(0));
FA1: fulladder port map (a => A(0), b => mux2_out1(0), cin => mux4_out1(0), s => s_out(0), cout => fa_cout(0));
M3: mux2to1 port map (mux_in(0) => s_out(0) ,mux_in(1) => fa_cout(0), mux_sel => a_sel(3), output => mux2_out2(0)); --S0);
      

	       loop1: for i in 1 to 15 generate
			            M1n: mux4to1 port map (mux_in(3) => B(i), mux_in(2) => fa_cout(i-1), mux_in(1) => '1', mux_in(0) => '0', mux_sel => a_sel(2 downto 1), output => mux4_out1(i));
                     M2n: mux2to1 port map (mux_in(0) => B(i) ,mux_in(1) => not B(i), mux_sel => a_sel(0), output => mux2_out1(i));
                     FAn: fulladder port map (a => A(i), b => mux2_out1(i), cin => mux4_out1(i), s => s_out(i), cout => fa_cout(i));
                     M3n: mux2to1 port map (mux_in(0) => s_out(i) ,mux_in(1) => fa_cout(i), mux_sel => a_sel(3), output => mux2_out2(i)); --S0);
			        end generate loop1;
                     
					  
          process(mux2_out2,fa_cout(15),B,A)
          begin
			      if(a_sel = "0101") then
                  if(mux2_out2 = "0000000000000000" and fa_cout(15) = '0') then
                      zero<='1';
					   elsif	(mux2_out2 = "0000000000000000" and fa_cout(15) = '1') then
					       zero <= '1';
						else
                     zero <= '0';
						end if;
						S <= mux2_out2;
					elsif(a_sel = "0100") then
                    if(mux2_out2 = "0000000000000000" and fa_cout(15) = '0') then
                       zero<='1';
					     else	
					        zero <= '0';
                    end if;
						 S <= mux2_out2;
					 elsif(a_sel = "1101") then
          				S <= B;						
                elsif(a_sel = "1111") then
					      if (B = "0000000000000000") then
          				    S <= A(15 downto 0);
                     elsif (B = "0000000000000001") then
                         S <= A(14 downto 0) & '0';
                     elsif (B = "0000000000000010") then
                         S <= A(13 downto 0) & "00";
                     elsif (B = "0000000000000011") then
                         S <= A(12 downto 0) & "000";
                     elsif (B = "0000000000000100") then
                         S <= A(11 downto 0) & "0000";
                     elsif (B = "0000000000000101") then
                         S <= A(10 downto 0) & "00000";
                     elsif (B = "0000000000000110") then
                         S <= A(9 downto 0) & "000000";
                     elsif (B = "0000000000000111") then
                         S <= A(8 downto 0) & "0000000";
                     elsif (B = "0000000000001000") then
                         S <= A(7 downto 0) & "00000000";
                     elsif (B = "0000000000001001") then
                         S <= A(6 downto 0) & "000000000";
                     elsif (B = "0000000000001010") then
                         S <= A(5 downto 0) & "0000000000";
                     elsif (B = "0000000000001011") then
                         S <= A(4 downto 0) & "00000000000";
                     elsif (B = "0000000000001100") then
                         S <= A(3 downto 0) & "000000000000";
                     elsif (B = "0000000000001101") then
                         S <= A(2 downto 0) & "0000000000000";
                     elsif (B = "0000000000001110") then
                         S <= A(1 downto 0) & "00000000000000";
                     elsif (B = "0000000000001111") then
                         S <= A(0) & "000000000000000";
                     elsif (B = "0000000000011111") then
                         S <= '0' & A(15 downto 1);									 								 
                     end if;
					elsif(a_sel = "1110") then
					      if (B = "0000000000000000") then
          				    S <= A(15 downto 0);
                     elsif (B = "0000000000000001") then
                         S <= A(14 downto 0) & '0';
                     elsif (B = "0000000000000010") then
                         S <= A(13 downto 0) & "00";
                     elsif (B = "0000000000000011") then
                         S <= A(12 downto 0) & "000";
                     elsif (B = "0000000000000100") then
                         S <= A(11 downto 0) & "0000";
						   elsif (B = "0000000001000001") then
                         S <= A(14 downto 0) & '0';
                     elsif (B = "0000000000000101") then
                         S <= A(10 downto 0) & "00000";
                     elsif (B = "0000000000000110") then
                         S <= A(9 downto 0) & "000000";
                     elsif (B = "0000000000000111") then
                         S <= A(8 downto 0) & "0000000";
                     elsif (B = "0000000000001000") then
                         S <= A(7 downto 0) & "00000000";
                     elsif (B = "0000000000001001") then
                         S <= A(6 downto 0) & "000000000";
                     elsif (B = "0000000000001010") then
                         S <= A(5 downto 0) & "0000000000";
                     elsif (B = "0000000000001011") then
                         S <= A(4 downto 0) & "00000000000";
                     elsif (B = "0000000000001100") then
                         S <= A(3 downto 0) & "000000000000";
                     elsif (B = "0000000000001101") then
                         S <= A(2 downto 0) & "0000000000000";
                     elsif (B = "0000000000001110") then
                         S <= A(1 downto 0) & "00000000000000";
                     elsif (B = "0000000000001111") then
                         S <= A(0) & "000000000000000";
                     elsif (B = "0000000000011111") then
                         S <= '0' & A(15 downto 1);									 
                     end if;
					 elsif (a_sel = "1100") then
                       S <= A;							
                else
					     S <= mux2_out2;
					     zero <= '0';
 					 
                end if;				 
           end process;			
           			  

end Behavioral;

