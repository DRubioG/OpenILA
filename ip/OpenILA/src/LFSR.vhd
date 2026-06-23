library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity LFSR is
  generic (
    --! Number of sample per probe.
    G_SAMPLES : integer := 1024;
    --! Data width.
    G_WIDTH : integer := 32
  );
  port (
    --! Input clock of this module.
    CLK_I : in std_logic;
    --! Input reset of this module. Low level active.
    RST_N_I : in std_logic;
    --! Input enable of this module. High level active.
    EN_I : in std_logic;
    --! This is the stop signal. High level active.
    STOP_I : in std_logic;
    --! This is the read port. High level active.
    READ_I : in std_logic;
    --! This is the input data of the probe.
    DATA_I : in std_logic_vector(G_WIDTH - 1 downto 0);
    --! This is the output data of the LFSR.
    DATA_O : out std_logic_vector(G_WIDTH - 1 downto 0);
    --! This indicates that the finish the reading.
    FINISH_READ_O : out std_logic
  );
end entity LFSR;

architecture rtl of LFSR is

  --! This type is array of the samples.
  type t_lfsr is array (0 to G_SAMPLES - 1) of std_logic_vector(G_WIDTH - 1 downto 0);

  --! This is the register between epoch.
  signal r_data : t_lfsr;
  --! This is the counter of the trigger of the LFSR.
  signal r_cont : integer range 0 to G_SAMPLES;

  --! Input delays 
  signal input_d1, input_d2, input_d3, input_d4 : std_logic_vector(G_WIDTH-1 downto 0);
begin

--! This process delays the input data of the LFSR to synchrnizes with the control signals
--! of the controller.
INPUT_DELAY : process (CLK_I)
  begin
    if rising_edge(CLK_I) then
      if RST_N_I = '0' then
        input_d1 <= (others => '0') ;
        input_d2 <= (others => '0') ;
        input_d3 <= (others => '0') ;
        input_d4 <= (others => '0') ;
      else
        input_d1 <= DATA_I;
        input_d2 <= input_d1;
        input_d3 <= input_d2;
        input_d4 <= input_d3;
      end if;
    end if;
  end process;




  --! This process is the LFSR.
  LFSR_PROCESS : process (CLK_I)
  begin
    if rising_edge(CLK_I) then
      if RST_N_I = '0' then
        r_data <= (others => (others => '0'));
        DATA_O <= (others => '0');
      elsif EN_I = '1' then
        if STOP_I = '0' then
          r_data(0) <= input_d4;
          for i in 0 to G_SAMPLES - 2 loop
            r_data(i + 1) <= r_data(i);
          end loop;
        elsif READ_I = '1' then
          DATA_O <= r_data(G_SAMPLES - 1);
          for i in 0 to G_SAMPLES - 2 loop
            r_data(i + 1) <= r_data(i);
          end loop;
        end if;
      end if;
    end if;
  end process;

  --! This process indicates the finish of the LFSR read.
  FINISH_READ : process (CLK_I)
  begin
    if rising_edge(CLK_I) then
      if RST_N_I = '0' then
        FINISH_READ_O <= '0';
        r_cont        <= 0;
      elsif EN_I = '1' then
        r_cont        <= 0;
        FINISH_READ_O <= '0';
        if READ_I = '1' then
          r_cont <= r_cont + 1;
          if r_cont >= G_SAMPLES - 1 then
            r_cont        <= 0;
            FINISH_READ_O <= '1';
          end if;
        end if;
      end if;
    end if;
  end process;

end architecture;
