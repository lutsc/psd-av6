library ieee;
use ieee.std_logic_1164.all;

entity mdc_datapath is port(
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
end entity;

architecture arch_mdc_datapath of mdc_datapath is

  component mux_2x1 is port(
    i_SEL : in std_logic;
    i_A   : in std_logic_vector(7 downto 0);
    i_B   : in std_logic_vector(7 downto 0);
    o_S   : out std_logic_vector(7 downto 0));
  end component;

  component reg_8bit is port(
    i_CLR_n : in std_logic;
    i_CLK   : in std_logic;
    i_ENA   : in std_logic;
    i_Q     : in std_logic_vector(7 downto 0);
    o_S     : out std_logic_vector(7 downto 0));
  end component;

  component comparator is port(
    i_X  : in std_logic_vector(7 downto 0);
    i_Y  : in std_logic_vector(7 downto 0);
    o_GT : out std_logic;
    o_EQ : out std_logic;
    o_LT : out std_logic);
  end component;

  component subtractor is port(
    i_SEL : in std_logic;
    i_A   : in std_logic_vector(7 downto 0);
    i_B   : in std_logic_vector(7 downto 0);
    o_S   : out std_logic_vector(7 downto 0));
  end component;

  signal w_MUX_X, w_MUX_Y, w_SUB : std_logic_vector(7 downto 0) := (others => '0');
  signal r_X, r_Y : std_logic_vector(7 downto 0) := (others => '0');

begin

  u_MUX_X : mux_2x1 port map(
    i_SEL => i_SEL_X,
    i_A   => i_X,
    i_B   => w_SUB,
    o_S   => w_MUX_X);

  u_MUX_Y : mux_2x1 port map(
    i_SEL => i_SEL_Y,
    i_A   => i_Y,
    i_B   => w_SUB,
    o_S   => w_MUX_Y);

  u_REG_X : reg_8bit port map(
    i_CLR_n => i_CLR_n,
    i_CLK   => i_CLK,
    i_ENA   => i_ENA_X,
    i_Q     => w_MUX_X,
    o_S     => r_X);

  u_REG_Y : reg_8bit port map(
    i_CLR_n => i_CLR_n,
    i_CLK   => i_CLK,
    i_ENA   => i_ENA_Y,
    i_Q     => w_MUX_Y,
    o_S     => r_Y);
  
  u_COMPARATOR : comparator port map (
    i_X  => r_X,
    i_Y  => r_Y,
    o_GT => o_GT,
    o_EQ => o_EQ,
    o_LT => o_LT);

  u_SUBTRACTOR : subtractor port map (
    i_SEL => i_SEL_SUB,
    i_A   => r_X,
    i_B   => r_Y,
    o_S   => w_SUB);

  u_REG_D : reg_8bit port map(
    i_CLR_n => i_CLR_n,
    i_CLK   => i_CLK,
    i_ENA   => i_ENA_D,
    i_Q     => r_X,
    o_S     => o_D);

end architecture;