library ieee;
use ieee.std_logic_1164.all;

entity mux is port(
  i_CLR_n : in std_logic;
  i_CLK   : in std_logic;
  i_ENA   : in std_logic;
  i_SEL   : in std_logic;
  i_A     : in std_logic_vector(7 downto 0);
  i_B     : in std_logic_vector(7 downto 0);
  o_S     : out std_logic_vector(7 downto 0));
end entity;

architecture arch_mux of mux is
begin
  process(i_CLR_n, i_CLK, i_ENA)
  begin
    if (i_CLR_n = '1') then
      o_S <= (others => '0');
    elsif (rising_edge(i_CLK) and i_ENA = '1') then
      if (i_SEL = '1') then
        o_S <= i_B;
      else
        o_S <= i_A;
      end if;
    end if;
  end process;
end architecture;