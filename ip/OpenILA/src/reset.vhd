library ieee;
use ieee.std_logic_1164.all;

library UNISIM;
use UNISIM.vcomponents.all;

entity reset is
  port (
    CLK_I : in std_logic;
    RST_N_O : out std_logic
  );
end entity reset;

architecture rtl of reset is

begin

  -- STARTUPE2: STARTUP Block
  --            7 Series
  -- Xilinx HDL Language Template, version 2021.2

  STARTUPE2_inst : STARTUPE2
  generic map(
    PROG_USR      => "FALSE", -- Activate program event security feature. Requires encrypted bitstreams.
    SIM_CCLK_FREQ => 0.0 -- Set the Configuration Clock Frequency(ns) for simulation.
  )
  port map
  (
    CFGCLK    => open, -- 1-bit output: Configuration main clock output
    CFGMCLK   => open, -- 1-bit output: Configuration internal oscillator clock output
    EOS       => RST_N_O, -- 1-bit output: Active high output signal indicating the End Of Startup.
    PREQ      => open, -- 1-bit output: PROGRAM request to fabric output
    CLK       => '0', -- 1-bit input: User start-up clock input
    GSR       => '0', -- 1-bit input: Global Set/Reset input (GSR cannot be used for the port name)
    GTS       => '0', -- 1-bit input: Global 3-state input (GTS cannot be used for the port name)
    KEYCLEARB => '0', -- 1-bit input: Clear AES Decrypter Key input from Battery-Backed RAM (BBRAM)
    PACK      => '0', -- 1-bit input: PROGRAM acknowledge input
    USRCCLKO  => '0', -- 1-bit input: User CCLK input
    -- For Zynq-7000 devices, this input must be tied to GND
    USRCCLKTS => '0', -- 1-bit input: User CCLK 3-state enable input
    -- For Zynq-7000 devices, this input must be tied to VCC
    USRDONEO  => '0', -- 1-bit input: User DONE pin output control
    USRDONETS => '0' -- 1-bit input: User DONE 3-state enable output
  );

  -- End of STARTUPE2_inst instantiation

end architecture;