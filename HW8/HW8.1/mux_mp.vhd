----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:48:22 08/28/2020 
-- Design Name: 
-- Module Name:    mux_mp - Behavioral 
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

entity mux_mp is
    Port ( mux_ina : in  STD_LOGIC_VECTOR (15 downto 0);
           mux_inb : in  STD_LOGIC_VECTOR (15 downto 0);
           mux_sel : in  STD_LOGIC;
           mux_out : out  STD_LOGIC_VECTOR (15 downto 0));
end mux_mp;

architecture Behavioral of mux_mp is

begin
     process(mux_ina,mux_inb,mux_sel)
	  begin
	       if (mux_sel = '0') then
			     mux_out <= mux_ina;
			 elsif (mux_sel = '1') then
              mux_out <= mux_inb;			 
          end if;
	  end process;		 

end Behavioral;

