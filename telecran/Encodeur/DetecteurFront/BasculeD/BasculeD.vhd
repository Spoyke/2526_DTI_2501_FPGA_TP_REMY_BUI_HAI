library ieee;
use ieee.std_logic_1164.all;

entity BasculeD is
    port(
        i_d : in std_logic;
        i_clk : in std_logic;
        i_en : in std_logic;
        o_q : out std_logic
    );
end entity BasculeD;

architecture behavior of BasculeD is
begin
    process(i_clk)
    begin
        if (rising_edge(i_clk)) then
            if (i_en = '1') then 
                o_q <= i_d;
            end if;
        end if;
    end process;
end architecture behavior;