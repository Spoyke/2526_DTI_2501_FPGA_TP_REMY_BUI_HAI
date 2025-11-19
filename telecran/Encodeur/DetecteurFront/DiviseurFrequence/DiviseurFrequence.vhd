library ieee;
use ieee.std_logic_1164.all;

entity DiviseurFrequence is
    generic (
        n : integer := 50000 --Valeur du dénominateur de la division
    );
    port(
        i_clk : in std_logic;
        o_en : out std_logic
    );
end entity DiviseurFrequence;

architecture behavior of DiviseurFrequence is
    signal s_state : std_logic := '0'; 
begin
    process(i_clk)
        variable temp : integer := 0;
    begin
        if (rising_edge(i_clk)) then
            temp := temp + 1;
				s_state <= '0';
            
				if (temp = n) then 
                s_state <= '1';
					 temp := 0;
            end if;
        end if;
    end process;

    o_en <= s_state;
end architecture behavior;