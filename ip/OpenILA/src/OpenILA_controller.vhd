
library ieee;
use ieee.std_logic_1164.all;

entity OpenILA_controller is
  generic (
    --! Width of the first probe.
    G_WIDTH_1 : integer := 32
  );
  port (
    --! Input clock of this module.
    CLK_I            : in std_logic;
    --! Input reset of this module. Low level active.
    RST_N_I          : in std_logic;
    --! Input enable of this mdoule. High level active.
    EN_I             : in std_logic;
    --! Input data from the interface.
    DATA_I           : in std_logic_vector(7 downto 0);
    --! Indicator of new input data from the interface. High level active.
    DATA_OK_I        : in std_logic;
    --! Output data to the interface.
    DATA_O           : out std_logic_vector(7 downto 0);
    --! Indicator of new output data to the interface.
    DATA_OK_O        : out std_logic;
    --! Trigger value of the probe 1. High level active.
    TRIGGER_VALUE_PROBE1    : out std_logic_vector(G_WIDTH_1 - 1 downto 0);
    --! Trigger start indicator. High level active.
    TRIGGER_START_O  : out std_logic;
    --! Trigger stop indicator. High level active.
    TRIGGER_STOP_O   : out std_logic;
    --! Trigger finish indicator.  High level active.
    TRIGGER_FINISH_O : out std_logic;
    --! Read indicator, this port asks the other modules to
    --! return the probe data. High level active.
    READ_O           : out std_logic;
    --! Data from the probe 1.
    DATA1_I          : in std_logic_vector(G_WIDTH_1 - 1 downto 0);
    --! Indicator if the probe is active. High level active.
    TRIGGER_ACTIVE_I : in std_logic
  );
end entity OpenILA_controller;

architecture rtl of OpenILA_controller is

begin


end architecture;