library ieee;
use ieee.std_logic_1164.all;

entity mdc_top is port(
  i_CLR_n : in std_logic;
  i_CLK   : in std_logic;
  i_GO    : in std_logic;
  i_X     : in std_logic_vector(7 downto 0);
  i_Y     : in std_logic_vector(7 downto 0);
  o_RDY   : out std_logic;
  o_D     : out std_logic_vector(7 downto 0));
end entity;

architecture arch_mdc_top of mdc_top is

  component mdc_control is port(
    i_CLR_n   : in std_logic;
    i_CLK     : in std_logic;
    i_GO      : in std_logic;
    i_GT      : in std_logic;
    i_EQ      : in std_logic;
    i_LT      : in std_logic;
    o_ENA_X   : out std_logic;
    o_ENA_Y   : out std_logic;
    o_ENA_D   : out std_logic;
    o_SEL_X   : out std_logic;
    o_SEL_Y   : out std_logic;
    o_SEL_SUB : out std_logic;
    o_RDY     : out std_logic);
  end component;

  component mdc_datapath is port(
    i_CLR_n   : in  std_logic;
    i_CLK     : in  std_logic;
    i_ENA_X   : in  std_logic;
    i_ENA_Y   : in  std_logic;
    i_ENA_D   : in  std_logic;
    i_SEL_X   : in  std_logic;
    i_SEL_Y   : in  std_logic;
    i_SEL_SUB : in  std_logic;
    i_X       : in  std_logic_vector(7 downto 0);
    i_Y       : in  std_logic_vector(7 downto 0);
    o_GT      : out std_logic;
    o_EQ      : out std_logic;
    o_LT      : out std_logic;
    o_D       : out std_logic_vector(7 downto 0));
  end component;

  signal w_GT, w_EQ, w_LT : std_logic := '0';
  signal w_SEL_X, w_SEL_Y, w_SEL_SUB : std_logic := '0';
  signal w_ENA_X, w_ENA_Y, w_ENA_D : std_logic := '0';

begin

  u_CONTROLLER : mdc_control port map(
    i_CLR_n   => i_CLR_n,
    i_CLK     => i_CLK,
    i_GO      => i_GO,
    i_GT      => w_GT,
    i_EQ      => w_EQ,
    i_LT      => w_LT,
    o_ENA_X   => w_ENA_X,
    o_ENA_Y   => w_ENA_Y,
    o_ENA_D   => w_ENA_D,
    o_SEL_X   => w_SEL_X,
    o_SEL_Y   => w_SEL_Y,
    o_SEL_SUB => w_SEL_SUB,
    o_RDY     => o_RDY);

  u_DATAPATH : mdc_datapath port map(
    i_CLR_n   => i_CLR_n,
    i_CLK     => i_CLK,
    i_ENA_X   => w_ENA_X,
    i_ENA_Y   => w_ENA_Y,
    i_ENA_D   => w_ENA_D,
    i_SEL_X   => w_SEL_X,
    i_SEL_Y   => w_SEL_Y,
    i_SEL_SUB => w_SEL_SUB,
    i_X       => i_X,
    i_Y       => i_Y,
    o_GT      => w_GT,
    o_EQ      => w_EQ,
    o_LT      => w_LT,
    o_D       => o_D);

end architecture;