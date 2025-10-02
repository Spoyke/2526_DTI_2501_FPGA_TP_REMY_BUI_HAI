library ieee;
use ieee.std_logic_1164.all;

entity TP1 is
    port (
        pushl : in std_logic;
        led0 : out std_logic
    );
end entity TP1;

architecture rtl of TP1 is
begin
    led0 <= pushl;
end architecture rtl;