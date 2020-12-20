----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:47:41 08/14/2020 
-- Design Name: 
-- Module Name:    register_file - Behavioral 
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

entity register_file is
    Port ( clk : in STD_LOGIC;
	        r_Ra : in  STD_LOGIC_VECTOR (3 downto 0);
           r_Rb : in  STD_LOGIC_VECTOR (3 downto 0);
           r_Rw : in  STD_LOGIC_VECTOR (3 downto 0);
           r_WrEn : in  STD_LOGIC;
           r_Wdat : in  STD_LOGIC_VECTOR (15 downto 0);
           r_Adat : out  STD_LOGIC_VECTOR (15 downto 0);
           r_Bdat : out  STD_LOGIC_VECTOR (15 downto 0);
			  register_out : out STD_LOGIC_VECTOR (15 downto 0));
end register_file;

architecture Behavioral of register_file is

component demux
    Port ( WrEn_demux : in  STD_LOGIC;
           Rw_demux : in  STD_LOGIC_VECTOR (3 downto 0);
           output : out  STD_LOGIC_VECTOR (15 downto 0));
end component;

component mux
    Port ( register_mux0,register_mux1,register_mux2,
           register_mux3,register_mux4,register_mux5,register_mux6,register_mux7,register_mux8,
           register_mux9,register_mux10,register_mux11,register_mux12,register_mux13,register_mux14,
           register_mux15: in STD_LOGIC_VECTOR (15 downto 0);
           Rab_mux : in  STD_LOGIC_VECTOR (3 downto 0);
           output : out  STD_LOGIC_VECTOR (15 downto 0));
end component;

signal out_demux : STD_LOGIC_VECTOR (15 downto 0):="0000000000000000";
signal out_Adat : STD_LOGIC_VECTOR (15 downto 0);
signal out_Bdat : STD_LOGIC_VECTOR (15 downto 0);
type array_type is array (integer range <>) of STD_LOGIC_VECTOR (15 downto 0);
signal registerfile : array_type (15 downto 0);

begin

DM : demux port map (WrEn_demux => r_WrEn, Rw_demux => r_Rw, output => out_demux);

MA : mux port map (register_mux0 => registerfile(0),register_mux1 => registerfile(1),register_mux2 => registerfile(2),
register_mux3 => registerfile(3),register_mux4 => registerfile(4),register_mux5 => registerfile(5),register_mux6 => registerfile(6),
register_mux7 => registerfile(7),register_mux8 => registerfile(8),register_mux9 => registerfile(9),register_mux10 => registerfile(10),
register_mux11 => registerfile(11),register_mux12 => registerfile(12),register_mux13 => registerfile(13),register_mux14 => registerfile(14),
register_mux15 => registerfile(15), Rab_mux => r_Ra, output => out_Adat);

MB : mux port map (register_mux0 => registerfile(0),register_mux1 => registerfile(1),register_mux2 => registerfile(2),
register_mux3 => registerfile(3),register_mux4 => registerfile(4),register_mux5 => registerfile(5),register_mux6 => registerfile(6),
register_mux7 => registerfile(7),register_mux8 => registerfile(8),register_mux9 => registerfile(9),register_mux10 => registerfile(10),
register_mux11 => registerfile(11),register_mux12 => registerfile(12),register_mux13 => registerfile(13),register_mux14 => registerfile(14),
register_mux15 => registerfile(15), Rab_mux => r_Rb, output => out_Bdat);


    process(clk,r_Ra,r_Rb,r_Rw,r_WrEn,r_Wdat)
	 begin
	      if rising_edge(clk) then
            loop1: for i in 0 to 15 loop
				          if(out_demux(i)='1') then
							    registerfile(i)<= r_Wdat;
							 end if;	 
	               end loop loop1;
			end if;

    end process;

    process(registerfile(0),registerfile(1),registerfile(2))	
    begin
         if	(r_RW = "0000") then
			    register_out <= registerfile(0);
			elsif (r_RW = "0001") then
			    register_out <= registerfile(1);
			elsif (r_RW = "0010") then
			    register_out <= registerfile(2);
         end if;				 
     end process;
			r_Adat<= out_Adat;
			r_Bdat<= out_Bdat;		

end Behavioral;

