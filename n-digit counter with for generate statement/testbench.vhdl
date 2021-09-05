library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity testbench is
end testbench;

architecture arch of testbench is
	component n_digit_counter is
		generic(
			N : natural
		);
		port(
			clk,reset,en : in std_logic;
			output : out std_logic_vector(4*N-1 downto 0);
			max : out std_logic
		);
	end component;
	
	signal clk:std_logic:='0';
	signal en:std_logic:='0';
	signal reset:std_logic;
	signal output : std_logic_vector(7 downto 0);
	signal max : std_logic;
	constant reset_width: time := 10ns;
	constant clk_width: time:= 10ns;
	begin
		uut:n_digit_counter
			generic map (N=>2)
			port map(clk=>clk, reset=>reset, en=>en, output=>output,max=>max);
			
		reset_process: process
			begin
				reset<='1';
				en<='0';
				WAIT FOR 10ns;
				reset<='0';
				en<='1';
				WAIT;
			end process;
			
		clk_process: process
			begin	
				clk <= '0';
				WAIT FOR clk_width;
				clk <= '1';
				WAIT FOR clk_width;
			end process;	
	
end arch;	
				
			