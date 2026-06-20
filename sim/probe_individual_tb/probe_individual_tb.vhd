
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

entity probe_individual_tb is
end;

architecture bench of probe_individual_tb is
  -- Clock period
  constant C_CLK_PERIOD : time := 5 ns;
  -- Generics
  constant G_SAMPLES     : integer := 128;
  constant G_WIDTH_PROBE : integer := 8;
  -- Ports
  signal CLK_I            : std_logic := '0';
  signal RST_N_I          : std_logic;
  signal EN_I             : std_logic;
  signal DATA_I           : std_logic_vector(G_WIDTH_PROBE - 1 downto 0);
  signal POSITION_I       : std_logic_vector(integer(SQRT(real(G_SAMPLES))) - 1 downto 0);
  signal TRIGGER_TYPE_I   : std_logic_vector(2 downto 0);
  signal TRIGGER_VALUE_I  : std_logic_vector(G_WIDTH_PROBE - 1 downto 0);
  signal TRIGGER_START_I  : std_logic;
  signal r_cont           : integer range 0 to 2 ** 5;
  signal TRIGGER_FINISH_O : std_logic;
  signal READ_I           : std_logic;
begin

  probe_individual_inst : entity work.probe_individual
    generic map(
      G_SAMPLES     => G_SAMPLES,
      G_WIDTH_PROBE => G_WIDTH_PROBE
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
      TRIGGER_FINISH_O => TRIGGER_FINISH_O,
      READ_I           => READ_I
    );

  CLK_I <= not CLK_I after C_CLK_PERIOD/2;

  RST_N_I <= '0', '1' after 50 ns;

  EN_I    <= '1';

  DATA_I  <= std_logic_vector(to_unsigned(r_cont, DATA_I'length));

  POSITION_I <= std_logic_vector(to_unsigned(0, POSITION_I'length));

  TRIGGER_VALUE_I <= std_logic_vector(to_unsigned(5, TRIGGER_VALUE_I'length));

  process begin
    r_cont <= 0;
    wait until RST_N_I = '1';
    while True loop
      wait until rising_edge(CLK_I);
      r_cont <= r_cont + 1;
      if r_cont >= 2 ** 5 - 1 then
        r_cont <= 0;
      end if;
    end loop;
    -- report "Finish simulation" severity FAILURE;
  end process;

  TRIGGER_TYPE_I <= "001";
  --   READ_I         <= '0';

  process begin
    TRIGGER_START_I <= '0';
    wait for 200 ns;
    wait until rising_edge(CLK_I);
    TRIGGER_START_I <= '1';
    wait until rising_edge(CLK_I);
    TRIGGER_START_I <= '0';
    wait;
  end process;
  
  process begin
    READ_I <= '0';
    wait until TRIGGER_FINISH_O = '1';
    wait for 20*C_CLK_PERIOD;
    READ_I <= '1';
    wait;
  end process;

end;