library ieee;
use ieee.std_logic_1164.all;

entity OpenILA is
  generic (
    G_PROBES  : integer := 1;
    G_SAMPLES : integer := 64;

    G_WIDTH_1  : integer := 32;
    G_WIDTH_2  : integer := 32;
    G_WIDTH_3  : integer := 32;
    G_WIDTH_4  : integer := 32;
    G_WIDTH_5  : integer := 32;
    G_WIDTH_6  : integer := 32;
    G_WIDTH_7  : integer := 32;
    G_WIDTH_8  : integer := 32;
    G_WIDTH_9  : integer := 32;
    G_WIDTH_10 : integer := 32;
    G_WIDTH_11 : integer := 32;
    G_WIDTH_12 : integer := 32;
    G_WIDTH_13 : integer := 32;
    G_WIDTH_14 : integer := 32;
    G_WIDTH_15 : integer := 32;
    G_WIDTH_16 : integer := 32;
    G_WIDTH_17 : integer := 32;
    G_WIDTH_18 : integer := 32;
    G_WIDTH_19 : integer := 32;
    G_WIDTH_20 : integer := 32;
    G_WIDTH_21 : integer := 32;
    G_WIDTH_22 : integer := 32;
    G_WIDTH_23 : integer := 32;
    G_WIDTH_24 : integer := 32;
    G_WIDTH_25 : integer := 32;
    G_WIDTH_26 : integer := 32;
    G_WIDTH_27 : integer := 32;
    G_WIDTH_28 : integer := 32;
    G_WIDTH_29 : integer := 32;
    G_WIDTH_30 : integer := 32;
    G_WIDTH_31 : integer := 32;
    G_WIDTH_32 : integer := 32;

    G_UART_ACTIVE : boolean := FALSE;
    G_UART_BAUDS  : integer := 115_200
  );
  port (
    CLK_I      : in std_logic;
    PROBE_I_1  : in std_logic_vector(G_WIDTH_1 - 1 downto 0);
    PROBE_I_2  : in std_logic_vector(G_WIDTH_2 - 1 downto 0);
    PROBE_I_3  : in std_logic_vector(G_WIDTH_3 - 1 downto 0);
    PROBE_I_4  : in std_logic_vector(G_WIDTH_4 - 1 downto 0);
    PROBE_I_5  : in std_logic_vector(G_WIDTH_5 - 1 downto 0);
    PROBE_I_6  : in std_logic_vector(G_WIDTH_6 - 1 downto 0);
    PROBE_I_7  : in std_logic_vector(G_WIDTH_7 - 1 downto 0);
    PROBE_I_8  : in std_logic_vector(G_WIDTH_8 - 1 downto 0);
    PROBE_I_9  : in std_logic_vector(G_WIDTH_9 - 1 downto 0);
    PROBE_I_10 : in std_logic_vector(G_WIDTH_10 - 1 downto 0);
    PROBE_I_11 : in std_logic_vector(G_WIDTH_11 - 1 downto 0);
    PROBE_I_12 : in std_logic_vector(G_WIDTH_12 - 1 downto 0);
    PROBE_I_13 : in std_logic_vector(G_WIDTH_13 - 1 downto 0);
    PROBE_I_14 : in std_logic_vector(G_WIDTH_14 - 1 downto 0);
    PROBE_I_15 : in std_logic_vector(G_WIDTH_15 - 1 downto 0);
    PROBE_I_16 : in std_logic_vector(G_WIDTH_16 - 1 downto 0);
    PROBE_I_17 : in std_logic_vector(G_WIDTH_17 - 1 downto 0);
    PROBE_I_18 : in std_logic_vector(G_WIDTH_18 - 1 downto 0);
    PROBE_I_19 : in std_logic_vector(G_WIDTH_19 - 1 downto 0);
    PROBE_I_20 : in std_logic_vector(G_WIDTH_20 - 1 downto 0);
    PROBE_I_21 : in std_logic_vector(G_WIDTH_21 - 1 downto 0);
    PROBE_I_22 : in std_logic_vector(G_WIDTH_22 - 1 downto 0);
    PROBE_I_23 : in std_logic_vector(G_WIDTH_23 - 1 downto 0);
    PROBE_I_24 : in std_logic_vector(G_WIDTH_24 - 1 downto 0);
    PROBE_I_25 : in std_logic_vector(G_WIDTH_25 - 1 downto 0);
    PROBE_I_26 : in std_logic_vector(G_WIDTH_26 - 1 downto 0);
    PROBE_I_27 : in std_logic_vector(G_WIDTH_27 - 1 downto 0);
    PROBE_I_28 : in std_logic_vector(G_WIDTH_28 - 1 downto 0);
    PROBE_I_29 : in std_logic_vector(G_WIDTH_29 - 1 downto 0);
    PROBE_I_30 : in std_logic_vector(G_WIDTH_30 - 1 downto 0);
    PROBE_I_31 : in std_logic_vector(G_WIDTH_31 - 1 downto 0);
    PROBE_I_32 : in std_logic_vector(G_WIDTH_32 - 1 downto 0);
    -- UART Interface
    UART_TX_O : out std_logic;
    UART_RX_I : in std_logic
  );
end entity OpenILA;

architecture rtl of OpenILA is

  signal s_rst_n : std_logic;

begin
  reset_inst : entity work.reset
    port map
    (
      CLK_I   => CLK_I,
      RST_N_O => s_rst_n
    );
  OpenILA_controller_inst : entity work.OpenILA_controller
    port map
    (
      CLK_I   => CLK_I,
      RST_N_I => s_rst_n,
      EN_I    => '1'
    );

  probe_wrapper_inst : entity work.probe_wrapper
    generic map(
      G_PROBES  => G_PROBES,
      G_SAMPLES => G_SAMPLES,
      G_WIDTH_1 => G_WIDTH_1,
      G_WIDTH_2 => G_WIDTH_2
    )
    port map
    (
      CLK_I              => CLK_I,
      RST_N_I            => s_rst_n,
      EN_I               => '1',
      DATA_PROBE1        => DATA_PROBE1,
      DATA_PROBE2        => DATA_PROBE2,
      POSITION_I         => POSITION_I,
      TRIGGER_TYPE1      => TRIGGER_TYPE1,
      TRIGGER_TYPE2      => TRIGGER_TYPE2,
      TRIGGER_VALUE1     => TRIGGER_VALUE1,
      TRIGGER_VALUE2     => TRIGGER_VALUE2,
      TRIGGER_START_I    => TRIGGER_START_I,
      TRIGGER_STOP_I     => TRIGGER_STOP_I,
      TRIGGER_FINISH_O   => TRIGGER_FINISH_O,
      READ_I             => READ_I,
      DATA1_O            => DATA1_O,
      TRIGGER_ACTIVE_1_O => TRIGGER_ACTIVE_1_O
    );

  JTAG_interface_inst : if G_UART_ACTIVE = FALSE generate
    jtag_if_inst : entity work.jtag_if
      port map
      (
        DATA_IN_O     => DATA_IN_O,
        DATA_IN_OK_O  => DATA_IN_OK_O,
        DATA_OUT_I    => DATA_OUT_I,
        DATA_OUT_OK_I => DATA_OUT_OK_I,
        RESET         => RESET,
        TCK           => TCK,
        TMS           => TMS,
        TDI           => TDI,
        TDO           => TDO
      );

  elsif G_UART_ACTIVE = TRUE generate

      uart_if_inst : entity work.uart_if
        generic map(
          G_BAUDS => G_UART_BAUDS
        )
        port map
        (
          CLK_I     => CLK_I,
          RST_N_I   => s_rst_n,
          EN_I      => '1',
          DATA_I    => DATA_I,
          DATA_OK_I => DATA_OK_I,
          DATA_O    => DATA_O,
          DATA_OK_O => DATA_OK_O,
          RX_I      => UART_RX_I,
          TX_O      => UART_TX_O
        );

    end generate;
  end architecture;