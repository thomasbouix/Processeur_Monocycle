library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

Entity tb_gestion_instructions is

end entity tb_gestion_instructions;

Architecture test_bench of tb_gestion_instructions is
  
  signal clk    : std_logic;
  signal rst    : std_logic;
  signal nPCsel : std_logic;
  signal offset : std_logic_vector (23 downto 0);
  
  signal instruction : std_logic_vector (31 downto 0);
  
begin
  
  unite_gestion_instruction : entity work.gestion_instructions(RTL) port map (clk        => clk,
                                                                              rst        => rst,
                                                                              nPCsel     => nPCsel,
                                                                              offset     => offset,
                                                                              instruction=> instruction);
  
  clock : process begin
    clk <= '0';
    wait for 5 ns;
    clk <= '1';
    wait for 5 ns;
  end process clock;
  
  test_bench : process begin
  
    -- initialisation
    rst <= '1';
    nPCsel <= '0';   
    offset <= (others => '0');
    wait for 10 ns;
    
    wait;
    
  end process test_bench;
  
end Architecture test_bench;

