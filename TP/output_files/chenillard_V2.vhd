library ieee;
use ieee.std_logic_1164.all;

entity chenillard_V2 is
    port (
        i_clk : in std_logic;
        i_rst_n : in std_logic;
        o_leds : out std_logic_vector(9 downto 0)
    );
end entity chenillard_V2;

architecture rtl of chenillard_V2 is
	 signal r_state : natural := 0;
	 signal s_leds : std_logic_vector(9 downto 0) := "0000000001";
begin						 
    process(i_clk, i_rst_n)
	 variable counter : natural range 0 to 5000000 := 0;
	 variable temp : std_logic_vector(9 downto 0);
    begin
        if (i_rst_n = '0') then
				counter := 0;
				temp := "0000000000";
				
			elsif (rising_edge(i_clk)) then
            if (counter = 5000000) then
					counter := 0;
					
					temp := s_leds(8 downto 0) & s_leds(9);
					s_leds <= temp;
					
				else
					counter := counter + 1;
				end if;
        end if;
    end process;
    o_leds <= s_leds;
end architecture rtl;