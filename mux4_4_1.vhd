----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:37:19 05/06/2021 
-- Design Name: 
-- Module Name:    mux4_4_1 - Behavioral 
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
 
entity mux4_4_1 is
port(in1,in2, in3, in4 : in STD_LOGIC_VECTOR (3 downto 0);
	s: in STD_LOGIC_VECTOR (1 downto 0);
	dot: out STD_LOGIC;
	dot_in: in STD_LOGIC;
	comm: out STD_LOGIC_VECTOR (3 downto 0);
	z: out STD_LOGIC_VECTOR (3 downto 0));
end mux4_4_1;
 
architecture Behavioral of mux4_4_1 is
 
begin
 
process (in1,in2,in3,in4,s) is
begin
	if (s ="00") then
		z <= in1;
		comm <= "0111";
		dot <= '0';
	elsif (s ="01") then
		z <= in2;
		comm <= "1011";
		dot <= dot_in;
	elsif (s ="10") then
		z <= in3;
		comm <= "1101";
		dot <= '0';
	elsif (s ="11") then
		z <= in4;	
		comm <= "1110";
		dot <= '0';
	end if;
end process;
 
end Behavioral;


