library ieee;
use ieee.std_logic_1164.all;

library UNISIM;
use UNISIM.vcomponents.all;

entity jtag_if is
  port (
    --! Input clock of this module.
    CLK_I         : in std_logic;
    --! Input reset of this module. Low level active.
    RST_N_I       : in std_logic;
    --! Input enable of this module. High level active.
    EN_I          : in std_logic;
    --! Data from the JTAG.
    DATA_IN_O     : out std_logic_vector(7 downto 0);
    --! Indicator of a new data in _DATA_IN_O_.
    DATA_IN_OK_O  : out std_logic;
    --! Data to send by JTAG.
    DATA_OUT_I    : in std_logic_vector(7 downto 0);
    --! Indicator of a new data in _DATA_OUT_I_.
    DATA_OUT_OK_I : in std_logic
  );
end entity jtag_if;

architecture rtl of jtag_if is
  -- JTAG Interface

  --! Reset signal from the JTAG.
  signal s_RESET : std_logic;
  --! Clock signal from the JTAG.
  signal s_TCK   : std_logic;
  --! TMS signal from the JTAG.
  signal s_TMS   : std_logic;
  --! Input data signal from the JTAG.
  signal s_TDI   : std_logic;
  --! Output data signal to the JTAG.
  signal s_TDO   : std_logic;

  --! This register gets the data using a LFSR.
  signal r_data : std_logic_vector(7 downto 0);
--! This is the rising edge of the TCK indicator.
  signal s_rise_edge_TCK : std_logic;
  --! This signal indicates the state of the JTAG.
  signal s_DRCK          : std_logic;

begin

  --! This assigns the data from the JTAG input to the outside port.
  DATA_IN_ASSIGN : DATA_IN_O <= r_data;

  --! This process concatenates the input data to get the 
  --! information from the JTAG interface. It is used an LFSR.
  DATA_CATCHED : process (CLK_I)
  begin
    if rising_edge(CLK_I) then
      if RST_N_I = '0' then
        r_data <= (others => '0');
      elsif EN_I = '1' then
        if s_rise_edge_TCK = '1' then
          if s_DRCK = '1' then
            r_data <= r_data(6 downto 0) & s_TDI;
          end if;
        end if;
      end if;
    end if;
  end process;

--! This module indicates when the TCK port of the JTAG generates an rising edge.
--! It is used as CDC.
  TCK_edge_detector_inst : entity work.edge_detector
    port map
    (
      CLK_I          => CLK_I,
      INPUT_DETECTOR => s_TCK,
      RISING_EDGE_O  => s_rise_edge_TCK,
      FALLING_EDGE_O => open,
      EDGES_O        => open
    );
--! This module is the interface with the JTAG, this receives the commands and returns the ILA data.
  BSCANE2_inst : BSCANE2
  generic map(
    JTAG_CHAIN => 1 -- Value for USER command.
  )
  port map
  (
    CAPTURE => CAPTURE, -- 1-bit output: CAPTURE output from TAP controller.
    DRCK    => s_DRCK, -- 1-bit output: Gated TCK output. When SEL is asserted, DRCK toggles when CAPTURE or
    -- SHIFT are asserted.

    RESET   => s_RESET, -- 1-bit output: Reset output for TAP controller.
    RUNTEST => RUNTEST, -- 1-bit output: Output asserted when TAP controller is in Run Test/Idle state.
    SEL     => SEL, -- 1-bit output: USER instruction active output.
    SHIFT   => SHIFT, -- 1-bit output: SHIFT output from TAP controller.
    TCK     => s_TCK, -- 1-bit output: Test Clock output. Fabric connection to TAP Clock pin.
    TDI     => s_TDI, -- 1-bit output: Test Data Input (TDI) output from TAP controller.
    TMS     => s_TMS, -- 1-bit output: Test Mode Select output. Fabric connection to TAP.
    UPDATE  => UPDATE, -- 1-bit output: UPDATE output from TAP controller
    TDO     => s_TDO -- 1-bit input: Test Data Output (TDO) input for USER function.
  );

end architecture;