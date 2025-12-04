library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity adder is port(
  i_A : in std_logic_vector(7 downto 0);
  i_B : in std_logic_vector(7 downto 0);
  i_C : in std_logic;
  o_S : out std_logic_vector(7 downto 0));
end entity;

architecture arch_adder of adder is
begin
o_S <= std_logic_vector(unsigned(i_A) + unsigned(i_B) + ((others => '0') & i_C));
end architecture;