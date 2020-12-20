----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:22:21 08/14/2020 
-- Design Name: 
-- Module Name:    mux - Behavioral 
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

entity mux is
    Port ( register_mux0,register_mux1,register_mux2,
           register_mux3,register_mux4,register_mux5,register_mux6,register_mux7,register_mux8,
           register_mux9,register_mux10,register_mux11,register_mux12,register_mux13,register_mux14,
           register_mux15: in STD_LOGIC_VECTOR (15 downto 0);
           Rab_mux : in  STD_LOGIC_VECTOR (3 downto 0);
           output : out  STD_LOGIC_VECTOR (15 downto 0));
end mux;

architecture Behavioral of mux is


begin
     process(register_mux0,register_mux1,register_mux2,register_mux3,register_mux4,register_mux5,
             register_mux6,register_mux7,register_mux8,register_mux9,register_mux10,register_mux11,register_mux12,
             register_mux13,register_mux14,register_mux15,Rab_mux)
	  begin
	       if (Rab_mux = "0000") then
			     output<=register_mux0;
			 elsif (Rab_mux = "0001") then
			     output<=register_mux1;
			 elsif (Rab_mux = "0010") then
			     output<=register_mux2;
			 elsif (Rab_mux = "0011") then
			     output<=register_mux3;
			 elsif (Rab_mux = "0100") then
			     output<=register_mux4;
			 elsif (Rab_mux = "0101") then
			     output<=register_mux5;
			 elsif (Rab_mux = "0110") then
			     output<=register_mux6;
			 elsif (Rab_mux = "0111") then
			     output<=register_mux7;
			 elsif (Rab_mux = "1000") then
			     output<=register_mux8;
			 elsif (Rab_mux = "1001") then
			     output<=register_mux9;
			 elsif (Rab_mux = "1010") then
			     output<=register_mux10;
			 elsif (Rab_mux = "1011") then
			     output<=register_mux11;
			 elsif (Rab_mux = "1100") then
			     output<=register_mux12;
			 elsif (Rab_mux = "1101") then
			     output<=register_mux13;
			 elsif (Rab_mux = "1110") then
			     output<=register_mux14;
			 elsif (Rab_mux = "1111") then
			     output<=register_mux15;
          end if;
     end process;			 
end Behavioral;

