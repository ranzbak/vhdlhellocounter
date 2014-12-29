----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:24:55 12/14/2014 
-- Design Name: 
-- Module Name:    allonoff - Behavioral 
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

entity decode4bit is
    Port ( dip 		: in  STD_LOGIC_VECTOR (3 downto 0);
           display 	: out  STD_LOGIC_VECTOR (7 downto 0));
end decode4bit;

architecture Behavioral of decode4bit is

begin

	process (dip)
	begin 
		case dip is
			when "0000"		=> display <= "10100000";
			when "0001"		=>	display <= "10101111";
			when "0010"    => display <= "10010010";
			when "0011"		=> display <= "10000110";
			when "0100"		=> display <= "10001101";
			when "0101"		=> display <= "11000100";
			when "0110"		=> display <= "11000000";
			when "0111"		=> display <= "10101110";
			when "1000"		=> display <= "10000000";
			when "1001"		=> display <= "10000100";
			when "1010"		=> display <= "10000010";
			when "1011"		=> display <= "11000001";
			when "1100" 	=> display <= "11110000";
			when "1101"		=> display <= "10000011";
			when "1110"		=> display <= "11010000";
			when "1111"		=> display <= "11011000";
			when others		=> display <= "00000000";
		end case;
	end process;

end Behavioral;

