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
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;
            
-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top_test_sharp_screen is
    Port ( clk : in  STD_LOGIC;
           W1A : inout  STD_LOGIC_VECTOR (15 downto 0);
           W1B : inout  STD_LOGIC_VECTOR (15 downto 0) ;
           W2C : inout  STD_LOGIC_VECTOR (15 downto 0);
           rx : in  STD_LOGIC;
           tx : inout  STD_LOGIC
			);
end top_test_sharp_screen;

architecture Behavioral of top_test_sharp_screen is
	COMPONENT clock_25mhz
	PORT(
		CLKIN_IN : IN std_logic;          
		CLKFX_OUT : OUT std_logic;
		CLKIN_IBUFG_OUT : OUT std_logic;
		CLK0_OUT : OUT std_logic
		);
	END COMPONENT;
	signal clk_screen_driver : std_logic;
	signal clk_screen : std_logic;
	signal reset : std_logic;
   signal vsync : std_logic;
   signal hsync : std_logic;
   signal enable : std_logic;
   signal screen_right_left : std_logic;
   signal screen_up_down : std_logic;
   signal r : std_logic_vector ( 5 downto 0);
   signal g : std_logic_vector ( 5 downto 0);
   signal b : std_logic_vector ( 5 downto 0);
   signal audio_right : std_logic;
   signal audio_left : std_logic;
begin

	Inst_clock_screen: clock_25mhz PORT MAP(
		CLKIN_IN => clk,
		CLKFX_OUT => clk_screen_driver,
		CLKIN_IBUFG_OUT => open,
		CLK0_OUT => open
	);

	Inst_mire_screen : entity work.mire_screen PORT MAP(
	   clk => clk_screen_driver,
		rst => reset,
		clk_out => clk_screen,
      vsync => vsync,
      hsync => hsync,
      enable => enable,
      r => r,
      g => g,
      b => b
	);

	Inst_giovanni_card : entity work.giovanni_card PORT MAP(
		w1a => W1A,
      w1b => W1B,
      scr_red => r,
      scr_green => g,
      scr_blue => b,
      scr_clk => clk_screen,
      scr_hsync => hsync,
      scr_vsync => vsync,
      scr_enable => enable,
      scr_right_left => screen_right_left,
      scr_up_down => screen_up_down,
      audio_right => audio_right,
      audio_left => audio_left,
      audio_stereo_ok => open,
      audio_plugged => open,
      io => open
	);
	
	reset <= '0';
	screen_right_left <= '1';
	screen_up_down <= '1';
	audio_right <= '0';
	audio_left <= '0';
	
	
end Behavioral;

