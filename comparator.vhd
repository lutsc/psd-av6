library ieee;
use ieee.std_logic_1164.all;

entity comparator is port(
  i_X  : in std_logic_vector(7 downto 0);
  i_Y  : in std_logic_vector(7 downto 0);
  o_GT : out std_logic;
  o_EQ : out std_logic;
  o_LT : out std_logic);
end entity;

architecture arch_comparator of comparator is
begin
  process (i_X, i_Y)
  begin
    if (i_X > i_Y) then
      o_GT <= '1';
      o_EQ <= '0';
      o_LT <= '0';
    elsif (i_X = i_Y) then
      o_GT <= '0';
      o_EQ <= '1';
      o_LT <= '0';
    else
      o_GT <= '0';
      o_EQ <= '0';
      o_LT <= '1';
    end if;
  end process;
end architecture;