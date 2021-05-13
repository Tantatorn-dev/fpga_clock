----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:25:29 05/07/2021 
-- Design Name: 
-- Module Name:    view_controller - Behavioral 
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

entity view_controller is
    Port ( x_in : in  STD_LOGIC_VECTOR (3 downto 0);
           y_in : in  STD_LOGIC_VECTOR (3 downto 0);
           a_in : in  STD_LOGIC_VECTOR (3 downto 0);
           b_in : in  STD_LOGIC_VECTOR (3 downto 0);
           c_in : in  STD_LOGIC_VECTOR (3 downto 0);
           d_in : in  STD_LOGIC_VECTOR (3 downto 0);
           out_1 : out  STD_LOGIC_VECTOR (3 downto 0);
           out_2 : out  STD_LOGIC_VECTOR (3 downto 0);
           out_3 : out  STD_LOGIC_VECTOR (3 downto 0);
           out_4 : out  STD_LOGIC_VECTOR (3 downto 0);
           view_select : in  STD_LOGIC);
end view_controller;

architecture Behavioral of view_controller is

begin

process(x_in, y_in, a_in, b_in, c_in, d_in, view_select)
begin
	if(view_select='1') then
		out_1 <= x_in;
		out_2 <= y_in;
		out_3 <= a_in;
		out_4 <= b_in;
	else
		out_1 <= a_in;
		out_2 <= b_in;
		out_3 <= c_in;
		out_4 <= d_in;
	end if;
end process;

end Behavioral;
