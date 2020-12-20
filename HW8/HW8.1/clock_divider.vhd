----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:38:57 08/05/2020 
-- Design Name: 
-- Module Name:    clockdivider - Behavioral 
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
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity clock_divider is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
			  value: in integer;
           output : out  STD_LOGIC);
end clock_divider;

architecture Behavioral of clock_divider is
signal count: integer:= 0;
signal tmp: STD_LOGIC:= '0';
begin
process(clk,rst,tmp)
begin
	if(rst = '1') then
	count <= 1;
	tmp <= '0';
	elsif rising_edge(clk) then
	count <= count + 1;
		if (count=value) then
		tmp <= not tmp;
		count<=1;
		end if;
	end if;
	output <= tmp;
end process;
end Behavioral;
