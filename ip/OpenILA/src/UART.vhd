library ieee;
use ieee.std_logic_1164.all;

entity UART is
  generic (
    G_BAUDS : integer := 115_200
  );
  port (
    CLK_I   : in std_logic;
    RST_N_I : in std_logic;
    EN_I    : in std_logic;

    DATA_I    : in std_logic_vector(7 downto 0);
    DATA_OK_I : in std_logic;
    DATA_O    : out std_logic_vector(7 downto 0);
    DATA_OK_O : out std_logic;
    READY_O   : out std_logic;

    TX_O : out std_logic;
    RX_I : in std_logic

  );
end entity UART;

architecture rtl of UART is

begin

  UART_RX_inst : entity work.UART_RX
    generic map(
      G_BAUDS => G_BAUDS
    )
    port map
    (
      CLK_I     => CLK_I,
      RST_N_I   => RST_N_I,
      EN_I      => EN_I,
      DATA_O    => DATA_O,
      DATA_OK_O => DATA_OK_O,
      RX_I      => RX_I
    );

  UART_TX_inst : entity work.UART_TX
    generic map(
      G_BAUDS => G_BAUDS
    )
    port map
    (
      CLK_I      => CLK_I,
      RST_N_I    => RST_N_I,
      EN_I       => EN_I,
      DATA_I     => DATA_I,
      DATA_OK_I  => DATA_OK_I,
      TX_READY_O => READY_O,
      TX_O       => TX_O
    );
end architecture;