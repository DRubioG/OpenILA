library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity LFSR is
  generic (
    G_FIFO_SIZE : integer := 1024;
    G_WIDTH     : integer := 32
  );
  port (
    CLK_I         : in std_logic;
    RST_N_I       : in std_logic;
    EN_I          : in std_logic;
    STOP_I        : in std_logic;
    READ_I        : in std_logic;
    DATA_I        : in std_logic_vector(G_WIDTH - 1 downto 0);
    DATA_O        : out std_logic_vector(G_WIDTH - 1 downto 0);
    FINISH_READ_O : out std_logic
  );
end entity LFSR;

architecture rtl of LFSR is

  type t_fifo is array (0 to G_FIFO_SIZE - 1) of std_logic_vector(G_WIDTH - 1 downto 0);

  signal r_data : t_fifo;

  signal r_cont : integer range 0 to G_FIFO_SIZE;
begin
  process (CLK_I)
  begin
    if rising_edge(CLK_I) then
      if RST_N_I = '0' then
        r_data <= (others => (others => '0'));
      elsif EN_I = '1' then
        if STOP_I = '0' then
          r_data(0) <= DATA_I;
          for i in 0 to G_FIFO_SIZE - 1 loop
            r_data(i + 1) <= r_data(0);
          end loop;
        elsif READ_I = '1' then
          DATA_O <= r_data(G_FIFO_SIZE);
          for i in 0 to G_FIFO_SIZE - 1 loop
            r_data(i + 1) <= r_data(i);
          end loop;
        end if;
      end if;
    end if;
  end process;

  process (CLK_I)
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
          if r_cont >= G_FIFO_SIZE - 1 then
            r_cont        <= 0;
            FINISH_READ_O <= '1';
          end if;
        end if;
      end if;
    end if;
  end process;

end architecture;
