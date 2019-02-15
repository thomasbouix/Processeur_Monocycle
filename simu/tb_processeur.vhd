library ieee;
USE ieee.std_logic_1164.all;
use ieee.numeric_std.all;

Entity tb_processeur is 
end entity tb_processeur;

Architecture test_bench of tb_processeur is 

  signal clk             : std_logic;
  signal rst_PC_extender : std_logic;
  signal rst_PSR         : std_logic;

begin
  
  processeur : entity work.processeur(RTL) port map (clk => clk, rst_PC_extender => rst_PC_extender, rst_PSR => rst_PSR);
                                                                  
  clock: process begin  
      Clk <= '0';
      wait for 5 ns;
      Clk <= '1';
      wait for 5 ns;
  end process clock;
  
  test_bench: process begin
  
    rst_PC_extender <= '1';
    rst_PSR <= '1';
    wait for 1 ns;
    
    rst_PC_extender <= '0';
    rst_PSR <= '0';
    wait;
  
  end process test_bench;
    
end architecture test_bench;