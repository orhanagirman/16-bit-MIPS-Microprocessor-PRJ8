----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:16:02 08/28/2020 
-- Design Name: 
-- Module Name:    sign_extend - Behavioral 
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

entity sign_extend is
    Port ( sign_out : out  STD_LOGIC_VECTOR (15 downto 0);
           sign_in : in  STD_LOGIC_VECTOR (7 downto 0));	 
end sign_extend;

architecture Behavioral of sign_extend is

signal sr : STD_LOGIC_VECTOR(7 downto 0);

signal msb : STD_LOGIC;

begin
     process(sign_in,sr,msb)
	  begin
	       msb <= sign_in(7);
			 if (msb = '1') then
			     sr <= "11111111";
			 elsif (msb = '0') then
              sr <= "00000000";
          end if;				  
			 
			 
	  end process;	
sign_out <= sr & sign_in;	  
end Behavioral;

