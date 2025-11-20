library ieee;
use ieee.std_logic_1164.all;

entity DetecteurFront is
    port(
        i_clk_50 : in std_logic;
        i_in : in std_logic;

        o_front : out std_logic;
        o_front_type : out std_logic
    );
end entity DetecteurFront;

architecture behavior of DetecteurFront is

    component BasculeD
    port (
        i_d : in std_logic;
        i_clk : in std_logic;
        i_en : in std_logic;
        o_q : out std_logic
    );
    end component BasculeD;

    component DiviseurFrequence
    port(
        i_clk : in std_logic;
        o_en : out std_logic
    );
    end component DiviseurFrequence;

    signal s_en : std_logic := '0';
	 
	 signal a : std_logic;
    signal b : std_logic;
    signal a_p : std_logic;
    signal b_p : std_logic;

    begin

        DiviseurFrequence0 : component DiviseurFrequence
        port map(
            i_clk => i_clk_50,
            o_en => s_en
        );

		process(i_clk, s_en)
		begin
			if (s_en = '1') then
				a_p <= a;
				b_p <= b;
				
			end if;
		end process;
	

    o_front <= (s_E1 xor s_E2); -- 1 = front
    o_front_type <= not s_E2; -- 0 front descendant, 1 front montant

end architecture behavior;