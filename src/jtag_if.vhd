library ieee;
use ieee.std_logic_1164.all;

Library UNISIM;
use UNISIM.vcomponents.all;

entity jtag_if is
  port (
    DATA_IN_O : out std_logic_vector(7 downto 0);
    DATA_IN_OK_O : out std_logic;
    DATA_OUT_I : in std_logic_vector(7 downto 0);
    DATA_OUT_OK_I : in std_logic;


-- JTAG Interface
    RESET   : out std_logic;
    TCK     : out std_logic;
    TMS     : out std_logic;
    TDI     : out std_logic;
    TDO     : in std_logic

  );
end entity jtag_if;

architecture rtl of jtag_if is

begin

  -- BSCANE2: Boundary-Scan User Instruction
  --          7 Series
  -- Xilinx HDL Language Template, version 2025.2

  BSCANE2_inst : BSCANE2
  generic map(
    JTAG_CHAIN => 1 -- Value for USER command.
  )
  port map
  (
    CAPTURE => CAPTURE, -- 1-bit output: CAPTURE output from TAP controller.
    DRCK    => DRCK, -- 1-bit output: Gated TCK output. When SEL is asserted, DRCK toggles when CAPTURE or
    -- SHIFT are asserted.

    RESET   => RESET, -- 1-bit output: Reset output for TAP controller.
    RUNTEST => RUNTEST, -- 1-bit output: Output asserted when TAP controller is in Run Test/Idle state.
    SEL     => SEL, -- 1-bit output: USER instruction active output.
    SHIFT   => SHIFT, -- 1-bit output: SHIFT output from TAP controller.
    TCK     => TCK, -- 1-bit output: Test Clock output. Fabric connection to TAP Clock pin.
    TDI     => TDI, -- 1-bit output: Test Data Input (TDI) output from TAP controller.
    TMS     => TMS, -- 1-bit output: Test Mode Select output. Fabric connection to TAP.
    UPDATE  => UPDATE, -- 1-bit output: UPDATE output from TAP controller
    TDO     => TDO -- 1-bit input: Test Data Output (TDO) input for USER function.
  );

  -- End of BSCANE2_inst instantiation

end architecture;