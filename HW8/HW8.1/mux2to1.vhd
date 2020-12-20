----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:01:43 08/14/2020 
-- Design Name: 
-- Module Name:    mux4to1 - Behavioral 
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

entity mux2to1 is
    Port ( mux_in : in  STD_LOGIC_VECTOR (1 downto 0);
           mux_sel : in  STD_LOGIC;
           output : out  STD_LOGIC);
end mux2to1;

architecture Behavioral of mux2to1 is

begin
    process(mux_in,mux_sel)
	 begin
	      if (mux_sel = '0') then
			   output <= mux_in(0);
			elsif (mux_sel = '1') then
			   output <= mux_in(1);
			end if;
    end process;			

end Behavioral;

