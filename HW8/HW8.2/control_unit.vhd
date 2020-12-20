----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:14:47 08/28/2020 
-- Design Name: 
-- Module Name:    control_unit - Behavioral 
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

entity control_unit is
    Port ( op : in  STD_LOGIC_VECTOR (3 downto 0);
	        funct : in STD_LOGIC_VECTOR (3 downto 0);
           rf_en : out  STD_LOGIC;
           mux_en : out  STD_LOGIC;
			  memWrite : out STD_LOGIC;
			  memtoReg : out STD_LOGIC;
			  branch : out STD_LOGIC;
			  jmp : out STD_LOGIC;
           alu_sel : out  STD_LOGIC_VECTOR (3 downto 0));
end control_unit;

architecture Behavioral of control_unit is

begin
     process(op,funct)
	  begin
	       if (op = "0000") then
			     mux_en <= '0';
				  rf_en <= '1';
				  memWrite <= '0';
				  memtoReg <= '0';
				  if (funct = "1101") then --mov
				      alu_sel <= funct;		      
				  elsif (funct = "0010") then --or
                  alu_sel <= "1010";
				  elsif (funct = "0011") then --xor
                  alu_sel <= "0000";
              elsif (funct = "0001") then --and
                  alu_sel <= "1000";
              elsif (funct = "1001") then -- sub
                  alu_sel <= "0101";
				  elsif (funct = "1011") then -- cmp
                  alu_sel <= "0101";
						rf_en <= '0';
                  memWrite <= '0';	
              end if;							
			 else
              mux_en <= '1';
				  rf_en <= '1';
				  memWrite <= '0';
				  memtoReg <= '0';
				  branch <= '0';
				  jmp <= '0';
              if (op = "1101") then --mov
				      alu_sel <= op;		      
				  elsif (op = "0010") then --or
                  alu_sel <= "1010";
				  elsif (op = "0101") then --add
                  alu_sel <= "0100";						
				  elsif (op = "0011") then --xor
                  alu_sel <= "0000";
              elsif (op = "0001") then --and
                  alu_sel <= "1000";
              elsif (op = "1001") then -- sub
                  alu_sel <= "0101";
				  elsif (op = "1000") and (funct /= "0100")then -- lshi
                  alu_sel <= "1111";
				  elsif (op = "1000") and (funct = "0100") then -- lsh
				      mux_en <= '0';
                  alu_sel <= "1110";						
				  elsif (op = "0100") and (funct = "0100") then -- stor
                  alu_sel <= "1100";
						memWrite <= '1';
				  elsif (op = "0100") and (funct = "0000") then -- load
                  alu_sel <= "1100";
						memWrite <= '0';	
						memtoReg <= '1';
				  elsif (op = "1011") then -- cmpi
                  alu_sel <= "0101";
                  rf_en <= '0';
                  memWrite <= '0';
				  elsif (op = "1100") then -- beq
                  alu_sel <= "0101";
                  rf_en <= '0';
                  memWrite <= '0';
                  branch <= '1';
				 elsif (op = "1111") then -- jmp
                  alu_sel <= "0001";
                  rf_en <= '0';
                  memWrite <= '0';
                  branch <= '0';
   					jmp <= '1';
              end if;			  
          end if;
		end process;	 

end Behavioral;

