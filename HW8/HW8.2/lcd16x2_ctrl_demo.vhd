-------------------------------------------------------------------------------
-- Title      : Synthesizable demo for design "lcd16x2_ctrl"
-- Project    : 
-------------------------------------------------------------------------------
-- File       : lcd16x2_ctrl_tb.vhd
-- Author     :   <stachelsau@T420>
-- Company    : 
-- Created    : 2012-07-28
-- Last update: 2012-07-29
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: This demo writes writes a "hello world" to the display and
-- interchanges both lines periodically.
-------------------------------------------------------------------------------
-- Copyright (c) 2012 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2012-07-28  1.0      stachelsau      Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

-------------------------------------------------------------------------------

entity lcd16x2_ctrl_demo is
  port (
    clk    : in  std_logic;
    lcd_e  : out std_logic;
    lcd_rs : out std_logic;
    lcd_rw : out std_logic;
    lcd_db : out std_logic_vector(7 downto 4);
	KAT1 : IN    std_logic_vector(127 downto 0);
    KAT2 : IN    std_logic_vector(127 downto 0));
 
end entity lcd16x2_ctrl_demo;

-------------------------------------------------------------------------------

architecture behavior of lcd16x2_ctrl_demo is

  -- component generics
  constant CLK_PERIOD_NS : positive := 10;  -- 100 Mhz
  SIGNAL	LINE1 : std_logic_vector(127 downto 0);
  SIGNAL LINE2 : std_logic_vector(127 downto 0);
  -- component ports
  signal rst          : std_logic;
  
begin  -- architecture behavior

  -- component instantiation
  DUT : entity work.lcd16x2_ctrl
    generic map (
      CLK_PERIOD_NS => CLK_PERIOD_NS)
    port map (
      clk          => clk,
      rst          => rst,
      lcd_e        => lcd_e,
      lcd_rs       => lcd_rs,
      lcd_rw       => lcd_rw,
      lcd_db       => lcd_db,
      line1_buffer => line1,
      line2_buffer => line2);

  rst <= '0';

  -- see the display's datasheet for the character map
  line1(127 downto 120) <= KAT1(127 downto 120);  
  line1(119 downto 112) <= KAT1(119 downto 112); 
  line1(111 downto 104) <= KAT1(111 downto 104);   
  line1(103 downto 96)  <= KAT1(103 downto 96) ;  
  line1(95 downto 88)   <= KAT1(95 downto 88)  ;  
  line1(87 downto 80)   <= KAT1(87 downto 80)  ;  
  line1(79 downto 72)   <= KAT1(79 downto 72)  ;   
  line1(71 downto 64)   <= KAT1(71 downto 64)  ; 
  line1(63 downto 56)   <= KAT1(63 downto 56)  ;   
  line1(55 downto 48)   <= KAT1(55 downto 48)  ;   
  line1(47 downto 40)   <= KAT1(47 downto 40)  ;   
  line1(39 downto 32)   <= KAT1(39 downto 32)  ;   
  line1(31 downto 24)   <= KAT1(31 downto 24)  ;  
  line1(23 downto 16)   <= KAT1(23 downto 16)  ;   
  line1(15 downto 8)    <= KAT1(15 downto 8)   ; 
  line1(7 downto 0)     <= KAT1(7 downto 0)    ; 
                          
  line2(127 downto 120) <= KAT2(127 downto 120) ;
  line2(119 downto 112) <= KAT2(119 downto 112) ;
  line2(111 downto 104) <= KAT2(111 downto 104) ;
  line2(103 downto 96)  <= KAT2(103 downto 96)  ;
  line2(95 downto 88)   <= KAT2(95 downto 88)   ;
  line2(87 downto 80)   <= KAT2(87 downto 80)   ;
  line2(79 downto 72)   <= KAT2(79 downto 72)   ;
  line2(71 downto 64)   <= KAT2(71 downto 64)   ;
  line2(63 downto 56)   <= KAT2(63 downto 56)   ;
  line2(55 downto 48)   <= KAT2(55 downto 48)   ;
  line2(47 downto 40)   <= KAT2(47 downto 40)   ;
  line2(39 downto 32)   <= KAT2(39 downto 32)   ;
  line2(31 downto 24)   <= KAT2(31 downto 24)   ;
  line2(23 downto 16)   <= KAT2(23 downto 16)   ;
  line2(15 downto 8)    <= KAT2(15 downto 8)    ;
  line2(7 downto 0)     <= KAT2(7 downto 0)     ;
  
end architecture behavior;  

