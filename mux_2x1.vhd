library ieee;
use ieee.std_logic_1164.all;

entity mux_2x1 is port(
  i_SEL   : in std_logic;
  i_A     : in std_logic_vector(7 downto 0);
  i_B     : in std_logic_vector(7 downto 0);
  o_S     : out std_logic_vector(7 downto 0));
end entity;

architecture arch_mux_2x1 of mux_2x1 is
begin
  process(i_SEL, i_A, i_B)
  begin
    if (i_SEL = '1') then
      o_S <= i_B;
    else
      o_S <= i_A;
    end if;
  end process;
end architecture;