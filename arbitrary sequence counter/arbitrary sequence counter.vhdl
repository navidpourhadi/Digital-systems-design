library ieee;
use ieee.std_logic_1164.all;

entity arbitrary_counter is port(
	clk, reset : in std_logic;
	Q : out std_logic_vector(2 downto 0)
);
end arbitrary_counter;

architecture ASC_arch of arbitrary_counter is
	signal r_reg : std_logic_vector(2 downto 0);
	signal r_next : std_logic_vector(2 downto 0);
begin
	-- register array
	process(clk,reset)
	begin
		if(reset = '1') then
			r_reg <= "000";
		elsif(clk'event and clk = '1') then
			r_reg <= r_next;
		end if;
	end process;
	-- next state logic
	
	r_next(2) <= (r_reg(1) xor r_reg(0)) or (not(r_reg(2)) and r_reg(1));
	r_next(1) <= r_reg(2) nand r_reg(1);
	r_next(0) <= r_reg(1) nand r_reg(0);
	-- output logic
	Q <= r_reg;
	
end ASC_arch;	
	