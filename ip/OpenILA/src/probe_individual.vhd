library ieee;
use ieee.std_logic_1164.all;
use ieee.math_real.all;

entity probe_individual is
  generic (
    --! Number of samples per probe.
    G_SAMPLES : integer := 64;
    --! Data width.
    G_WIDTH_PROBE : integer := 8
  );
  port (
    --! Input clock of this module.
    CLK_I : in std_logic;
    --! Input reset of this module. Low level active.
    RST_N_I : in std_logic;
    --! Input enable of this module. High level active.
    EN_I : in std_logic;
    --! ILA input data.
    DATA_I : in std_logic_vector(G_WIDTH_PROBE - 1 downto 0);
    --! Position of the trigger data.
    POSITION_I : in std_logic_vector(integer(SQRT(real(G_SAMPLES))) - 1 downto 0);
    --! Type of the trigger for stop the ILA.
    TRIGGER_TYPE_I : in std_logic_vector(2 downto 0);
    --! Trigger value.
    TRIGGER_VALUE_I : in std_logic_vector(G_WIDTH_PROBE - 1 downto 0);
    --! Start trigger. High level active.
    TRIGGER_START_I : in std_logic;
    --! This port indicates to this probe to stop its operation. High level active.
    TRIGGER_STOP_I : in std_logic;
    --! This is the trigger indicator. High level active.
    TRIGGER_FINISH_O : out std_logic;
    --! This is the read asking port. High level active.
    READ_I : in std_logic;

    DATA_O : out std_logic_vector(G_WIDTH_PROBE-1 downto 0);

    TRIGGER_ACTIVE_O : out std_logic

  );
end entity probe_individual;

architecture rtl of probe_individual is

  --! This signal connects the finish of the trigger
  --! with the stop of the LFSR.
  signal s_trigger_finish : std_logic;

  --! This signal  connects the read port of the controller with the 
  --! LFSR read port.
  signal s_read : std_logic;

begin

  --! This is the Trigger output indicator.
  TRIGGER_FINISH : TRIGGER_FINISH_O <= s_trigger_finish;
  --! This instantation saves the samples of the probe
  --! and returns its values when it is asked.
  LFSR_inst : entity work.LFSR
    generic map(
      G_SAMPLES => G_SAMPLES,
      G_WIDTH   => G_WIDTH_PROBE
    )
    port map
    (
      CLK_I         => CLK_I,
      RST_N_I       => RST_N_I,
      EN_I          => EN_I,
      STOP_I        => s_trigger_finish,
      READ_I        => s_read,
      DATA_I        => DATA_I,
      DATA_O        => DATA_O,
      FINISH_READ_O => open
    );

  --! This instantates the controller get the samples.
  trigger_controller_inst : entity work.trigger_controller
    generic map(
      G_SAMPLES => G_SAMPLES,
      G_WIDTH   => G_WIDTH_PROBE
    )
    port map
    (
      CLK_I            => CLK_I,
      RST_N_I          => RST_N_I,
      EN_I             => EN_I,
      DATA_I           => DATA_I,
      POSITION_I       => POSITION_I,
      TRIGGER_TYPE_I   => TRIGGER_TYPE_I,
      TRIGGER_VALUE_I  => TRIGGER_VALUE_I,
      TRIGGER_START_I  => TRIGGER_START_I,
      TRIGGER_STOP_I   => TRIGGER_STOP_I,
      READ_I           => READ_I,
      READ_O           => s_read,
      TRIGGER_ACTIVE_O => TRIGGER_ACTIVE_O,
      TRIGGER_FINISH_O => s_trigger_finish
    );

end architecture;