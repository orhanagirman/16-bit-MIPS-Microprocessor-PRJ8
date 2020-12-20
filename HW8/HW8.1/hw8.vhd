----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:37:04 08/28/2020 
-- Design Name: 
-- Module Name:    hw8 - Behavioral 
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

entity hw8 is
    Port ( clock : in  STD_LOGIC;
	        reset : in  STD_LOGIC;
			  lcd_e  : out std_logic;
		     lcd_rs : out std_logic;
		     lcd_rw : out std_logic;
		     lcd_db : out std_logic_vector(7 downto 4));
end hw8;

architecture Behavioral of hw8 is

component clock_divider
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
			  value: in integer;
           output : out  STD_LOGIC);
end component;

component instruction_memory
    Port ( inst_A : in  STD_LOGIC_VECTOR (15 downto 0);
           RD : out  STD_LOGIC_VECTOR (15 downto 0));	
end component;

component pc
    Port ( clk : in  STD_LOGIC;
	        rst : in  STD_LOGIC;
			  jmp_in : in STD_LOGIC;
			  d : in  STD_LOGIC_VECTOR (15 downto 0);
           q : out  STD_LOGIC_VECTOR (15 downto 0));
end component;

component alu
    Port ( A : in  STD_LOGIC_VECTOR (15 downto 0);
           B : in  STD_LOGIC_VECTOR (15 downto 0);
           S : out  STD_LOGIC_VECTOR (15 downto 0);
           a_sel : in  STD_LOGIC_VECTOR (3 downto 0);
			  zero : out  STD_LOGIC);
end component;

component register_file
    Port ( clk : in STD_LOGIC;
	        r_Ra : in  STD_LOGIC_VECTOR (3 downto 0);
           r_Rb : in  STD_LOGIC_VECTOR (3 downto 0);
           r_Rw : in  STD_LOGIC_VECTOR (3 downto 0);
           r_WrEn : in  STD_LOGIC;
           r_Wdat : in  STD_LOGIC_VECTOR (15 downto 0);
           r_Adat : out  STD_LOGIC_VECTOR (15 downto 0);
           r_Bdat : out  STD_LOGIC_VECTOR (15 downto 0);
			  register_out : out STD_LOGIC_VECTOR (15 downto 0));
end component;

component sign_extend
    Port ( sign_out : out  STD_LOGIC_VECTOR (15 downto 0);
           sign_in : in  STD_LOGIC_VECTOR (7 downto 0));	 
end component;			  

component mux_mp
    Port ( mux_ina : in  STD_LOGIC_VECTOR (15 downto 0);
           mux_inb : in  STD_LOGIC_VECTOR (15 downto 0);
           mux_sel : in  STD_LOGIC;
           mux_out : out  STD_LOGIC_VECTOR (15 downto 0));
end component;

component control_unit
    Port ( op : in  STD_LOGIC_VECTOR (3 downto 0);
	        funct : in STD_LOGIC_VECTOR (3 downto 0);
           rf_en : out  STD_LOGIC;
           mux_en : out  STD_LOGIC;
			  memWrite : out STD_LOGIC;
			  memtoReg : out STD_LOGIC;
			  branch : out STD_LOGIC;
			  jmp : out STD_LOGIC;
           alu_sel : out  STD_LOGIC_VECTOR (3 downto 0));
end component;

component data_memory
    Port ( clk : in  STD_LOGIC;
	        rst : in  STD_LOGIC;
			  dd : in  STD_LOGIC_VECTOR (15 downto 0);
			  mWrite : in STD_LOGIC;
           read_data : out  STD_LOGIC_VECTOR (15 downto 0));
end component;

component lcd16x2_ctrl_demo
	  port (
		 clk    : in  std_logic;
		 lcd_e  : out std_logic;
		 lcd_rs : out std_logic;
		 lcd_rw : out std_logic;
		 lcd_db : out std_logic_vector(7 downto 4);
		 KAT1 : IN    std_logic_vector(127 downto 0);
		 KAT2 : IN    std_logic_vector(127 downto 0));
end component;

component dectolcd
	  port ( lcd_in : in STD_LOGIC_VECTOR (3 downto 0);
	         lcd_out : out STD_LOGIC_VECTOR (7 downto 0));
end component;

signal araport1 : STD_LOGIC;
signal pc_in : STD_LOGIC_VECTOR (15 downto 0);
signal pc_out : STD_LOGIC_VECTOR (15 downto 0);


signal zero_port : STD_LOGIC;
signal RD_port : STD_LOGIC_VECTOR (15 downto 0);

signal Adat_port : STD_LOGIC_VECTOR (15 downto 0);
signal Bdat_port : STD_LOGIC_VECTOR (15 downto 0);
signal WrEn : STD_LOGIC;
signal register_port : STD_LOGIC_VECTOR (15 downto 0);



signal sign_port : STD_LOGIC_VECTOR (15 downto 0);

signal mux_sel_port : STD_LOGIC;
signal mux_port : STD_LOGIC_VECTOR (15 downto 0);

signal Alu_result : STD_LOGIC_VECTOR (15 downto 0);
signal zerof_port : STD_LOGIC;
signal zero_flag : STD_LOGIC;
signal sel_port : STD_LOGIC_VECTOR (3 downto 0);

signal read_data_port : STD_LOGIC_VECTOR (15 downto 0);
signal mWrite_port : STD_LOGIC;
signal memtoReg_port : STD_LOGIC;
signal result : STD_LOGIC_VECTOR (15 downto 0);

signal pcsrc : STD_LOGIC;
signal branch_port : STD_LOGIC;
signal zero_port1 : STD_LOGIC;
signal pc_branch : STD_LOGIC_VECTOR (15 downto 0);
signal pc_port : STD_LOGIC_VECTOR (15 downto 0);
signal jmp_port : STD_LOGIC;


attribute LOC : string;
attribute LOC of CLOCK: signal is "AH15";
attribute LOC of LCD_DB: signal is "T11 G6 G7 T9";
attribute LOC of LCD_E: signal is "AC9";
attribute LOC of LCD_RS: signal is "J17";
attribute LOC of LCD_RW: signal is "AC10";

signal kat1 : STD_LOGIC_VECTOR (127 downto 0);
signal kat2 : STD_LOGIC_VECTOR (127 downto 0);

signal pc_lcd0 : STD_LOGIC_VECTOR (7 downto 0);
signal pc_lcd1 : STD_LOGIC_VECTOR (7 downto 0);

signal rw_lcd0 : STD_LOGIC_VECTOR (7 downto 0);
signal rf_lcd0 : STD_LOGIC_VECTOR (7 downto 0);
 
begin

CLK1 : clock_divider port map (clk => clock, rst => reset, value => 49999999, output => araport1);
PC1 : pc port map (clk => araport1, rst => reset, jmp_in => jmp_port, d => pc_port, q => pc_out);
IM : instruction_memory port map (inst_A => pc_out, RD => RD_port);
alu_PC : alu port map (A => pc_out, B => "0000000000000001", a_sel => "0100", S => pc_in, zero => zero_port);
rf : register_file port map (clk => araport1, r_Ra => RD_port(11 downto 8), r_Rb => RD_port(3 downto 0) , r_Rw => RD_port(11 downto 8), r_WrEn => WrEn, r_Wdat => Result, r_Adat => Adat_port, r_Bdat => Bdat_port, 
register_out => register_port);
se : sign_extend port map (sign_in => RD_port(7 downto 0), sign_out => sign_port);
mp : mux_mp port map (mux_ina => Bdat_port, mux_inb => sign_port, mux_sel => mux_sel_port, mux_out => mux_port);
alu_RF : alu port map (A => Adat_port, B => mux_port, a_sel => sel_port, S => Alu_result, zero => zerof_port);
cu : control_unit port map (op => RD_port(15 downto 12), funct => RD_port(7 downto 4), rf_en => WrEn, mux_en => mux_sel_port, memWrite => mWrite_port, memtoReg => memtoReg_port, branch => branch_port, jmp => jmp_port, alu_sel => sel_port);
dm : data_memory port map (clk => araport1, rst => reset, dd => Alu_result, mWrite => mWrite_port, read_data => read_data_port);
mdm : mux_mp port map (mux_ina => Alu_result, mux_inb => read_data_port, mux_sel => memtoReg_port, mux_out => result);
alu_PC2 : alu port map (A => sign_port, B => pc_in, a_sel => "0100", S => pc_branch, zero => zero_port1);
mpc : mux_mp port map (mux_ina => pc_in, mux_inb => pc_branch, mux_sel => pcsrc, mux_out => pc_port);

dtl1 : dectolcd port map (lcd_in => pc_out(3 downto 0), lcd_out => pc_lcd0);
dtl2 : dectolcd port map (lcd_in => pc_out(7 downto 4), lcd_out => pc_lcd1);

dtl3 : dectolcd port map (lcd_in => RD_port(11 downto 8), lcd_out => rw_lcd0);

dtl4 : dectolcd port map (lcd_in => Result(3 downto 0), lcd_out => rf_lcd0);

process(araport1)
begin
	  if rising_edge(araport1) then
		  zero_flag <= zerof_port;
	  end if;        
end process;

pcsrc <= zero_flag and branch_port;

kat1 <= "01010000" & "01000011" & "00111010" & pc_lcd1 & pc_lcd0 & "00100000" & "00100000" & "01010010" & "00111010" & rw_lcd0 & "00100000" & "00100000" & "01010010" & "01000111" & "00111010" & rf_lcd0;
kat2 <= X"20202020202020202020202020202020";

lcd : lcd16x2_ctrl_demo port map (clk => clock, lcd_e => LCD_E, lcd_rs => LCD_RS, lcd_rw => LCD_RW, lcd_db => LCD_DB, KAT2 => kat2, KAT1 => kat1);
end Behavioral;


