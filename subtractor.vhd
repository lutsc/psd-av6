library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity subtractor is port(
  i_A : in std_logic_vector(7 downto 0);
  i_B : in std_logic_vector(7 downto 0);
  o_S : out std_logic_vector(7 downto 0));
end entity;

architecture arch_subtractor of subtractor is
begin
o_S <= std_logic_vector(unsigned(i_A) + unsigned(not i_B) + 1);
end architecture;