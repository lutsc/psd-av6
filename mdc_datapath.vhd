library ieee;
use ieee.std_logic_1164.all;

entity mdc_datapath is port(
  i_CLR_n : in std_logic;
  i_CLK   : in std_logic;
  i_X     : in std_logic_vector(7 downto 0);
  i_Y     : in std_logic_vector(7 downto 0);
  o_GT : out std_logic;
  o_EQ : out std_logic;
  o_LT : out std_logic;
  o_D     : out std_logic_vector(7 downto 0));
end entity;

architecture arch_datapath of mdc_datapath is

  component comparator is port(
    i_X  : in std_logic_vector(7 downto 0);
    i_Y  : in std_logic_vector(7 downto 0);
    o_GT : out std_logic;
    o_EQ : out std_logic;
    o_LT : out std_logic);
  end component;

  component subtractor is port(
    i_A : in std_logic_vector(7 downto 0);
    i_B : in std_logic_vector(7 downto 0);
    o_S : out std_logic_vector(7 downto 0));
  end component;

  signal w_X, w_Y : std_logic_vector(7 downto 0);

begin

end architecture;