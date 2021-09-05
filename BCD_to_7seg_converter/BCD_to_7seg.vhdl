library ieee;
use ieee.std_logic_1164.all;

entity BCDconverter is port(
    W : in std_logic_vector(3 downto 0);
    Y : out std_logic_vector(6 downto 0)   -- Y = (a,b,c,d,e,f,g)
);
end BCDconverter;

architecture BCD_arch of BCDconverter is
begin
    process(W)
    begin
        Y <= "0000000";
        case W is 
            when "0000" => Y <= "1111110";
            when "0001" => Y <= "0110000";
            when "0010" => Y <= "1101101";
            when "0011" => Y <= "1111001";
            when "0100" => Y <= "0110011";
            when "0101" => Y <= "1011011";
            when "0110" => Y <= "1011111";
            when "0111" => Y <= "1110000";
            when "1000" => Y <= "1111111";
            when others => Y <= "1111011";
        end case;
    end process;
end BCD_arch;            
            