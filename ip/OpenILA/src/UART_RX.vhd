library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

entity UART_RX is
  generic (
    G_BAUDS : integer := 115_200
  );
  port (
    CLK_I   : in std_logic;
    RST_N_I : in std_logic;
    EN_I    : in std_logic;

    DATA_O    : out std_logic_vector(7 downto 0);
    DATA_OK_O : out std_logic;

    RX_I : in std_logic
  );
end entity UART_RX;

architecture rtl of UART_RX is

begin

end architecture;