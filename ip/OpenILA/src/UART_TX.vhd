library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

entity UART_TX is
  generic (
    G_BAUDS : integer := 115_200
  );
  port (
    CLK_I   : in std_logic;
    RST_N_I : in std_logic;
    EN_I    : in std_logic;

    DATA_I    : in std_logic_vector(7 downto 0);
    DATA_OK_I : in std_logic;
    TX_READY_O : out std_logic;

    TX_O : out std_logic
  );
end entity UART_TX;

architecture rtl of UART_TX is

begin

end architecture;