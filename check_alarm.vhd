----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:43:22 05/15/2021 
-- Design Name: 
-- Module Name:    check_alarm - Behavioral 
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

entity check_alarm is
    Port ( stop_alarm : in  STD_LOGIC;
           hour_t : in  STD_LOGIC_VECTOR (7 downto 0);
           min_t : in  STD_LOGIC_VECTOR (7 downto 0);
           sec_t : in  STD_LOGIC_VECTOR (7 downto 0);
           hour_a : in  STD_LOGIC_VECTOR (7 downto 0);
           min_a : in  STD_LOGIC_VECTOR (7 downto 0);
           sec_a : in  STD_LOGIC_VECTOR (7 downto 0);
           snooze : in  STD_LOGIC;
			  clk_activate : in STD_LOGIC;
           buzzer : out  STD_LOGIC );
end check_alarm;

architecture Behavioral of check_alarm is

signal is_alarm : std_logic;

begin

process (clk_activate)
begin
	if (hour_t=hour_a and min_t=min_a and sec_t=sec_a) then
		is_alarm <= '1';
	end if;
	
	if (stop_alarm = '1') then
		is_alarm <= '0';
	end if;
end process;

buzzer <= is_alarm;

end Behavioral;

