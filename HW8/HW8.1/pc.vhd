----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:42:57 08/28/2020 
-- Design Name: 
-- Module Name:    pc - Behavioral 
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

entity pc is
    Port ( clk : in  STD_LOGIC;
	        rst : in  STD_LOGIC;
			  jmp_in : in STD_LOGIC;
			  d : in  STD_LOGIC_VECTOR (15 downto 0);
           q : out  STD_LOGIC_VECTOR (15 downto 0));
end pc;

architecture Behavioral of pc is

begin
     process(clk,rst,jmp_in)
	  begin
	       if (rst = '1') or (jmp_in = '1') then 
			     q <= "0000000000000000";
			 else
              if rising_edge(clk) then
					  q <= d;
				  end if; 				  
          end if;
    end process;
end Behavioral;

