library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity FIFO_BUFFER is
	port(
		clk,reset,wr,rd,wr_en :in std_logic;
		w_data : in std_logic_vector(7 downto 0);
		full, empty : out std_logic;
		r_data : out std_logic_vector(7 downto 0)
	);
end FIFO_BUFFER;

architecture arch of FIFO_BUFFER is
	component FIFO_controller is
		port(
			clk, reset : in std_logic;
			wr, rd: in std_logic;
			full, empty : out std_logic;
			w_addr, r_addr : out std_logic_vector(1 downto 0)
		);
	end component;
	component register_file is port(
		clk, reset : in std_logic;
		wr_en: in std_logic;
		w_addr, r_addr : in std_logic_vector(1 downto 0);	
		w_data : in std_logic_vector(7 downto 0);
		r_data : out std_logic_vector(7 downto 0)
		);
	end component;
	
	signal w_addr , r_addr :std_logic_vector(1 downto 0);

	begin 
		controller:FIFO_controller
			port map(
			clk=>clk, reset=>reset, 
			wr=>wr, rd=>rd, 
			full=>full, empty=>empty,
			w_addr=>w_addr, r_addr=>r_addr);
		reg_file:register_file
			port map(
			clk=>clk, reset=>reset, 
			wr_en=>wr_en, 
			w_addr=>w_addr, r_addr=>r_addr,
			w_data=>w_data,r_data=>r_data);	
			
			
		end arch;	