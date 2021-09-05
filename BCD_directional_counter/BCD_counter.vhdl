library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity Dir_counter is port(
	clk,reset : in std_logic;
	Direction : in std_logic;
	max_pulse : out std_logic; -- turn into 1 whenever Q = '1111' and Direction = '1'
	min_pulse : out std_logic; -- turn into 1 whenever Q = '0000' and Direction = '0'
	Q : out std_logic_vector(3 downto 0)
);
end Dir_counter;

architecture counter_arch of Dir_counter is
	signal r_reg : unsigned(3 downto 0);
	signal r_next : unsigned(3 downto 0);
begin
		process(clk,reset)
		begin
			if(reset = '1') then
				r_reg <= (others => '0');
			elsif(clk'event and clk = '1') then
				r_reg <= r_next;
			end if;
		end process;	
		--next state logic
		r_next <= "0000" when (Direction = '1' and r_reg = "1111") else
					 "1111" when (Direction = '0' and r_reg = "0000") else
					 (r_reg - 1) when Direction = '0' else
					 (r_reg + 1);
		-- output logic			 
		Q <= std_logic_vector(r_reg);
		max_pulse <= '1' when (r_reg = "1111" and Direction = '1') else
						 '0';
		min_pulse <= '1' when (r_reg = "0000" and Direction = '0') else
						 '0';				 
end counter_arch;						 