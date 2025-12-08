library IEEE;
use IEEE.std_logic_1164.all;

entity testbench_mdc_top is
end entity; 

architecture tb of testbench_mdc_top is

  component mdc_top is port(
    i_CLR_n : in std_logic;
    i_CLK   : in std_logic;
    i_GO    : in std_logic;
    i_X     : in std_logic_vector(7 downto 0);
    i_Y     : in std_logic_vector(7 downto 0);
    o_RDY   : out std_logic;
    o_D     : out std_logic_vector(7 downto 0));
  end component;

  signal w_CLR_n : std_logic := '1';
  signal w_CLK : std_logic := '0';
  signal w_GO : std_logic := '0';
  signal w_X, w_Y : std_logic_vector(7 downto 0) := (others => '0');
  signal w_RDY : std_logic;
  signal w_D : std_logic_vector(7 downto 0) := (others => '0');
  constant c_PERIOD : time := 1 ns;

begin

  u_DUT : mdc_top port map(
    i_CLR_n => w_CLR_n,
    i_CLK => w_CLK,
    i_GO => w_GO,
    i_X => w_X,
    i_Y => w_Y,
    o_RDY => w_RDY,
    o_D => w_D);

  w_CLR_n <= '0' after c_PERIOD/2;
  w_CLK <= not w_CLK after c_PERIOD/2;

  p_INPUTS: process
  begin

    w_GO <= '1';
    w_X <= "00000011";
    w_Y <= "00001001";
    wait for c_PERIOD;
    w_GO <= '0';
    wait for 20*c_PERIOD;
    
    -- assert(w_D = "00000011") report "Falha" severity error;




  end process;

end architecture;