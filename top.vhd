----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:17:33 05/05/2021 
-- Design Name: 
-- Module Name:    top - Behavioral 
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

entity top is
    Port ( SevSeg : out  STD_LOGIC_VECTOR (6 downto 0);
			  Clk : in STD_LOGIC ;
			  Dot : out STD_LOGIC ;
           Common : out  STD_LOGIC_VECTOR (3 downto 0));
end top;

architecture Behavioral of top is


component number_to_sevseg is
    Port ( input : in  STD_LOGIC_VECTOR (3 downto 0);
           sevseg : out  STD_LOGIC_VECTOR (6 downto 0));
end component;

component clock_divider is
	port ( clk: in std_logic;
				clock_out_2000Hz: out std_logic;
				clock_out_1Hz: out std_logic);
end component;

component mux4_4_1 is
port(in1,in2, in3, in4: in STD_LOGIC_VECTOR (3 downto 0);
	s: in STD_LOGIC_VECTOR (1 downto 0);
	z, comm: out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal count_mux : integer := 0;
signal a: std_logic_vector (3 downto 0) := "0000";
signal b: std_logic_vector (3 downto 0) := "0001";
signal c: std_logic_vector (3 downto 0) := "0010";
signal d: std_logic_vector (3 downto 0) := "0011";
signal clk_mux : std_logic;
signal sevseg_in : std_logic_vector (3 downto 0);

begin

four_bit_to_sevseg : number_to_sevseg 
port map (
	input => sevseg_in,
	sevseg => SevSeg
);

divider : clock_divider
port map (
	clk => Clk,
	clock_out_2000Hz => clk_mux,
	clock_out_1Hz => Dot
);

display_mux : mux4_4_1
port map (
	in1 => a,
	in2 => b,
	in3 => c,
	in4 => d,
	comm => Common,
	s => std_logic_vector(to_unsigned(count_mux, 2)),
	z => sevseg_in
);

-- increment value for display mux
process (clk_mux)
begin
	
	if(clk_mux'event and clk_mux = '1') then
	if (count_mux=3) then 
		count_mux <= 0;
	else 
		count_mux <= count_mux + 1;
	end if;
	end if;
	
end process;


end Behavioral;