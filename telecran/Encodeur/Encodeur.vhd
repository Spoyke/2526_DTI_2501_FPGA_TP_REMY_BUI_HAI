library ieee;
use ieee.std_logic_1164.all;

entity Encodeur is
    port(
        i_A : in std_logic;
        i_B : in std_logic;
        i_clk : in std_logic;

        o_Q : out natural
    );
end entity Encodeur;

architecture behavior of Encodeur is
	component DiviseurFrequence
    port(
        i_clk : in std_logic;
        o_en : out std_logic
    );
    end component DiviseurFrequence;
	 
  signal s_en : std_logic := '0';
	 
	 signal a : std_logic := '0';
    signal b : std_logic := '0';
    signal a_p : std_logic := '0';
    signal b_p : std_logic := '0';
	 
	 signal s_cpt : integer := 0;


    begin
	DiviseurFrequence0 : component DiviseurFrequence
	  port map(
			i_clk => i_clk,
			o_en => s_en
  );
		  
	process(i_clk) 
	begin 
	if (rising_edge(i_clk)) then 
		if (s_en = '1') then
			a_p <= a;
			b_p <= b;
			a <= i_A;
			b <= i_b;
			
			if ((a xor a_p) = '1') then
				if ((a xor b) = '1') then
					s_cpt <= s_cpt + 1;
				else 
					s_cpt <= s_cpt - 1;
				end if;
			end if;
		end if;
	end if;
	end process;

    o_Q <= s_cpt;
end architecture behavior;