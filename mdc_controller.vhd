library ieee;
use ieee.std_logic_1164.all;

entity mdc_controller is port(
  i_CLK : in std_logic;
  i_RDY : in std_logic;
  i_GO  : in std_logic;
  o_D : out std_logic
);
end entity;

architecture arch_controller of mdc_controller is
  
  type t_STATE is (s_0, s_1, s_2, s_3, s_4, s_5, s_6); -- estados: 
  signal r_STATE : t_STATE := s_0;                     -- estado atual (inicializado)
  signal w_NEXT  : t_STATE;                            -- próximo estado

begin

-- Registrador de estados  
p_STATE: process(i_CLK)
begin
  if (rising_edge(i_CLK)) then
    r_STATE <= w_NEXT;
  end if;
end process;

-- Transição de estados
p_NEXT: process(r_STATE)
begin
  case r_STATE is
  when s_0 => 
    if i_GO = '1' then
      w_NEXT <= s_1;
      
    else
      w_NEXT <= s_0;
    end if;

  when s_1 => w_NEXT <= s_2;

  -- when s_2 => w_NEXT <= s_3;
  -- while
  -- x!=y => w_NEXT <= s_3;
  -- !(x!=y) => w_NEXT <= s_6;

  -- when s_3 => w_NEXT <= s_4;
  -- if 
  -- x<y => w_NEXT <= s_4;
  -- !(x<y) => w_NEXT <= s_5;

  when s_4 => w_NEXT <= s_2;
  
  when s_5 => w_NEXT <= s_2;
  
  when others => w_NEXT <= s_0;
  
  end case; 
end process;

-- Saída  
-- o_S <=  when (r_STATE = s_1 or r_STATE = s_2 or r_STATE = s_4) else '0';

end architecture;