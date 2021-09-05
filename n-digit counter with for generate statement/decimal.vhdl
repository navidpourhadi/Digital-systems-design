library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity decimal_counter is
	port(
		clk,reset,en : in std_logic;
		q : out std_logic_vector(3 downto 0);
		pulse : out std_logic
	);
end decimal_counter;

architecture arch of decimal_counter is
		signal r_reg : unsigned(3 downto 0);
		signal r_next : unsigned(3 downto 0);
	begin		
		--reg
		process(clk,reset)
		begin
			if(reset = '1') then 
				r_reg <= (others =>'0');
			elsif (clk'event and clk='1') then 
				r_reg <= r_next;
			end if;
		end process;
		-- next_state	
		process(en,r_reg)
		begin
			r_next <= r_reg;
			if(en = '1') then
				if (r_reg = 10) then
					r_next <= (others => '0');
				else 
					r_next <= r_reg + 1;
				end if;
			end if;
		end process;
		--output
		q <= std_logic_vector(r_reg);
		pulse <= '1' when r_reg = 9 else
					'0';
end arch;					