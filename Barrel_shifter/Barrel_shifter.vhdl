library ieee;
use ieee.std_logic_1164.all;

entity Barrel_shifter is port(
    W : in std_logic_vector(3 downto 0);
    s : in std_logic_vector(1 downto 0);
    Y : out std_logic_vector(3 downto 0)
);
end Barrel_shifter;

architecture barrel_arch of Barrel_shifter is
    signal a,b,c,d : std_logic_vector(3 downto 0);
    begin
        a <= W(3 downto 0);
        b <= W(0) & W(3 downto 1);
        c <= W(1 downto 0) & W(3 downto 2);
        d <= W(2 downto 0) & W(3);
        with s select
            Y <= a when "00",
                 b when "01",
                 c when "10",
                 d when others;
    end barrel_arch;             