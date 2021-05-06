----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:15:01 05/05/2021 
-- Design Name: 
-- Module Name:    number_to_sevseg - Behavioral 
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

entity number_to_sevseg is
    Port ( input : in  STD_LOGIC_VECTOR (3 downto 0);
           sevseg : out  STD_LOGIC_VECTOR (6 downto 0)
				);
end number_to_sevseg;

architecture Behavioral of number_to_sevseg is

begin

process(input)
	begin
		case input is
			when "0000" => SevSeg <= "1111110" ;
			when "0001" => SevSeg <= "0110000" ;
			when "0010" => SevSeg <= "1101101" ;
			when "0011" => SevSeg <= "1111001" ;
			when "0100" => SevSeg <= "0110011" ;
			when "0101" => SevSeg <= "1011011" ;
			when "0110" => SevSeg <= "1011111" ;
			when "0111" => SevSeg <= "1110000" ;
			when "1000" => SevSeg <= "1111111" ;
			when "1001" => SevSeg <= "1111011" ;
			when others => SevSeg <= "0000000" ;
		end case;
	end process;

end Behavioral;

