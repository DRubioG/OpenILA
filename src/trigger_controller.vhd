--! TRIGGER_TYPE_I
--! ==
--! Operations of the controller.
--! | Constant | Operation | Value |
--! |----------|-----------|-------|
--! | C_TRIGGER_EQUAL_COMMAND       | =   | 001 |
--! | C_TRIGGER_NOT_EQUAL_COMMAND   | !=  | 010 |
--! | C_TRIGGER_LESS_COMMAND        | <   | 011 |
--! | C_TRIGGER_LESS_EQUAL_COMMAND  | <=  | 100 |
--! | C_TRIGGER_MORE_COMMAND        | >   | 101 |
--! | C_TRIGGER_MORE_EQUAL_COMMAND  | >=  | 110 |

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

entity trigger_controller is
  generic (
    --! Number of samples per probe.
    G_SAMPLES : integer := 64;
    --! Data width.
    G_WIDTH   : integer := 8
  );
  port (
    --! Input clock of this module.
    CLK_I : in std_logic;
    --! Input reset of this module. Low level active.
    RST_N_I : in std_logic;
    --! Input enable of this module. High level active.
    EN_I : in std_logic;
    --! ILA input data.
    DATA_I : in std_logic_vector(G_WIDTH - 1 downto 0);
    --! Position of the trigger data.
    POSITION_I : in std_logic_vector(integer(SQRT(real(G_SAMPLES))) - 1 downto 0);
    --! Type of the trigger for stop the ILA.
    TRIGGER_TYPE_I : in std_logic_vector(2 downto 0);
    --! Trigger value.
    TRIGGER_VALUE_I : in std_logic_vector(G_WIDTH - 1 downto 0);
    --! New trigger value indicator. High level active.
    -- TRIGGER_OK_I : in std_logic;
    --! Start trigger. High level active.
    TRIGGER_START_I : in std_logic;
    --! Read indicator to get the ILA value. High level active.
    READ_I : in std_logic;
    --! This indicates if the trigger is active. High level active.
    TRIGGER_ACTIVE_O : out std_logic;
    --! This indicates that the trigger is active. High level active.
    TRIGGER_FINISH_O : out std_logic
  );
end entity trigger_controller;

architecture rtl of trigger_controller is

  --! This is the state machine that controlles this module.
  type fsm is (
    --! This state idles until the new operation.
    SM_IDLE,
    --! This state waits until the trigger jumps.
    SM_WAIT,
    --! This state waits until to export the ILA data.
    SM_FINISH,
    --! This state exports the ILA data.
    SM_SEND,
    
    SM_SAMPLES,
    --! This state finishes the ILA export.
    SM_STOP
  );
  --! This register gets the current state of the state machine.
  signal re_state : fsm;
  --! These signals get the trigger indicators.
  signal s_trigger, s_trigger_start : std_logic;
  --! This is the counter of the samples of the trigger.
  signal r_cont_pos, r_cont_send_samples : integer range 0 to G_SAMPLES;
  --! This is the integer conversion of the position input port.
  signal s_position : integer;

  --! This is the equal (=) command.
  constant C_TRIGGER_EQUAL_COMMAND : std_logic_vector(TRIGGER_TYPE_I'range) := "001";
  --! This is the not equal (!=) command.
  constant C_TRIGGER_NOT_EQUAL_COMMAND : std_logic_vector(TRIGGER_TYPE_I'range) := "010";
  --! This is the less (<) command.
  constant C_TRIGGER_LESS_COMMAND : std_logic_vector(TRIGGER_TYPE_I'range) := "011";
  --! This is the less or equal (<=) command.
  constant C_TRIGGER_LESS_EQUAL_COMMAND : std_logic_vector(TRIGGER_TYPE_I'range) := "100";
  --! This is the more (>) command.
  constant C_TRIGGER_MORE_COMMAND : std_logic_vector(TRIGGER_TYPE_I'range) := "101";
  --! This is the more or equal (>=) command.
  constant C_TRIGGER_MORE_EQUAL_COMMAND : std_logic_vector(TRIGGER_TYPE_I'range) := "110";
begin

  --! This process controls the state machine of this module.
  FSM_PROCESS : process (CLK_I)
  begin
    if rising_edge(CLK_I) then
      if RST_N_I = '0' then
        re_state <= SM_IDLE;

      elsif EN_I = '1' then
        case re_state is
          when SM_IDLE =>
            re_state <= SM_IDLE;
            if TRIGGER_START_I = '1' then
              re_state <= SM_WAIT;
            end if;

          when SM_WAIT =>
            re_state <= SM_WAIT;
            if s_trigger_start = '1' then
              re_state <= SM_SAMPLES;
            end if;

          when SM_SAMPLES =>
            re_state <= SM_SAMPLES;
            if s_trigger = '1' then
              re_state <= SM_FINISH;
            end if;

          when SM_FINISH =>
            re_state <= SM_FINISH;
            if READ_I = '1' then
              re_state <= SM_SEND;
            end if;

          when SM_SEND =>
            re_state <= SM_SEND;
            if r_cont_send_samples >= G_SAMPLES-1 then
              re_state <= SM_STOP;
            end if;

          when SM_STOP =>
            re_state <= SM_IDLE;

          when others =>
            re_state <= SM_IDLE;
        end case;
      end if;
    end if;
  end process;

  --! This process generates the trigger active signal.
  TRIGGER_ACTIVE : process (CLK_I)
  begin
    if rising_edge(CLK_I) then
      if RST_N_I = '0' then
        TRIGGER_ACTIVE_O <= '0';
      elsif EN_I = '1' then
        TRIGGER_ACTIVE_O <= '0';
        if re_state = SM_WAIT then
          TRIGGER_ACTIVE_O <= '1';
        end if;
      end if;
    end if;
  end process;

  --! This converts the position input port to integer.
  POSITION_INTEGER : s_position <= to_integer(unsigned(POSITION_I));

  --! This process counts the index value to stop the sampling.
  TRIGGER_SAMPLER : process (CLK_I)
  begin
    if rising_edge(CLK_I) then
      if RST_N_I = '0' then
        s_trigger <= '0';
        r_cont_pos      <= 0;
      elsif EN_I = '1' then
        s_trigger <= '0';
        if re_state = SM_SAMPLES then
          r_cont_pos <= r_cont_pos + 1;
          if r_cont_pos >= s_position - 4 and s_trigger = '0' then
            s_trigger <= '1';
          end if;
        end if;
      end if;
    end if;
  end process;

  --! This process compares the sample value with the trigger value.
  COMPARER_PROCESS : process (CLK_I)
  begin
    if rising_edge(CLK_I) then
      if RST_N_I = '0' then
        s_trigger_start <= '0';
      elsif EN_I = '1' then
        s_trigger_start <= '0';
        if re_state = SM_WAIT then
          if TRIGGER_TYPE_I = C_TRIGGER_EQUAL_COMMAND then
            if DATA_I = TRIGGER_VALUE_I then
              s_trigger_start <= '1';
            end if;
          elsif TRIGGER_TYPE_I = C_TRIGGER_NOT_EQUAL_COMMAND then
            if DATA_I /= TRIGGER_VALUE_I then
              s_trigger_start <= '1';
            end if;
          elsif TRIGGER_TYPE_I = C_TRIGGER_LESS_COMMAND then
            if DATA_I < TRIGGER_VALUE_I then
              s_trigger_start <= '1';
            end if;
          elsif TRIGGER_TYPE_I = C_TRIGGER_LESS_EQUAL_COMMAND then
            if DATA_I       <= TRIGGER_VALUE_I then
              s_trigger_start <= '1';
            end if;
          elsif TRIGGER_TYPE_I = C_TRIGGER_MORE_COMMAND then
            if DATA_I > TRIGGER_VALUE_I then
              s_trigger_start <= '1';
            end if;
          elsif TRIGGER_TYPE_I = C_TRIGGER_MORE_EQUAL_COMMAND then
            if DATA_I >= TRIGGER_VALUE_I then
              s_trigger_start <= '1';
            end if;
          end if;
        end if;
      end if;
    end if;
  end process;


--! This process indicates that the trigger has been finished.
FINISH_PROCESS : process (CLK_I)
  begin
    if rising_edge(CLK_I) then
      if RST_N_I = '0' then
        TRIGGER_FINISH_O <= '0';
      elsif EN_I = '1' then
        if re_state = SM_WAIT then
          TRIGGER_FINISH_O <= '0';
        elsif re_state = SM_FINISH then
          TRIGGER_FINISH_O <= '1';
        end if;
      end if;
    end if;
  end process;


--! This process counts the number of samples to send.
SEND_SAMPLES : process (CLK_I)
begin
  if rising_edge(CLK_I) then
    if RST_N_I = '0' then
      r_cont_send_samples <= 0;
    elsif EN_I = '1' then
      r_cont_send_samples <= 0;
      if re_state = SM_SEND then
        r_cont_send_samples <= r_cont_send_samples+1;
      end if;
    end if;
  end if;
end process;

end architecture;