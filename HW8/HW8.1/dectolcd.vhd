----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:32:03 08/31/2020 
-- Design Name: 
-- Module Name:    dectolcd - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity dectolcd is
	  port ( lcd_in : in STD_LOGIC_VECTOR (3 downto 0);
	         lcd_out : out STD_LOGIC_VECTOR (7 downto 0));
end dectolcd;

architecture Behavioral of dectolcd is

begin

with lcd_in select
lcd_out <= "00110000" when "0000",
           "00110001" when "0001",
			  "00110010" when "0010",
			  "00110011" when "0011",
           "00110100" when "0100",
			  "00110101" when "0101",
			  "00110110" when "0110",
           "00110111" when "0111",
			  "00111000" when "1000",
			  "00111001" when "1001",
			  "01000001" when "1010",
			  "01000010" when "1011",
           "01000011" when "1100",
			  "01000100" when "1101",
			  "01000101" when "1110",
           "01000110" when "1111",
           "00100000" when others;			  
           
end Behavioral;

