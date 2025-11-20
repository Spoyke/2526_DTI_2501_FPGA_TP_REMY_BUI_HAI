library ieee;
use ieee.std_logic_1164.all;

entity DiviseurFrequence_tb is
end entity DiviseurFrequence_tb;

architecture tb of DiviseurFrequence_tb is	
	signal tb_iclk : std_logic;
    signal tb_oclk : std_logic;
begin
    uut: entity work.DiviseurFrequence
    generic map (
        n => 50 -- Pour pouvoir voir la division en fréquence
    )
	port map(
        i_clk => tb_iclk,
	    o_clk => tb_oclk
	);
	 
	clk : process 
        constant CLK_PERIOD : time := 20 ps;  -- Période de l'horloge (50 GHz)sim:/freq_div_tb
        constant NUM_CYCLES : integer := 100000;  -- Nombre de cycles d'horloge
    begin
        for i in 1 to NUM_CYCLES loop
            tb_iclk <= '0', '1' after CLK_PERIOD/2;
            wait for CLK_PERIOD;
        end loop;
      
		tb_iclk <= '0';  -- Arrête l'horloge en la mettant à '0'
		wait;         -- Arrête le processus
    end process;
end architecture tb;