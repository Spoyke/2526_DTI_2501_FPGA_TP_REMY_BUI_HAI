library ieee;
use ieee.std_logic_1164.all;

entity DetecteurFront_tb is
end entity DetecteurFront_tb;

architecture tb of DetecteurFront_tb is	
	signal i_clk_50_tb : std_logic;
    signal i_in_tb   : std_logic;
    signal o_front_tb   : std_logic;
    signal o_front_type_tb   : std_logic;
begin
    uut: entity work.DetecteurFront
	port map(
       i_clk_50     => i_clk_50_tb,
       i_in         => i_in_tb,
       o_front      => o_front_tb,
       o_front_type => o_front_type_tb
	);

    clk : process 
        constant CLK_PERIOD : time := 20 ps;  -- Période de l'horloge (50 GHz)sim:/freq_div_tb
        constant NUM_CYCLES : integer := 1000;  -- Nombre de cycles d'horloge
    begin
        for i in 1 to NUM_CYCLES loop
            i_clk_50_tb <= '0', '1' after CLK_PERIOD/2;
            wait for CLK_PERIOD;
        end loop;
      
		i_clk_50_tb <= '0';  -- Arrête l'horloge en la mettant à '0'
		wait;         -- Arrête le processus
    end process;
	 
    stim_process : process 
    begin
        i_in_tb <= '0';
        wait for 1 ns;

        i_in_tb <= '1';
        wait for 1 ns;

        i_in_tb <= '0';
        wait for 1 ns;

        i_in_tb <= '1';
        wait for 1 ns;

        i_in_tb <= '0';
        wait for 1500 ps;

        i_in_tb <= '1';
        wait for 1 ns;

        i_in_tb <= '0';
        wait for 1 ns;

        i_in_tb <= '1';
        wait for 2000 ps;

        i_in_tb <= '0';
        wait for 1 ns;

        wait;         -- Arrête le processus
    end process;
end architecture tb;