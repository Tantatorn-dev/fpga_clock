----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:56:24 05/06/2021 
-- Design Name: 
-- Module Name:    clock_divider - Behavioral 
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
use IEEE.numeric_std.ALL;
  
entity clock_divider is
	port ( clk: in std_logic;
				clock_out_2000Hz: out std_logic;
				clock_out_2Hz: out std_logic;
				clock_out_1Hz: out std_logic);
end clock_divider;
  
architecture bhv of clock_divider is
  
	signal count: integer:=1;
	signal count0: integer:=1;
	signal count1: integer:=1;
	signal tmp : std_logic := '0';
	signal tmp0 : std_logic := '0';
	signal tmp1 : std_logic := '0';
  
begin
  
process(clk)
begin
	if(clk'event and clk='1') then
		count <= count+1;
		if (count = 20000000) then
		tmp <= NOT tmp;
		count <= 1;
		end if;
	end if;
clock_out_1Hz <= tmp;
end process;

process(clk)
begin
	if(clk'event and clk='1') then
		count1 <= count1+1;
		if (count1 = 10000000) then
		tmp1 <= NOT tmp1;
		count1 <= 1;
		end if;
	end if;
clock_out_2Hz <= tmp1;
end process;

process(clk)
begin
	if(clk'event and clk='1') then
		count0 <= count0+1;
		if (count0 = 20000) then
		tmp0 <= NOT tmp0;
		count0 <= 1;
		end if;
	end if;
clock_out_2000Hz <= tmp0;
end process;
  
end bhv;


