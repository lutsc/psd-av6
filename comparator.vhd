library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

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
    if (unsigned(i_X) > unsigned(i_Y)) then
      o_GT <= '1';
      o_EQ <= '0';
      o_LT <= '0';
    elsif (unsigned(i_X) = unsigned(i_Y)) then
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