library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity processeur is port(
  clk : in std_logic
  );
end processeur;

architecture RTL is
  
  signal offset : std_logic_vector(23 downto 0);
  
begin
  
  gestion_instruction_0 : entity work.gestion_instruction port map (clk, 
                                                                    rst, 
                                                                    nPCsel, 
                                                                    offset,
                                                                    instruction
                                                                    );
  
  unite_traitement_final_0 : entity work.unite_traitment_finale port map( Clk, 
                                                                          RegWr,
                                                                          RW, 
                                                                          RA, 
                                                                          RB,
                                                                          COM_1,  
                                                                          OP,
                                                                          WrEn,
                                                                          COM_2,
                                                                          Imm,
                                                                          N,
                                                                          S
                                                                        );
                                                                        
  un