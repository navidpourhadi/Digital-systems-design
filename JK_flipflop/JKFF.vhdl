-- one segment coding implementation
library ieee;
use ieee.std_logic_1164.all;

entity JK_flipflop is port(
    j,k : in std_logic;
    clk, reset : in std_logic;
    Q : out std_logic
);

arcitecture JKFF_arch of JK_flipflop is 
    signal r_reg : std_logic;

    begin
        process(clk, reset)
        begin
            if (reset = '1') then
                r_reg <= '0';
            elsif (clk'event and clk = '1') then
                if (j = '0' and k = '0') then
                    r_reg <= r_reg;
                elsif (j = '1' and k = '1') then
                    r_reg <= not r_reg;
                elsif (j = '0' and k = '1') then
                    r_reg <= '0';
                elsif (j = '1' and k = '0') then
                    r_reg <= '1';      
                end if;
            end if;
        end process;
        Q <= r_reg;
    end JKFF_arch;                         