----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:06:38 12/26/2014 
-- Design Name: 
-- Module Name:    topmodule - Behavioral 
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
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity topmodule is
    Port ( CLK : in  STD_LOGIC;
			  blink : out STD_LOGIC;
			  invert : out STD_LOGIC;
           display : out  STD_LOGIC_VECTOR (7 downto 0));
end topmodule;

architecture Behavioral of topmodule is
	signal sigsecond: 	std_logic;
	signal count: 			unsigned (3 downto 0);
	signal count_next:	unsigned (3 downto 0);
begin
	-- Instantiate the one second pulse generator
	onesecond_0: entity work.onesecond
		port map(CLK=>CLK, onesecond=>sigsecond);
	
	-- Instantiate the binary decoder
	display_0: entity work.decode4bit
		port map(dip=>std_logic_vector(count), display=>display);
	
	-- On clock rising edge, go to next state
	process (sigsecond)
	begin
		-- every beginning of the 1 second cycle..
		if(sigsecond'event and sigsecond='1') then
			-- Increase the counter
			count<=count_next;
		end if;
	end process;
	
	-- To next state
	count_next <= count + 1;
	
	-- Blink some pretty lights
	blink <= sigsecond;
	invert <= NOT (sigsecond);

end Behavioral;

