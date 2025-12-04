library ieee;
use ieee.std_logic_1164.all;

entity mdc_top is port(
  i_CLR_n : in std_logic;
  i_CLK   : in std_logic;
  i_GO    : in std_logic;
  o_RDY   : out std_logic;
  i_X     : in std_logic_vector(7 downto 0);
  i_Y     : in std_logic_vector(7 downto 0);
  o_D     : out std_logic_vector(7 downto 0));
end entity;

architecture arch_mdc_top of mdc_top is
begin

end architecture;