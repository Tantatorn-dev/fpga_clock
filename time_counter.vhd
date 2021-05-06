----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:36:58 05/06/2021 
-- Design Name: 
-- Module Name:    time_counter - Behavioral 
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

entity time_counter is
    Port ( clk_second : in  STD_LOGIC;
           a_out : out  STD_LOGIC_VECTOR (3 downto 0);
           b_out : out  STD_LOGIC_VECTOR (3 downto 0);
           c_out : out  STD_LOGIC_VECTOR (3 downto 0);
           d_out : out  STD_LOGIC_VECTOR (3 downto 0));
end time_counter;

architecture Behavioral of time_counter is

signal count_a: integer:=0;
signal count_b: integer:=0;
signal count_c: integer:=0;
signal count_d: integer:=0;

signal clk_t_a: std_logic := '0';
signal clk_t_b: std_logic := '0';
signal clk_t_c: std_logic := '0';
signal clk_t_d: std_logic := '0';

begin

process(clk_second)
begin
	if(clk_second'event and clk_second='1') then
		count_d <= count_d + 1;
		clk_t_d <= '0';
		if (count_d = 9) then
		count_d <= 0;
		clk_t_d <= '1';
		end if;
	end if;
end process;

process(clk_t_d)
begin
	if(clk_t_d'event and clk_t_d='1') then
		count_c <= count_c + 1;
		clk_t_c <= '0';
		if (count_c = 5) then
		count_c <= 0;
		clk_t_c <= '1';
		end if;
	end if;
end process;

process(clk_t_c)
begin
	if(clk_t_c'event and clk_t_c='1') then
		count_b <= count_b + 1;
		clk_t_b <= '0';
		if (count_b = 9) then
		count_b <= 0;
		clk_t_b <= '1';
		end if;
	end if;
end process;

process(clk_t_b)
begin
	if(clk_t_b'event and clk_t_b='1') then
		count_a <= count_a + 1;
		clk_t_a <= '0';
		if (count_a = 5) then
		count_a <= 0;
		clk_t_a <= '1';
		end if;
	end if;
end process;

a_out <= std_logic_vector(to_unsigned(count_a, 4));
b_out <= std_logic_vector(to_unsigned(count_b, 4));
c_out <= std_logic_vector(to_unsigned(count_c, 4));
d_out <= std_logic_vector(to_unsigned(count_d, 4));

end Behavioral;

