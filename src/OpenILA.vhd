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
    G_WIDTH_32 : integer := 32
  );
  port (
    CLK_I     : in std_logic;
    DATA_I_1  : in std_logic_vector(G_WIDTH_1 - 1 downto 0);
    DATA_I_2  : in std_logic_vector(G_WIDTH_2 - 1 downto 0);
    DATA_I_3  : in std_logic_vector(G_WIDTH_3 - 1 downto 0);
    DATA_I_4  : in std_logic_vector(G_WIDTH_4 - 1 downto 0);
    DATA_I_5  : in std_logic_vector(G_WIDTH_5 - 1 downto 0);
    DATA_I_6  : in std_logic_vector(G_WIDTH_6 - 1 downto 0);
    DATA_I_7  : in std_logic_vector(G_WIDTH_7 - 1 downto 0);
    DATA_I_8  : in std_logic_vector(G_WIDTH_8 - 1 downto 0);
    DATA_I_9  : in std_logic_vector(G_WIDTH_9 - 1 downto 0);
    DATA_I_10 : in std_logic_vector(G_WIDTH_10 - 1 downto 0);
    DATA_I_11 : in std_logic_vector(G_WIDTH_11 - 1 downto 0);
    DATA_I_12 : in std_logic_vector(G_WIDTH_12 - 1 downto 0);
    DATA_I_13 : in std_logic_vector(G_WIDTH_13 - 1 downto 0);
    DATA_I_14 : in std_logic_vector(G_WIDTH_14 - 1 downto 0);
    DATA_I_15 : in std_logic_vector(G_WIDTH_15 - 1 downto 0);
    DATA_I_16 : in std_logic_vector(G_WIDTH_16 - 1 downto 0);
    DATA_I_17 : in std_logic_vector(G_WIDTH_17 - 1 downto 0);
    DATA_I_18 : in std_logic_vector(G_WIDTH_18 - 1 downto 0);
    DATA_I_19 : in std_logic_vector(G_WIDTH_19 - 1 downto 0);
    DATA_I_20 : in std_logic_vector(G_WIDTH_20 - 1 downto 0);
    DATA_I_21 : in std_logic_vector(G_WIDTH_21 - 1 downto 0);
    DATA_I_22 : in std_logic_vector(G_WIDTH_22 - 1 downto 0);
    DATA_I_23 : in std_logic_vector(G_WIDTH_23 - 1 downto 0);
    DATA_I_24 : in std_logic_vector(G_WIDTH_24 - 1 downto 0);
    DATA_I_25 : in std_logic_vector(G_WIDTH_25 - 1 downto 0);
    DATA_I_26 : in std_logic_vector(G_WIDTH_26 - 1 downto 0);
    DATA_I_27 : in std_logic_vector(G_WIDTH_27 - 1 downto 0);
    DATA_I_28 : in std_logic_vector(G_WIDTH_28 - 1 downto 0);
    DATA_I_29 : in std_logic_vector(G_WIDTH_29 - 1 downto 0);
    DATA_I_30 : in std_logic_vector(G_WIDTH_30 - 1 downto 0);
    DATA_I_31 : in std_logic_vector(G_WIDTH_31 - 1 downto 0);
    DATA_I_32 : in std_logic_vector(G_WIDTH_32 - 1 downto 0)

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
  OPENILA_FIFO_inst : entity work.OPENILA_FIFO
    generic map(
      G_PROBES   => G_PROBES,
      G_SAMPLES  => G_SAMPLES,
      G_WIDTH_1  => G_WIDTH_1,
      G_WIDTH_2  => G_WIDTH_2,
      G_WIDTH_3  => G_WIDTH_3,
      G_WIDTH_4  => G_WIDTH_4,
      G_WIDTH_5  => G_WIDTH_5,
      G_WIDTH_6  => G_WIDTH_6,
      G_WIDTH_7  => G_WIDTH_7,
      G_WIDTH_8  => G_WIDTH_8,
      G_WIDTH_9  => G_WIDTH_9,
      G_WIDTH_10 => G_WIDTH_10,
      G_WIDTH_11 => G_WIDTH_11,
      G_WIDTH_12 => G_WIDTH_12,
      G_WIDTH_13 => G_WIDTH_13,
      G_WIDTH_14 => G_WIDTH_14,
      G_WIDTH_15 => G_WIDTH_15,
      G_WIDTH_16 => G_WIDTH_16,
      G_WIDTH_17 => G_WIDTH_17,
      G_WIDTH_18 => G_WIDTH_18,
      G_WIDTH_19 => G_WIDTH_19,
      G_WIDTH_20 => G_WIDTH_20,
      G_WIDTH_21 => G_WIDTH_21,
      G_WIDTH_22 => G_WIDTH_22,
      G_WIDTH_23 => G_WIDTH_23,
      G_WIDTH_24 => G_WIDTH_24,
      G_WIDTH_25 => G_WIDTH_25,
      G_WIDTH_26 => G_WIDTH_26,
      G_WIDTH_27 => G_WIDTH_27,
      G_WIDTH_28 => G_WIDTH_28,
      G_WIDTH_29 => G_WIDTH_29,
      G_WIDTH_30 => G_WIDTH_30,
      G_WIDTH_31 => G_WIDTH_31,
      G_WIDTH_32 => G_WIDTH_32
    )
    port map
    (
      CLK_I   => CLK_I,
      RST_N_I => s_rst_n,
      EN_I    => EN_I,
      DATA_I  => DATA_I,
      STOP_I  => STOP_I
    );
  OpenILA_controller_inst : entity work.OpenILA_controller
    port map
    (
      CLK_I   => CLK_I,
      RST_N_I => s_rst_n,
      EN_I    => EN_I
    );

end architecture;