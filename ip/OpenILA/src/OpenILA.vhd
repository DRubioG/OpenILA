library ieee;
use ieee.std_logic_1164.all;
use ieee.math_real.all;

entity OpenILA is
  generic (
    --! Number of probes of the ILA.
    G_PROBES : integer := 1;
    --! Number of samples of the probes.
    G_SAMPLES : integer := 64;

    --! Width of the 1st probe.
    G_WIDTH_1 : integer := 32;
    --! Width of the 2nd probe.
    G_WIDTH_2 : integer := 32;
    --! Width of the 3rd probe.
    G_WIDTH_3 : integer := 32;
    --! Width of the 4th probe.
    G_WIDTH_4 : integer := 32;
    --! Width of the 5th probe.
    G_WIDTH_5 : integer := 32;
    --! Width of the 6th probe.
    G_WIDTH_6 : integer := 32;
    --! Width of the 7th probe.
    G_WIDTH_7 : integer := 32;
    --! Width of the 8th probe.
    G_WIDTH_8 : integer := 32;
    --! Width of the 9th probe.
    G_WIDTH_9 : integer := 32;
    --! Width of the 10th probe.
    G_WIDTH_10 : integer := 32;
    --! Width of the 11th probe.
    G_WIDTH_11 : integer := 32;
    --! Width of the 12th probe.
    G_WIDTH_12 : integer := 32;
    --! Width of the 13th probe.
    G_WIDTH_13 : integer := 32;
    --! Width of the 14th probe.
    G_WIDTH_14 : integer := 32;
    --! Width of the 15th probe.
    G_WIDTH_15 : integer := 32;
    --! Width of the 16th probe.
    G_WIDTH_16 : integer := 32;
    --! Width of the 17th probe.
    G_WIDTH_17 : integer := 32;
    --! Width of the 18th probe.
    G_WIDTH_18 : integer := 32;
    --! Width of the 19th probe.
    G_WIDTH_19 : integer := 32;
    --! Width of the 20th probe.
    G_WIDTH_20 : integer := 32;
    --! Width of the 21th probe.
    G_WIDTH_21 : integer := 32;
    --! Width of the 22th probe.
    G_WIDTH_22 : integer := 32;
    --! Width of the 23th probe.
    G_WIDTH_23 : integer := 32;
    --! Width of the 24th probe.
    G_WIDTH_24 : integer := 32;
    --! Width of the 25th probe.
    G_WIDTH_25 : integer := 32;
    --! Width of the 26th probe.
    G_WIDTH_26 : integer := 32;
    --! Width of the 27th probe.
    G_WIDTH_27 : integer := 32;
    --! Width of the 28th probe.
    G_WIDTH_28 : integer := 32;
    --! Width of the 29th probe.
    G_WIDTH_29 : integer := 32;
    --! Width of the 30th probe.
    G_WIDTH_30 : integer := 32;
    --! Width of the 31th probe.
    G_WIDTH_31 : integer := 32;
    --! Width of the 32th probe.
    G_WIDTH_32 : integer := 32;
    
    --! Open ILA ID.
    G_ID : integer := 1;

    -- UART Interface
    --! This generic activates the UART interface.
    G_UART_ACTIVE : boolean := FALSE;
    --! This generic selects with are the bauds of the UART.
    G_UART_BAUDS : integer := 115_200
  );
  port (
    --! Input clock of the ILA.
    CLK_I : in std_logic;
    --! Data of the 1st probe of the ILA.
    PROBE_I_1 : in std_logic_vector(G_WIDTH_1 - 1 downto 0);
    --! Data of the 2nd probe of the ILA.
    PROBE_I_2 : in std_logic_vector(G_WIDTH_2 - 1 downto 0);
    --! Data of the 3rd probe of the ILA.
    PROBE_I_3 : in std_logic_vector(G_WIDTH_3 - 1 downto 0);
    --! Data of the 4th probe of the ILA.
    PROBE_I_4 : in std_logic_vector(G_WIDTH_4 - 1 downto 0);
    --! Data of the 5th probe of the ILA.
    PROBE_I_5 : in std_logic_vector(G_WIDTH_5 - 1 downto 0);
    --! Data of the 6th probe of the ILA.
    PROBE_I_6 : in std_logic_vector(G_WIDTH_6 - 1 downto 0);
    --! Data of the 7th probe of the ILA.
    PROBE_I_7 : in std_logic_vector(G_WIDTH_7 - 1 downto 0);
    --! Data of the 8th probe of the ILA.
    PROBE_I_8 : in std_logic_vector(G_WIDTH_8 - 1 downto 0);
    --! Data of the 9th probe of the ILA.
    PROBE_I_9 : in std_logic_vector(G_WIDTH_9 - 1 downto 0);
    --! Data of the 10th probe of the ILA.
    PROBE_I_10 : in std_logic_vector(G_WIDTH_10 - 1 downto 0);
    --! Data of the 11th probe of the ILA.
    PROBE_I_11 : in std_logic_vector(G_WIDTH_11 - 1 downto 0);
    --! Data of the 12th probe of the ILA.
    PROBE_I_12 : in std_logic_vector(G_WIDTH_12 - 1 downto 0);
    --! Data of the 13th probe of the ILA.
    PROBE_I_13 : in std_logic_vector(G_WIDTH_13 - 1 downto 0);
    --! Data of the 14th probe of the ILA.
    PROBE_I_14 : in std_logic_vector(G_WIDTH_14 - 1 downto 0);
    --! Data of the 15th probe of the ILA.
    PROBE_I_15 : in std_logic_vector(G_WIDTH_15 - 1 downto 0);
    --! Data of the 16th probe of the ILA.
    PROBE_I_16 : in std_logic_vector(G_WIDTH_16 - 1 downto 0);
    --! Data of the 17th probe of the ILA.
    PROBE_I_17 : in std_logic_vector(G_WIDTH_17 - 1 downto 0);
    --! Data of the 18th probe of the ILA.
    PROBE_I_18 : in std_logic_vector(G_WIDTH_18 - 1 downto 0);
    --! Data of the 19th probe of the ILA.
    PROBE_I_19 : in std_logic_vector(G_WIDTH_19 - 1 downto 0);
    --! Data of the 20th probe of the ILA.
    PROBE_I_20 : in std_logic_vector(G_WIDTH_20 - 1 downto 0);
    --! Data of the 21th probe of the ILA.
    PROBE_I_21 : in std_logic_vector(G_WIDTH_21 - 1 downto 0);
    --! Data of the 22th probe of the ILA.
    PROBE_I_22 : in std_logic_vector(G_WIDTH_22 - 1 downto 0);
    --! Data of the 23th probe of the ILA.
    PROBE_I_23 : in std_logic_vector(G_WIDTH_23 - 1 downto 0);
    --! Data of the 24th probe of the ILA.
    PROBE_I_24 : in std_logic_vector(G_WIDTH_24 - 1 downto 0);
    --! Data of the 25th probe of the ILA.
    PROBE_I_25 : in std_logic_vector(G_WIDTH_25 - 1 downto 0);
    --! Data of the 26th probe of the ILA.
    PROBE_I_26 : in std_logic_vector(G_WIDTH_26 - 1 downto 0);
    --! Data of the 27th probe of the ILA.
    PROBE_I_27 : in std_logic_vector(G_WIDTH_27 - 1 downto 0);
    --! Data of the 28th probe of the ILA.
    PROBE_I_28 : in std_logic_vector(G_WIDTH_28 - 1 downto 0);
    --! Data of the 29th probe of the ILA.
    PROBE_I_29 : in std_logic_vector(G_WIDTH_29 - 1 downto 0);
    --! Data of the 30th probe of the ILA.
    PROBE_I_30 : in std_logic_vector(G_WIDTH_30 - 1 downto 0);
    --! Data of the 31th probe of the ILA.
    PROBE_I_31 : in std_logic_vector(G_WIDTH_31 - 1 downto 0);
    --! Data of the 32th probe of the ILA.
    PROBE_I_32 : in std_logic_vector(G_WIDTH_32 - 1 downto 0);
    -- UART Interface
    --! TX of the UART.
    UART_TX_O : out std_logic;
    --! RX of the UART.
    UART_RX_I : in std_logic
  );
end entity OpenILA;

architecture rtl of OpenILA is

  --! This is the reset signal.
  signal s_rst_n : std_logic;
  --! Data to receive and sends
  signal s_data_i, s_data_o : std_logic_vector(7 downto 0);
  --! These are the indicator of new data to receive or send.
  signal s_data_ok_i, s_data_ok_o : std_logic;
  --! This is the signal that get the position of the trigger of the ILA.
  signal s_position : std_logic_vector(integer(SQRT(real(G_SAMPLES))) - 1 downto 0);

  --! This type generates the array of type signals. This have the 
  --! type of trigger of every probe.
  type t_trigger_type is array (0 to G_PROBES - 1) of std_logic_vector(2 downto 0);
  --! This is the individual trigger type of every probe.
  signal s_trigger_type : t_trigger_type;

  --! This is the 1st trigger value of the ILA.
  signal s_trigger_value1 : std_logic_vector(G_WIDTH_1 - 1 downto 0);
  --! This is the 2nd trigger value of the ILA.
  signal s_trigger_value2 : std_logic_vector(G_WIDTH_2 - 1 downto 0);
  --! This signal indicates that the trigger is active for all the probes.
  signal s_trigger_start : std_logic;
  --! This signal indicates to all the probes to stop.
  signal s_trigger_stop : std_logic;
  --! This signal indicates that the probes has been finished.
  signal s_trigger_finish : std_logic;
  --! This signal indicates to return the data of the probes.
  signal s_read : std_logic;
  --! This is tha data of the 1st probe.
  signal s_data1 : std_logic_vector(G_WIDTH_1 - 1 downto 0);
  --! This signal indicates that the probes are active.
  signal s_trigger_active : std_logic;

begin
  --! This module generates the reset of the board.
  reset_inst : entity work.reset
    port map
    (
      CLK_I   => CLK_I,
      RST_N_O => s_rst_n
    );

  --! This module controlles the ILA.
  OpenILA_controller_inst : entity work.OpenILA_controller
    generic map(
      G_WIDTH_1 => G_WIDTH_1
    )
    port map
    (
      CLK_I            => CLK_I,
      RST_N_I          => s_rst_n,
      EN_I             => '1',
      DATA_I           => s_data_i,
      DATA_OK_I        => s_data_ok_i,
      DATA_O           => s_data_o,
      DATA_OK_O        => s_data_ok_o,
      TRIGGER_VALUE_PROBE1    => s_trigger_value1,
      TRIGGER_START_O  => s_trigger_start,
      TRIGGER_STOP_O   => s_trigger_stop,
      TRIGGER_FINISH_O => s_trigger_finish,
      READ_O           => s_read,
      DATA1_I          => s_data1,
      TRIGGER_ACTIVE_I => s_trigger_active
    );

  --! This module wraps all the probes with its internal controller.
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
      DATA_PROBE1        => PROBE_I_1,
      DATA_PROBE2        => PROBE_I_2,
      POSITION_I         => s_position,
      TRIGGER_TYPE1      => s_trigger_type(0),
      TRIGGER_TYPE2      => s_trigger_type(1),
      TRIGGER_VALUE1     => s_trigger_value1,
      TRIGGER_VALUE2     => s_trigger_value2,
      TRIGGER_START_I    => s_trigger_start,
      TRIGGER_STOP_I     => s_trigger_stop,
      TRIGGER_FINISH_O   => s_trigger_finish,
      READ_I             => s_read,
      DATA1_O            => s_data1,
      TRIGGER_ACTIVE_1_O => s_trigger_active
    );
  -- Interfaces

  JTAG_interface_inst : if G_UART_ACTIVE = FALSE generate
    --! This module configures the JTAG interface.
    jtag_if_inst : entity work.jtag_if
      port map
      (
        CLK_I         => CLK_I,
        RST_N_I       => s_rst_n,
        EN_I          => '1',
        DATA_IN_O     => s_data_i,
        DATA_IN_OK_O  => s_data_ok_i,
        DATA_OUT_I    => s_data_o,
        DATA_OUT_OK_I => s_data_ok_o
      );

  elsif G_UART_ACTIVE = TRUE generate

      --! This module configures the UART interface.
      uart_if_inst : entity work.uart_if
        generic map(
          G_BAUDS => G_UART_BAUDS
        )
        port map
        (
          CLK_I     => CLK_I,
          RST_N_I   => s_rst_n,
          EN_I      => '1',
          DATA_I    => s_data_i,
          DATA_OK_I => s_data_ok_i,
          DATA_O    => s_data_o,
          DATA_OK_O => s_data_ok_o,
          RX_I      => UART_RX_I,
          TX_O      => UART_TX_O
        );

    end generate;
  end architecture;