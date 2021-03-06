library ieee;
USE ieee.std_logic_1164.all;
use ieee.numeric_std.all;

Entity tb_unite_controle is 
end entity tb_unite_traitement_finale;

Architecture test_bench of tb_unite_controle is 

  signal instruction  : std_logic_vector (31 downto 0);
  signal flag         : std_logic_vector (31 downto 0);    
  signal Clk          : std_logic;
  signal rst_PSR      : std_logic;
    
  signal nPCsel       : std_logic;
  signal RegWr        : std_logic;
  signal ALUSrc       : std_logic;
  signal MemWr        : std_logic;
  signal WrSrc        : std_logic;
  signal ALUCtr       : std_logic_vector (1 downto 0);
  
  signal Ra           : std_logic_vector (3 downto 0);
  signal Rw           : std_logic_vector (3 downto 0);
  signal Rb           : std_logic_vector (3 downto 0)); 
 
begin

  unite_controle : entity work.unite_controle(RTL) port map (instruction => instruction, 
                                                             flag        => flag,
                                                             Clk         => Clk,
                                                             rst_PSR     => rst_PSR,                                                             
                                                             nPCsel      => nPCsel,
                                                             RegWr       => RegWr,
                                                             ALUSrc      => ALUSrc,
                                                             MemWr       => MemWr,
                                                             WrSrc       => WrSrc,
                                                             ALUCtr      => ALUCtr,
                                                             Ra          => Ra,
                                                             Rw          => Rw,
                                                             Rb          => Rb);
    
                                                                     
  clock: process begin  
    for i in 0 to 6 loop
      Clk <= '0';
      wait for 5 ns;
      Clk <= '1';
      wait for 5 ns;
    end loop;
    wait;
  end process clock;
  
  end process test_bench; 
  
end architecture test_bench;