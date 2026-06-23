library ieee;
use ieee.std_logic_1164.all;


entity uart_if is
    generic (
        G_BAUDS : integer := 115_200
    );
    port (
        CLK_I : in std_logic;
        RST_N_I : in std_logic;
        EN_I : in std_logic;

        DATA_I : in std_logic_vector(7 downto 0);
        DATA_OK_I : in std_logic;

        DATA_O : out std_logic_vector(7 downto 0);
        DATA_OK_O : out std_logic;

        RX_I : in std_logic;
        TX_O : out std_logic
    );
end entity uart_if;

architecture rtl of uart_if is

signal s_ready : std_logic;

begin

    UART_inst: entity work.UART
     generic map(
        G_BAUDS => G_BAUDS
    )
     port map(
        CLK_I => CLK_I,
        RST_N_I => RST_N_I,
        EN_I => EN_I,
        DATA_I => DATA_I,
        DATA_OK_I => DATA_OK_I,
        DATA_O => DATA_O,
        DATA_OK_O => DATA_OK_O,
        READY_O => s_ready,
        TX_O => TX_O,
        RX_I => RX_I
    );
    

end architecture;