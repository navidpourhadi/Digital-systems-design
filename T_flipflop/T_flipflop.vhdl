-- Two segment coding implementation of TFF
library ieee;
use ieee.std_logic_1164.all;

entity T_flipflop is port(
	T : in std_logic;
	clk : in std_logic;
	reset : in std_logic;
	Q : out std_logic
);
end T_flipflop;

architecture TFF_arch of T_flipflop is
	signal Q_next : std_logic;
	signal Q_reg  : std_logic;
begin	
	-- memory section
	process(clk,reset)
	begin
		if (reset = '1') then
			Q_reg <= '0';
		elsif (clk'event and clk = '1') then
			Q_reg <= Q_next;
		end if;
	end process;	
	
	-- next state logic section
	Q_next <= not(Q_reg) when T = '1' else
				 Q_reg;

	-- output logic
	Q <= Q_reg;
end TFF_arch;	