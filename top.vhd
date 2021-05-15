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
			  ViewMode : in STD_LOGIC;
           Common : out  STD_LOGIC_VECTOR (3 downto 0);
			  SetAlarmMode : in STD_LOGIC;
			  IncHour : in STD_LOGIC;
			  IncMin : in STD_LOGIC;
			  IncSec : in STD_LOGIC;
			  SetTime : in STD_LOGIC;
			  Buzzer : out STD_LOGIC;
			  StopAlarm : in STD_LOGIC;
			  Snooze : in STD_LOGIC;
			  MuteBuzzer : in STD_LOGIC
			  );
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
	dot: out STD_LOGIC;
	z, comm: out STD_LOGIC_VECTOR (3 downto 0));
end component;

component time_counter is
    Port ( clk_second : in  STD_LOGIC;
			  hour_in : in STD_LOGIC_VECTOR (7 downto 0);
			  min_in : in STD_LOGIC_VECTOR (7 downto 0);
			  sec_in : in STD_LOGIC_VECTOR (7 downto 0);
			  set_time : in STD_LOGIC ;
			  hour_out : out STD_LOGIC_VECTOR (7 downto 0);
			  min_out : out STD_LOGIC_VECTOR (7 downto 0);
			  sec_out : out STD_LOGIC_VECTOR (7 downto 0);
			  x_out : out  STD_LOGIC_VECTOR (3 downto 0);
			  y_out : out  STD_LOGIC_VECTOR (3 downto 0);
           a_out : out  STD_LOGIC_VECTOR (3 downto 0);
           b_out : out  STD_LOGIC_VECTOR (3 downto 0);
           c_out : out  STD_LOGIC_VECTOR (3 downto 0);
           d_out : out  STD_LOGIC_VECTOR (3 downto 0));
end component;

component alarm_counter is
    Port ( inc_sec : in  STD_LOGIC;
			  inc_min : in STD_LOGIC;
			  clk_m : in STD_LOGIC;
			  inc_hour : in STD_LOGIC;
			  hour_out : out STD_LOGIC_VECTOR (7 downto 0);
			  min_out : out STD_LOGIC_VECTOR (7 downto 0);
			  sec_out : out STD_LOGIC_VECTOR (7 downto 0);
			  x_out : out  STD_LOGIC_VECTOR (3 downto 0);
			  y_out : out  STD_LOGIC_VECTOR (3 downto 0);
           a_out : out  STD_LOGIC_VECTOR (3 downto 0);
           b_out : out  STD_LOGIC_VECTOR (3 downto 0);
           c_out : out  STD_LOGIC_VECTOR (3 downto 0);
           d_out : out  STD_LOGIC_VECTOR (3 downto 0));
end component;

component view_controller is
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
end component;

component check_alarm is
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
end component;

signal count_mux : integer := 0;

signal x: std_logic_vector (3 downto 0);
signal y: std_logic_vector (3 downto 0);
signal a: std_logic_vector (3 downto 0);
signal b: std_logic_vector (3 downto 0);
signal c: std_logic_vector (3 downto 0);
signal d: std_logic_vector (3 downto 0);

signal hour_time: std_logic_vector (7 downto 0);
signal min_time: std_logic_vector (7 downto 0);
signal sec_time: std_logic_vector (7 downto 0);

signal hour_alarm: std_logic_vector (7 downto 0);
signal min_alarm: std_logic_vector (7 downto 0);
signal sec_alarm: std_logic_vector (7 downto 0);

signal x_t: std_logic_vector (3 downto 0);
signal y_t: std_logic_vector (3 downto 0);
signal a_t: std_logic_vector (3 downto 0);
signal b_t: std_logic_vector (3 downto 0);
signal c_t: std_logic_vector (3 downto 0);
signal d_t: std_logic_vector (3 downto 0);

signal x_a: std_logic_vector (3 downto 0);
signal y_a: std_logic_vector (3 downto 0);
signal a_a: std_logic_vector (3 downto 0);
signal b_a: std_logic_vector (3 downto 0);
signal c_a: std_logic_vector (3 downto 0);
signal d_a: std_logic_vector (3 downto 0);

signal n1: std_logic_vector (3 downto 0);
signal n2: std_logic_vector (3 downto 0);
signal n3: std_logic_vector (3 downto 0);
signal n4: std_logic_vector (3 downto 0);

signal clk_mux : std_logic;
signal clk_s : std_logic;
signal sevseg_in : std_logic_vector (3 downto 0);

signal buzz : std_logic;


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
	clock_out_1Hz => clk_s
);

t_counter : time_counter
port map (
	clk_second => clk_s,
	x_out => x_t,
	y_out => y_t,
	a_out => a_t,
	b_out => b_t,
	c_out => c_t,
	d_out => d_t,
	hour_in => hour_alarm,
	min_in => min_alarm,
	sec_in => sec_alarm,
	hour_out => hour_time,
	min_out => min_time,
	sec_out => sec_time,
	set_time => SetTime
);

a_counter : alarm_counter
port map (
	inc_hour => IncHour,
	inc_min => IncMin,
	clk_m => clk_mux,
	inc_sec => IncSec,
	hour_out => hour_alarm,
	min_out => min_alarm,
	sec_out => sec_alarm,
	x_out => x_a,
	y_out => y_a,
	a_out => a_a,
	b_out => b_a,
	c_out => c_a,
	d_out => d_a
);  

alarm : check_alarm
port map (
	stop_alarm => StopAlarm,
   hour_t => hour_time,
   min_t => min_time,
   sec_t => sec_time,
   hour_a => hour_alarm,
   min_a => min_alarm,
   sec_a => sec_alarm,
   snooze => Snooze,
	clk_activate => clk_mux,
   buzzer => buzz
);

Buzzer <= buzz and MuteBuzzer;

-- check which mode is on : time or set alarm mode
process (clk_s, SetAlarmMode)
begin
	if (SetAlarmMode = '1') then
	 x <= x_a;
	 y <= y_a;
	 a <= a_a;
	 b <= b_a;
	 c <= c_a;
	 d <= d_a;
	else
	 x <= x_t;
	 y <= y_t;
	 a <= a_t;
	 b <= b_t;
	 c <= c_t;
	 d <= d_t;
	end if;
end process;

view : view_controller
port map (
	x_in => x,
   y_in => y,
   a_in => a,
   b_in => b,
   c_in => c,
   d_in => d,
   out_1 => n1,
	out_2 => n2,
	out_3 => n3,
	out_4 => n4,        
   view_select => ViewMode
);

display_mux : mux4_4_1
port map (
	in1 => n1,
	in2 => n2,
	in3 => n3,
	in4 => n4,
	dot => Dot,
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

