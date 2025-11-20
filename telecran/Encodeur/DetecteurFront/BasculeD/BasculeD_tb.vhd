library ieee;
use ieee.std_logic_1164.all;

entity BasculeD_tb is
end entity BasculeD_tb;

architecture tb of BasculeD_tb is	
	signal tb_d : std_logic;
    signal tb_clk : std_logic;
	signal tb_en : std_logic;
	signal tb_q : std_logic;
begin
    uut: entity work.BasculeD
	 port map(
		i_d => tb_d,
		i_clk => tb_clk,
		i_en => tb_en,
		o_q => tb_q
	 );
	 
	 clk : process 
			constant CLK_PERIOD : time := 20 ps;  -- Période de l'horloge (50 MHz)
			constant NUM_CYCLES : integer := 10;  -- Nombre de cycles d'horloge
	 begin
		for i in 1 to NUM_CYCLES loop
			tb_clk <= '0', '1' after CLK_PERIOD/2;
				wait for CLK_PERIOD;
      end loop;
      
		tb_clk <= '0';  -- Arrête l'horloge en la mettant à '0'
		wait;         -- Arrête le processus
    end process;
		
		
	stim_process : process
    begin
        tb_d <= '0';
		  tb_en <= '1';
        wait for 40 ps;
		  tb_d <= '1';
		  wait for 20 ps;
		  tb_d <= '0';
		  wait for 40 ps;
		  tb_en <= '0';
		  tb_d <= '1';
        wait for 20 ps;
		  tb_en <= '1';
		  tb_d <= '0';
        wait;
    end process;
end architecture tb;