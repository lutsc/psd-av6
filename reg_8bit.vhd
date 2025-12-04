library ieee;
use ieee.std_logic_1164.all;

entity reg_8bit is port(
  i_CLR_n : in std_logic;
  i_CLK   : in std_logic;
  i_ENA   : in std_logic;
  i_Q     : in std_logic_vector(7 downto 0);
  o_S     : out std_logic_vector(7 downto 0));
end entity;

architecture arch_reg_8bit of reg_8bit is
begin
  
process(i_CLR_n, i_CLK, i_ENA)
begin
  if (i_CLR_n = '1') then
    o_S <= (others => '0');
  elsif (rising_edge(i_CLK) and i_ENA = '1') then
    o_S <= i_Q;
  end if;
end process;

end architecture;