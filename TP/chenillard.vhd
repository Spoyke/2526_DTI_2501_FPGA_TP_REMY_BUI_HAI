library ieee;
use ieee.std_logic_1164.all;

entity chenillard is
    port (
        i_clk : in std_logic;
        i_rst_n : in std_logic;
        o_leds : out std_logic_vector(9 downto 0)
    );
end entity chenillard;

architecture rtl of chenillard is
	 signal r_state : natural := 0;
	 signal r_leds : std_logic_vector(9 downto 0);
	 
begin
	with r_state select r_leds <= 
	"0000000001" when 0,
	"0000000010" when 1,
	"0000000100" when 2,
	"0000001000" when 3, 
	"0000010000" when 4,
	"0000100000" when 5,
	"0001000000" when 6,
	"0010000000" when 7,
	"0100000000" when 8,
	"1000000000" when 9,
	"0000000000" when others;
								 
    process(i_clk, i_rst_n)
	 variable counter : natural range 0 to 5000000 := 0;
    begin
        if (i_rst_n = '0') then
				counter := 0;
				r_state <= 0;
        elsif (rising_edge(i_clk)) then
            if (counter = 5000000) then
					counter := 0;
					r_state <= r_state + 1;
					
					if (r_state = 10) then
						r_state <= 0;
					end if;
				else
					counter := counter + 1;
				end if;
        end if;
    end process;
    o_leds <= r_leds;
end architecture rtl;