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
  
    for i in 0 to 5 loop
      clk <= '0';
      wait for 5 ns;
      clk <= '1';
      wait for 5 ns;
    end loop;
    wait;
  end process clock;
  
  test_bench : process begin
  
    -- initialisation
    rst <= '1';
    nPCsel <= '0';   
    offset <= (others => '0');
    wait for 1 ns;
    rst <= '0';
    
    -- PC + 1
    nPCsel <= '0';
    wait for 10 ns;   --11 ns
    
    -- PC + 8 + 1 
    nPCsel <= '1';   
    offset <= (others => '0');
    offset(3) <= '1'; 
    
    
    -- rst
    rst <= '1';
    wait for 1 ns;
    rst <= '0';
    
    wait for 10 ns;    
    wait;
    
  end process test_bench;
  
end Architecture test_bench;

