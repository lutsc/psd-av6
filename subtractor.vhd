library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity subtractor is port(
  i_SEL   : in std_logic;
  i_A     : in std_logic_vector(7 downto 0);
  i_B     : in std_logic_vector(7 downto 0);
  o_S     : out std_logic_vector(7 downto 0));
end entity;

architecture arch_subtractor of subtractor is
begin
  process(i_SEL, i_A, i_B)
  begin
    if (i_SEL = '1') then
      o_S <= std_logic_vector(unsigned(i_B) - unsigned(i_A));
    else
      o_S <= std_logic_vector(unsigned(i_A) - unsigned(i_B));
    end if;
  end process;
end architecture;