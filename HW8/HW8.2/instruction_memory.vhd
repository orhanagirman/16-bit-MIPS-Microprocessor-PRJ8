----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:02:21 08/28/2020 
-- Design Name: 
-- Module Name:    instruction_memory - Behavioral 
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

entity instruction_memory is
    Port ( inst_A : in  STD_LOGIC_VECTOR (15 downto 0);
           RD : out  STD_LOGIC_VECTOR (15 downto 0));
end instruction_memory;

architecture Behavioral of instruction_memory is

type array_type is array (integer range <>) of STD_LOGIC_VECTOR (15 downto 0);
signal inst_register : array_type (46 downto 0):=("1111000000000000","1101000000000001","0101000000000010","1001000000000011","1101000100000010","0000000011010001","0010000000000011","0001000000000010"
,"0011000000001110","1101000100000110","0000000000100001","1101000100000011","0000000000110001","0001000000000100","1000000001000001","0000000000010001"
,"1101000100000001","1101000000000100","1000000000011111","1101000100001001","0000000011010001","1101000100000010","0000000010010001","1101000100001010"
,"1101001000000000","0100000101000010","0100000000000010","1011000000001010","0000000010110001","1100000000001101","0000000000100000","1101000000000000"
,"1101000000000001","1101000000000010","1101000000000011","1101000000000100","1101000000000101","1101000000000110","1101000000000111","1101000000001000"
,"1101000000001001","1101000000001010","1101000000001011","1101000000001100","1101000000001101","1101000000001110","1101000000001111");

begin
     with inst_A select
	  RD <= inst_register(45) when "0000000000000000",
           inst_register(44) when "0000000000000001",
			  inst_register(43) when "0000000000000010",
			  inst_register(42) when "0000000000000011",
			  inst_register(41) when "0000000000000100",
			  inst_register(40) when "0000000000000101",
			  inst_register(39) when "0000000000000110",
			  inst_register(38) when "0000000000000111",
			  inst_register(37) when "0000000000001000",
			  inst_register(36) when "0000000000001001",
			  inst_register(35) when "0000000000001010",
			  inst_register(34) when "0000000000001011",
			  inst_register(33) when "0000000000001100",
			  inst_register(32) when "0000000000001101",
			  inst_register(31) when "0000000000001110",
			  inst_register(30) when "0000000000001111",
			  inst_register(29) when "0000000000010000",
			  inst_register(28) when "0000000000010001",
			  inst_register(27) when "0000000000010010",
			  inst_register(26) when "0000000000010011",
			  inst_register(25) when "0000000000010100",
			  inst_register(24) when "0000000000010101",
			  inst_register(23) when "0000000000010110",
			  inst_register(22) when "0000000000010111",
			  inst_register(21) when "0000000000011000",
			  inst_register(20) when "0000000000011001",
			  inst_register(19) when "0000000000011010",
			  inst_register(18) when "0000000000011011",
			  inst_register(17) when "0000000000011100",
			  inst_register(16) when "0000000000011101",
			  inst_register(15) when "0000000000011110",
			  inst_register(14) when "0000000000011111",
			  inst_register(13) when "0000000000100000",
			  inst_register(12) when "0000000000100001",
			  inst_register(11) when "0000000000100010",
			  inst_register(10) when "0000000000100011",
			  inst_register(9) when "0000000000100100",
			  inst_register(8) when "0000000000100101",
			  inst_register(7) when "0000000000100110",
			  inst_register(6) when "0000000000100111",
			  inst_register(5) when "0000000000101000",
			  inst_register(4) when "0000000000101001",
			  inst_register(3) when "0000000000101010",
			  inst_register(2) when "0000000000101011",
			  inst_register(1) when "0000000000101100",
			  inst_register(0) when "0000000000101101",
			  inst_register(46) when others;

end Behavioral;

