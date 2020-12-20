--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:37:37 08/28/2020
-- Design Name:   
-- Module Name:   C:/Users/TUTEL-50/Desktop/Homework8/HW8/aaaa.vhd
-- Project Name:  HW8
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: hw8
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY aaaa IS
END aaaa;
 
ARCHITECTURE behavior OF aaaa IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT hw8
    PORT(
         clock : IN  std_logic;
         reset : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clock : std_logic := '0';
   signal reset : std_logic := '0';

   -- Clock period definitions
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: hw8 PORT MAP (
          clock => clock,
          reset => reset
        );

   -- Clock process definitions
   clock_process :process
   begin
		clock <= '0';
		wait for clock_period/2;
		clock <= '1';
		wait for clock_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		reset<='1';
      wait for 50 ns;	
      reset<='0';
      wait for clock_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
