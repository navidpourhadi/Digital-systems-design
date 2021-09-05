library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity testbench is
end testbench;

architecture arch of testbench is
	component FIFO_BUFFER is
		port(
			clk,reset,wr,rd,wr_en :in std_logic;
			w_data : in std_logic_vector(7 downto 0);
			full, empty : out std_logic;
			r_data : out std_logic_vector(7 downto 0)
		);
	end component;
	
	signal clk,reset,wr,rd,full,empty,wr_en : std_logic;
	signal w_data , r_data : std_logic_vector(7 downto 0);
	constant reset_width : time := 10ns;
	constant clk_width: time:= 10ns;
	
	begin 
		buf:FIFO_BUFFER
			port map(
			clk=>clk, reset=>reset, 
			wr=>wr, rd=>rd, wr_en=>wr_en,
			full=>full, empty=>empty,
			w_data=>w_data, r_data=>r_data);
		
			--define processes
			reset_process: process
			begin
				reset<='1';
				WAIT FOR 10ns;
				reset<='0';
				WAIT;
			end process;
			
			clk_process: process
			begin	
				clk <= '0';
				WAIT FOR clk_width;
				clk <= '1';
				WAIT FOR clk_width;
			end process;	
			
			process
			begin
				wr<= '1';
				FOR i IN 0 to 20 LOOP
					w_data <= std_logic_vector(to_unsigned(i,8));
					wait until clk'event and clk='1';
				end LOOP;
				wr<='0';	
				wait;
			end process;
			
			process
			begin
				FOR i in 0 to 20 LOOP
					rd <= '1';
					wait until clk'event and clk='1';
					rd <= '0';
					wait until clk'event and clk='1';					
				end LOOP;
				rd <='0';
				wait;
			end process;
		end arch;	