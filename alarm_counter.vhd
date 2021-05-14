----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:42:04 05/14/2021 
-- Design Name: 
-- Module Name:    alarm_counter - Behavioral 
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

entity alarm_counter is
    Port ( inc_sec : in  STD_LOGIC;
			  inc_min : in STD_LOGIC;
			  inc_hour : in STD_LOGIC;
			  clk_m : in STD_LOGIC;
			  x_out : out  STD_LOGIC_VECTOR (3 downto 0);
			  y_out : out  STD_LOGIC_VECTOR (3 downto 0);
           a_out : out  STD_LOGIC_VECTOR (3 downto 0);
           b_out : out  STD_LOGIC_VECTOR (3 downto 0);
           c_out : out  STD_LOGIC_VECTOR (3 downto 0);
           d_out : out  STD_LOGIC_VECTOR (3 downto 0));
end alarm_counter;

architecture Behavioral of alarm_counter is

signal count_h: integer:=0;
signal count_m: integer:=0;
signal count_s: integer:=0;


signal h_bcd: std_logic_vector (7 downto 0);
signal m_bcd: std_logic_vector (7 downto 0);
signal s_bcd: std_logic_vector (7 downto 0);

signal selected: integer := 0;

begin

process(inc_hour)
begin

	if(inc_hour'event and inc_hour='1') then
	
		count_h <= count_h + 1;
		if (count_h = 12) then
		count_h <= 0;
		end if;
		
	end if;
		
end process;

process(inc_min)
begin

	if(inc_min'event and inc_min='1') then
	
		count_m <= count_m + 1;
		if (count_m = 59) then
		count_m <= 0;
		end if;
		
	end if;
		
end process;

process(inc_sec)
begin

	if(inc_sec'event and inc_sec='1') then
	
		count_s <= count_s + 1;
		if (count_s = 59) then
		count_s <= 0;
		end if;
		
	end if;
		
end process;

process(clk_m)
begin
	
	case count_s is
			when 0 => s_bcd <= "00000000" ;
			when 1 => s_bcd <= "00000001" ;
			when 2 => s_bcd <= "00000010" ;
			when 3 => s_bcd <= "00000011" ;
			when 4 => s_bcd <= "00000100" ;
			when 5 => s_bcd <= "00000101" ;
			when 6 => s_bcd <= "00000110" ;
			when 7 => s_bcd <= "00000111" ;
			when 8 => s_bcd <= "00001000" ;
			when 9 => s_bcd <= "00001001" ;
			when 10 => s_bcd <= "00010000" ;
			when 11 => s_bcd <= "00010001" ;
			when 12 => s_bcd <= "00010010" ;
			when 13 => s_bcd <= "00010011" ;
			when 14 => s_bcd <= "00010100" ;
			when 15 => s_bcd <= "00010101" ;
			when 16 => s_bcd <= "00010110" ;
			when 17 => s_bcd <= "00010111" ;
			when 18 => s_bcd <= "00011000" ;
			when 19 => s_bcd <= "00011001" ;
			when 20 => s_bcd <= "00100000" ;
			when 21 => s_bcd <= "00100001" ;
			when 22 => s_bcd <= "00100010" ;
			when 23 => s_bcd <= "00100011" ;
			when 24 => s_bcd <= "00100100" ;
			when 25 => s_bcd <= "00100101" ;
			when 26 => s_bcd <= "00100110" ;
			when 27 => s_bcd <= "00100111" ;
			when 28 => s_bcd <= "00101000" ;
			when 29 => s_bcd <= "00101001" ;
			when 30 => s_bcd <= "00110000" ;
			when 31 => s_bcd <= "00110001" ;
			when 32 => s_bcd <= "00110010" ;
			when 33 => s_bcd <= "00110011" ;
			when 34 => s_bcd <= "00110100" ;
			when 35 => s_bcd <= "00110101" ;
			when 36 => s_bcd <= "00110110" ;
			when 37 => s_bcd <= "00110111" ;
			when 38 => s_bcd <= "00111000" ;
			when 39 => s_bcd <= "00111001" ;
			when 40 => s_bcd <= "01000000" ;
			when 41 => s_bcd <= "01000001" ;
			when 42 => s_bcd <= "01000010" ;
			when 43 => s_bcd <= "01000011" ;
			when 44 => s_bcd <= "01000100" ;
			when 45 => s_bcd <= "01000101" ;
			when 46 => s_bcd <= "01000110" ;
			when 47 => s_bcd <= "01000111" ;
			when 48 => s_bcd <= "01001000" ;
			when 49 => s_bcd <= "01001001" ;
			when 50 => s_bcd <= "01010000" ;
			when 51 => s_bcd <= "01010001" ;
			when 52 => s_bcd <= "01010010" ;
			when 53 => s_bcd <= "01010011" ;
			when 54 => s_bcd <= "01010100" ;
			when 55 => s_bcd <= "01010101" ;
			when 56 => s_bcd <= "01010110" ;
			when 57 => s_bcd <= "01010111" ;
			when 58 => s_bcd <= "01011000" ;
			when 59 => s_bcd <= "01011001" ;
			
			when others => s_bcd <= "00000000" ;
	end case;
	
	case count_m is
			when 0 => m_bcd <= "00000000" ;
			when 1 => m_bcd <= "00000001" ;
			when 2 => m_bcd <= "00000010" ;
			when 3 => m_bcd <= "00000011" ;
			when 4 => m_bcd <= "00000100" ;
			when 5 => m_bcd <= "00000101" ;
			when 6 => m_bcd <= "00000110" ;
			when 7 => m_bcd <= "00000111" ;
			when 8 => m_bcd <= "00001000" ;
			when 9 => m_bcd <= "00001001" ;
			when 10 => m_bcd <= "00010000" ;
			when 11 => m_bcd <= "00010001" ;
			when 12 => m_bcd <= "00010010" ;
			when 13 => m_bcd <= "00010011" ;
			when 14 => m_bcd <= "00010100" ;
			when 15 => m_bcd <= "00010101" ;
			when 16 => m_bcd <= "00010110" ;
			when 17 => m_bcd <= "00010111" ;
			when 18 => m_bcd <= "00011000" ;
			when 19 => m_bcd <= "00011001" ;
			when 20 => m_bcd <= "00100000" ;
			when 21 => m_bcd <= "00100001" ;
			when 22 => m_bcd <= "00100010" ;
			when 23 => m_bcd <= "00100011" ;
			when 24 => m_bcd <= "00100100" ;
			when 25 => m_bcd <= "00100101" ;
			when 26 => m_bcd <= "00100110" ;
			when 27 => m_bcd <= "00100111" ;
			when 28 => m_bcd <= "00101000" ;
			when 29 => m_bcd <= "00101001" ;
			when 30 => m_bcd <= "00110000" ;
			when 31 => m_bcd <= "00110001" ;
			when 32 => m_bcd <= "00110010" ;
			when 33 => m_bcd <= "00110011" ;
			when 34 => m_bcd <= "00110100" ;
			when 35 => m_bcd <= "00110101" ;
			when 36 => m_bcd <= "00110110" ;
			when 37 => m_bcd <= "00110111" ;
			when 38 => m_bcd <= "00111000" ;
			when 39 => m_bcd <= "00111001" ;
			when 40 => m_bcd <= "01000000" ;
			when 41 => m_bcd <= "01000001" ;
			when 42 => m_bcd <= "01000010" ;
			when 43 => m_bcd <= "01000011" ;
			when 44 => m_bcd <= "01000100" ;
			when 45 => m_bcd <= "01000101" ;
			when 46 => m_bcd <= "01000110" ;
			when 47 => m_bcd <= "01000111" ;
			when 48 => m_bcd <= "01001000" ;
			when 49 => m_bcd <= "01001001" ;
			when 50 => m_bcd <= "01010000" ;
			when 51 => m_bcd <= "01010001" ;
			when 52 => m_bcd <= "01010010" ;
			when 53 => m_bcd <= "01010011" ;
			when 54 => m_bcd <= "01010100" ;
			when 55 => m_bcd <= "01010101" ;
			when 56 => m_bcd <= "01010110" ;
			when 57 => m_bcd <= "01010111" ;
			when 58 => m_bcd <= "01011000" ;
			when 59 => m_bcd <= "01011001" ;
			
			when others => m_bcd <= "00000000" ;
	end case;
	
	case count_h is
			when 0 => h_bcd <= "00000000" ;
			when 1 => h_bcd <= "00000001" ;
			when 2 => h_bcd <= "00000010" ;
			when 3 => h_bcd <= "00000011" ;
			when 4 => h_bcd <= "00000100" ;
			when 5 => h_bcd <= "00000101" ;
			when 6 => h_bcd <= "00000110" ;
			when 7 => h_bcd <= "00000111" ;
			when 8 => h_bcd <= "00001000" ;
			when 9 => h_bcd <= "00001001" ;
			when 10 => h_bcd <= "00010000" ;
			when 11 => h_bcd <= "00010001" ;
			when 12 => h_bcd <= "00010010" ;
			when others => h_bcd <= "00000000" ;
	end case;
	
end process;

x_out <= h_bcd(7 downto 4);
y_out <= h_bcd(3 downto 0);

a_out <= m_bcd(7 downto 4);
b_out <= m_bcd(3 downto 0);
c_out <= s_bcd(7 downto 4);
d_out <= s_bcd(3 downto 0);

end Behavioral;


