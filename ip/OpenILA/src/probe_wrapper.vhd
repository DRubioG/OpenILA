library ieee;
use ieee.std_logic_1164.all;
use ieee.math_real.all;

entity probe_wrapper is
  generic (
    G_PROBES  : integer range 1 to 32;
    G_SAMPLES : integer range 64 to 2 ** 20;

    G_WIDTH_1 : integer := 32;
    G_WIDTH_2 : integer := 32
    -- G_WIDTH_3  : integer := 32;
    -- G_WIDTH_4  : integer := 32;
    -- G_WIDTH_5  : integer := 32;
    -- G_WIDTH_6  : integer := 32;
    -- G_WIDTH_7  : integer := 32;
    -- G_WIDTH_8  : integer := 32;
    -- G_WIDTH_9  : integer := 32;
    -- G_WIDTH_10 : integer := 32;
    -- G_WIDTH_11 : integer := 32;
    -- G_WIDTH_12 : integer := 32;
    -- G_WIDTH_13 : integer := 32;
    -- G_WIDTH_14 : integer := 32;
    -- G_WIDTH_15 : integer := 32;
    -- G_WIDTH_16 : integer := 32;
    -- G_WIDTH_17 : integer := 32;
    -- G_WIDTH_18 : integer := 32;
    -- G_WIDTH_19 : integer := 32;
    -- G_WIDTH_20 : integer := 32;
    -- G_WIDTH_21 : integer := 32;
    -- G_WIDTH_22 : integer := 32;
    -- G_WIDTH_23 : integer := 32;
    -- G_WIDTH_24 : integer := 32;
    -- G_WIDTH_25 : integer := 32;
    -- G_WIDTH_26 : integer := 32;
    -- G_WIDTH_27 : integer := 32;
    -- G_WIDTH_28 : integer := 32;
    -- G_WIDTH_29 : integer := 32;
    -- G_WIDTH_30 : integer := 32;
    -- G_WIDTH_31 : integer := 32;
    -- G_WIDTH_32 : integer := 32
  );
  port (
    CLK_I       : in std_logic;
    RST_N_I     : in std_logic;
    EN_I        : in std_logic;
    DATA_PROBE1 : in std_logic_vector(G_WIDTH_1 - 1 downto 0);
    DATA_PROBE2 : in std_logic_vector(G_WIDTH_2 - 1 downto 0);
    POSITION_I  : in std_logic_vector(integer(SQRT(real(G_SAMPLES))) - 1 downto 0);

    TRIGGER_TYPE1    : in std_logic_vector(2 downto 0);
    TRIGGER_TYPE2    : in std_logic_vector(2 downto 0);
    TRIGGER_VALUE1   : in std_logic_vector(G_WIDTH_1 - 1 downto 0);
    TRIGGER_VALUE2   : in std_logic_vector(G_WIDTH_2 - 1 downto 0);
    TRIGGER_START_I  : in std_logic;
    TRIGGER_STOP_I   : in std_logic;
    TRIGGER_FINISH_O : out std_logic;
    READ_I           : in std_logic;

    DATA1_O : out std_logic_vector(G_WIDTH_1-1 downto 0);

    TRIGGER_ACTIVE_1_O : out std_logic
  );
end entity probe_wrapper;

architecture rtl of probe_wrapper is

begin
  probe1_inst : entity work.probe_individual
    generic map(
      G_SAMPLES     => G_SAMPLES,
      G_WIDTH_PROBE => G_WIDTH_1
    )
    port map
    (
      CLK_I            => CLK_I,
      RST_N_I          => RST_N_I,
      EN_I             => EN_I,
      DATA_I           => DATA_PROBE1,
      POSITION_I       => POSITION_I,
      TRIGGER_TYPE_I   => TRIGGER_TYPE1,
      TRIGGER_VALUE_I  => TRIGGER_VALUE1,
      TRIGGER_START_I  => TRIGGER_START_I,
      TRIGGER_STOP_I   => TRIGGER_STOP_I,
      TRIGGER_FINISH_O => TRIGGER_FINISH_O,
      READ_I           => READ_I,
      DATA_O           => DATA1_O,
      TRIGGER_ACTIVE_O => TRIGGER_ACTIVE_1_O
    );

  -- gen_2 : if G_PROBES >= 2 generate

  --   probe2_inst : entity work.probe_individual
  --     generic map(
  --       G_SAMPLES     => G_SAMPLES,
  --       G_WIDTH_PROBE => G_WIDTH_2
  --     )
  --     port map
  --     (
  --       CLK_I            => CLK_I,
  --       RST_N_I          => RST_N_I,
  --       EN_I             => EN_I,
  --       DATA_I           => DATA_PROBE2,
  --       POSITION_I       => POSITION_I,
  --       TRIGGER_TYPE_I   => TRIGGER_TYPE2,
  --       TRIGGER_VALUE_I  => TRIGGER_VALUE2,
  --       TRIGGER_START_I  => TRIGGER_START_I,
  --       TRIGGER_STOP_I   => TRIGGER_STOP_I,
  --       TRIGGER_FINISH_O => TRIGGER_FINISH_O,
  --       READ_I           => READ_I
  --     );

  -- end generate;

end architecture;