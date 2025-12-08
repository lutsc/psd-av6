library ieee;
use ieee.std_logic_1164.all;

entity mdc_control is port(
  i_CLR_n : in std_logic;  
  i_CLK   : in std_logic;
  i_GO    : in std_logic;
  i_GT    : in std_logic;
  i_EQ    : in std_logic;
  i_LT    : in std_logic;
  o_SEL_X : out std_logic;
  o_SEL_Y : out std_logic;
  o_ENA_X : out std_logic;
  o_ENA_Y : out std_logic;
  o_ENA_D : out std_logic;
  o_RDY   : out std_logic);
end entity;

architecture arch_control of mdc_control is
  
  type t_STATE is (s_0, s_1, s_2, s_3, s_4, s_5, s_6); -- estados: 
  signal r_STATE : t_STATE := s_0;                     -- estado atual (inicializado)
  signal w_NEXT  : t_STATE;                            -- próximo estado

begin

-- Registrador de estados  
p_STATE : process(i_CLR_n, i_CLK)
begin
  if (i_CLR_n = '1') then
    r_STATE <= s_0;
  elsif (rising_edge(i_CLK)) then
    r_STATE <= w_NEXT;
  end if;
end process;

-- Transição de estados
p_NEXT : process(r_STATE)
begin
  case (r_STATE) is
  when s_0 => 
    if (i_GO = '1') then
      w_NEXT <= s_1;
    else
      w_NEXT <= s_0;
    end if;

  when s_1 => w_NEXT <= s_2;

  when s_2 => 
    if (i_EQ = '1') then 
      w_NEXT <= s_6;
    else
      w_NEXT <= s_3;
    end if;

  when s_3 => 
    if (i_LT = '1') then
      w_NEXT <= s_4;
    elsif (i_GT = '1') then
      w_NEXT <= s_5;
    end if;
  
  when s_4 => w_NEXT <= s_2;
  
  when s_5 => w_NEXT <= s_2;
  
  when s_6 => w_NEXT <= s_0;

  when others => w_NEXT <= s_0;

  end case; 
end process;

-- Saída  
p_OUTPUT : process(r_STATE)
begin
  case (r_STATE) is
  when s_0 => 
    o_RDY   <= '1';
    o_SEL_X <= '0';
    o_SEL_Y <= '0';
    o_ENA_X <= '0';
    o_ENA_Y <= '0';
    o_ENA_D <= '0';

  when s_1 =>
    o_RDY   <= '0';
    o_SEL_X <= '0';
    o_SEL_Y <= '0';
    o_ENA_X <= '0';
    o_ENA_Y <= '0';
    o_ENA_D <= '0';

  when s_2 =>
    o_RDY   <= '0';
    o_SEL_X <= '0';
    o_SEL_Y <= '0';
    o_ENA_X <= '0';
    o_ENA_Y <= '0';
    o_ENA_D <= '0';

  when s_3 =>
    o_RDY   <= '0';
    o_SEL_X <= '0';
    o_SEL_Y <= '0';
    o_ENA_X <= '0';
    o_ENA_Y <= '0';
    o_ENA_D <= '0';
  
  when s_4 =>
    o_RDY   <= '0';
    o_SEL_X <= '0';
    o_SEL_Y <= '0';
    o_ENA_X <= '0';
    o_ENA_Y <= '0';
    o_ENA_D <= '0';

  when s_5 =>
    o_RDY   <= '0';
    o_SEL_X <= '0';
    o_SEL_Y <= '0';
    o_ENA_X <= '0';
    o_ENA_Y <= '0';
    o_ENA_D <= '0';

  when s_6 =>
    o_RDY   <= '0';
    o_SEL_X <= '0';
    o_SEL_Y <= '0';
    o_ENA_X <= '0';
    o_ENA_Y <= '0';
    o_ENA_D <= '0';
 
  end case;
end process;
end architecture;