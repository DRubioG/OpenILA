
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity trigger_controller_tb is
end;

architecture bench of trigger_controller_tb is
  -- Clock period
  constant C_CLK_PERIOD : time := 5 ns;
  -- Generics
  constant G_SAMPLES : integer := 64;
  constant G_WIDTH   : integer := 8;
  -- Ports
  signal CLK_I            : std_logic := '0';
  signal RST_N_I          : std_logic;
  signal EN_I             : std_logic;
  signal DATA_I           : std_logic_vector(G_WIDTH - 1 downto 0);
  signal POSITION_I       : std_logic_vector(G_WIDTH - 1 downto 0);
  signal TRIGGER_TYPE_I   : std_logic_vector(2 downto 0);
  signal TRIGGER_VALUE_I  : std_logic_vector(G_WIDTH - 1 downto 0);
--   signal TRIGGER_OK_I     : std_logic;
  signal TRIGGER_START_I  : std_logic;
  signal READ_I           : std_logic;
  signal TRIGGER_ACTIVE_O : std_logic;
  signal TRIGGER_FINISH_O : std_logic;

  signal r_cont : integer range 0 to 2 ** 5;

begin

  trigger_controller_inst : entity work.trigger_controller
	generic map(
	  G_SAMPLES => G_SAMPLES,
	  G_WIDTH   => G_WIDTH
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
	--   TRIGGER_OK_I     => TRIGGER_OK_I,
	  TRIGGER_START_I  => TRIGGER_START_I,
	  READ_I           => READ_I,
	  TRIGGER_ACTIVE_O => TRIGGER_ACTIVE_O,
	  TRIGGER_FINISH_O => TRIGGER_FINISH_O
	);

  CLK_I <= not CLK_I after C_CLK_PERIOD/2;

  RST_N_I <= '0', '1' after 50 ns;
  EN_I    <= '1';
  DATA_I  <= std_logic_vector(to_unsigned(r_cont, DATA_I'length));

  POSITION_I <= (POSITION_I'length - 1 => '0', POSITION_I'length - 2 => '0', POSITION_I'length - 3 => '0', POSITION_I'length - 4 => '0', POSITION_I'length - 5 => '0', others => '1');

  TRIGGER_VALUE_I <= std_logic_vector(to_unsigned((2 ** 5 - 1)/2, TRIGGER_VALUE_I'length));

  process begin
	r_cont <= 0;
	wait until RST_N_I = '1';
	while r_cont < 2 ** 5 - 1 loop
	  wait until rising_edge(CLK_I);
	  r_cont <= r_cont + 1;
	end loop;
	report "Finish simulation" severity FAILURE;
  end process;

  TRIGGER_TYPE_I <= "010";
  READ_I         <= '0';

  process begin
    TRIGGER_START_I <= '0';
    wait until rising_edge(CLK_I);
    TRIGGER_START_I <= '1';
    wait;

  end process;
end;