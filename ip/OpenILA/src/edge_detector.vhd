library ieee;
use ieee.std_logic_1164.all;

entity edge_detector is
    port (
        CLK_I : in std_logic;
        
        INPUT_DETECTOR : in std_logic;

        RISING_EDGE_O : out std_logic;
        FALLING_EDGE_O : out std_logic;
        EDGES_O : out std_logic
    );
end entity edge_detector;

architecture rtl of edge_detector is

signal r_input_detector : std_logic;

begin

    process (CLK_I)
    begin
        if rising_edge(CLK_I) then
            r_input_detector <= INPUT_DETECTOR;
        end if;
    end process;

    RISING_EDGE_O <= INPUT_DETECTOR and not r_input_detector;

    FALLING_EDGE_O <= not INPUT_DETECTOR and r_input_detector;

    EDGES_O <= INPUT_DETECTOR xor r_input_detector;
    

end architecture;