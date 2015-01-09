--
--    This file is part of top_test_sharp_screen
--    Copyright (C) 2011  Julien Thevenon ( julien_thevenon at yahoo.fr )
--
--    This program is free software: you can redistribute it and/or modify
--    it under the terms of the GNU General Public License as published by
--    the Free Software Foundation, either version 3 of the License, or
--    (at your option) any later version.
--
--    This program is distributed in the hope that it will be useful,
--    but WITHOUT ANY WARRANTY; without even the implied warranty of
--    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--    GNU General Public License for more details.
--
--    You should have received a copy of the GNU General Public License
--    along with this program.  If not, see <http://www.gnu.org/licenses/>
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
 
ENTITY driver_testbench IS
END driver_testbench;
 
ARCHITECTURE behavior OF driver_testbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 

    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';

   --outputs
   signal clk_out : std_logic;
   signal hsync : std_logic;
   signal vsync : std_logic;
   signal enable : std_logic;
   signal r : std_logic_vector(5 downto 0);
   signal g : std_logic_vector(5 downto 0);
   signal b : std_logic_vector(5 downto 0);

   -- Clock period definitions
   constant clk_period : time := 39.71 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: entity work.mire_screen PORT MAP (
          clk => clk,
          rst => rst,
          clk_out => clk_out,
          vsync => vsync,
          hsync => hsync,
          enable => enable,
          r => r,
          g => g,
          b => b
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for clk_period;	
      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
