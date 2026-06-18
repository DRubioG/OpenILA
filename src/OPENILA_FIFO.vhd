library ieee;
use ieee.std_logic_1164.all;


entity OPENILA_FIFO is
  generic (
    G_PROBES  : integer range 1 to 32;
    G_SAMPLES : integer range 64 to 2 ** 20;

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
    G_WIDTH_32 : integer := 32
  );
  port (
    CLK_I   : in std_logic;
    RST_N_I : in std_logic;
    EN_I    : in std_logic;
    DATA_I  : in std_logic;
    STOP_I  : in std_logic;

    DATA_1_I : in std_logic_vector(G_WIDTH_1-1 downto 0);
    DATA_2_I : in std_logic_vector(G_WIDTH_2-1 downto 0)

  );
end entity OPENILA_FIFO;

architecture rtl of OPENILA_FIFO is

begin

  LFSR_inst : entity work.LFSR
  generic map (
    G_FIFO_SIZE => G_SAMPLES,
    G_WIDTH => G_WIDTH_1
  )
  port map (
    CLK_I => CLK_I,
    RST_N_I => RST_N_I,
    EN_I => EN_I,
    STOP_I => STOP_I,
    READ_I => READ_I,
    DATA_I => DATA_1_I,
    DATA_O => DATA_O,
    FINISH_READ_O => DATA_OK_O
  );


  gen_2 : if G_PROBES >= 2 generate

    FIFO_inst : entity work.LFSR
      generic map(
        G_FIFO_SIZE => G_SAMPLES,
        G_WIDTH     => G_WIDTH_2
      )
      port map
      (
        CLK_I     => CLK_I,
        RST_N_I   => RST_N_I,
        EN_I      => EN_I,
        STOP_I    => STOP_I,
        READ_I    => READ_I,
        DATA_I    => DATA_2_I,
        DATA_O    => DATA_O,
        FINISH_READ_O => DATA_OK_O
      );
  end generate;

end architecture;