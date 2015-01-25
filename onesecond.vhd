----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:18:50 12/26/2014 
-- Design Name: 
-- Module Name:    onesecond - Behavioral 
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

entity onesecond is
    Port ( CLK : in  STD_LOGIC;
           onesecond : out  STD_LOGIC);
end onesecond;

architecture Behavioral of onesecond is
signal 	temperal : STD_LOGIC;
signal count : unsigned (22 downto 0);
signal count_next  : unsigned (22 downto 0);
begin
	process (CLK)

	begin
		if(CLK'event and CLK='1') then
			-- Count the clock pulses
			count <= count_next;
		end if;
	end process;
	
	-- Wrap around at 6000000 / every half a second 
	count_next <=
		(others=>'0') when count=6000000 else
		count + 1;
	-- Invert signal at the same time
	temperal <=
		NOT (temperal) when count=0;
	
	onesecond <= temperal;
end Behavioral;

