library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity n_digit_counter is
	generic(
		N : natural:=2
	);
	port(
		clk,reset,en : in std_logic;
		output : out std_logic_vector(4*N-1 downto 0);
		max : out std_logic
	);
end n_digit_counter;	

architecture arch of n_digit_counter is

	component decimal_counter is
		port(
			clk,reset,en : in std_logic;
			q : out std_logic_vector(3 downto 0);
			pulse : out std_logic
		);
	end component;
	signal pulse : std_logic_vector(N-1 downto 0);
	signal q : std_logic_vector(4*N-1 downto 0);
	signal temp : std_logic_vector(N-1 downto 0):=(others=>'1');
	begin
	
		u1: decimal_counter port map(clk=>clk, reset=>reset, en=>en, pulse=>pulse(0), q=>q(3 downto 0));
		gen:for i in 1 to N-1 generate
			uut: decimal_counter port map(clk=>clk, reset=>reset, en=>pulse(i-1), pulse=>pulse(i), q=>q(4*(i+1)-1 downto 4*i));
		end generate;
		--output
		max <= '1' when pulse = temp else
				 '0';
				 
		output<=q;
end arch;
