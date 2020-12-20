----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:54:32 08/14/2020 
-- Design Name: 
-- Module Name:    demux - Behavioral 
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

entity demux is
    Port ( WrEn_demux : in  STD_LOGIC;
           Rw_demux : in  STD_LOGIC_VECTOR (3 downto 0);
           output : out  STD_LOGIC_VECTOR (15 downto 0));
end demux;

architecture Behavioral of demux is
signal outdemux : STD_LOGIC_VECTOR (15 downto 0);
begin
     process(WrEn_demux,Rw_demux)
	  begin
	       if (RW_demux = "0000") then
			     output(0) <= WrEn_demux;
				  output(15 downto 1) <= "000000000000000";
			 elsif (RW_demux = "0001") then
              output(1) <= WrEn_demux;
              output(0) <= '0';
              output(15 downto 2) <= "00000000000000";				  
          elsif (RW_demux = "0010") then
              output(2) <= WrEn_demux;
				  output(1 downto 0) <= "00";
				  output(15 downto 3) <= "0000000000000";
			 elsif (RW_demux = "0011") then
              output(3) <= WrEn_demux;
              output(2 downto 0) <= "000";
              output(15 downto 4) <= "000000000000";				  
          elsif (RW_demux = "0100") then
              output(4) <= WrEn_demux;
              output(3 downto 0) <= "0000";
              output(15 downto 5) <= "00000000000";				  
			 elsif (RW_demux = "0101") then
              output(5) <= WrEn_demux;
              output(4 downto 0) <= "00000";
              output(15 downto 6) <= "0000000000";				  
          elsif (RW_demux = "0110") then
              output(6) <= WrEn_demux;
              output(5 downto 0) <= "000000";
              output(15 downto 7) <= "000000000";					  
			 elsif (RW_demux = "0111") then
              output(7) <= WrEn_demux;
              output(6 downto 0) <= "0000000";
              output(15 downto 8) <= "00000000";				  
          elsif (RW_demux = "1000") then
              output(8) <= WrEn_demux;
              output(7 downto 0) <= "00000000";
              output(15 downto 9) <= "0000000";				  
			 elsif (RW_demux = "1001") then
              output(9) <= WrEn_demux;
              output(8 downto 0) <= "000000000";
              output(15 downto 10) <= "000000";				  
          elsif (RW_demux = "1010") then
              output(10) <= WrEn_demux;
              output(9 downto 0) <= "0000000000";
              output(15 downto 11) <= "00000";					  
			 elsif (RW_demux = "1011") then
              output(11) <= WrEn_demux;
              output(10 downto 0) <= "00000000000";
              output(15 downto 12) <= "0000";				  
          elsif (RW_demux = "1100") then
              output(12) <= WrEn_demux;
              output(11 downto 0) <= "000000000000";
              output(15 downto 13) <= "000";				  
			 elsif (RW_demux = "1101") then
              output(13) <= WrEn_demux;
              output(12 downto 0) <= "0000000000000";
              output(15 downto 14) <= "00";				  
          elsif (RW_demux = "1110") then
              output(14) <= WrEn_demux;
              output(13 downto 0) <= "00000000000000";
              output(15) <= '0';				  
			 elsif (RW_demux = "1111") then
              output(15) <= WrEn_demux;
				  output(14 downto 0) <= "000000000000000";
			 end if;
			 
      end process;			     
end Behavioral;

