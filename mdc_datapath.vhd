library ieee;
use ieee.std_logic_1164.all;

entity mdc_datapath is port(
  i_X : in std_logic_vector(7 downto 0);
  i_Y : in std_logic_vector(7 downto 0);
  o_D : out std_logic_vector(7 downto 0);
  i_SEL : out std_logic_vector(7 downto 0));
end entity;

architecture arch_datapath of mdc_datapath is

component subtractor is port(
  i_A : in std_logic_vector(7 downto 0);
  i_B : in std_logic_vector(7 downto 0);
  o_S : out std_logic_vector(7 downto 0));
end component;

signal w_A, w_B : std_logic_vector(7 downto 0);

begin

process(i_X, i_Y)
begin
  if(i_X < i_Y) then
    w_A <= i_Y;
    w_B <= i_X;
  else
    w_A <= i_X;
    w_B <= i_Y;
  end if;
end process;

-- u_SUBTRACTOR : adder port map(w_A, w_B, o_D);
u_SUBTRACTOR : subtractor port map(
  i_A => w_A,
  i_B => w_B,
  o_S => o_D);

end architecture;