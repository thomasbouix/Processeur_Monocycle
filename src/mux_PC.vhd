library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

Entity mux_PC is port(
  
  nPCsel      : in std_logic;
  adresse_in  : in std_logic_vector (31 downto 0);
  offset      : in std_logic_vector (31 downto 0);  
  adresse_out : out std_logic_vector(31 downto 0));

end Entity mux_PC;

Architecture RTL of mux_PC is 
  
  begin
    
  process(nPCsel, adresse_in, offset) begin
  
    if (nPCsel = '0') then
      adresse_out <= std_logic_vector (unsigned(adresse_in) + 1); 
    
    elsif (nPCsel = '1') then
      adresse_out <= std_logic_vector (signed(adresse_in) + signed(offset) + 1);
    end if;
    
  end process;
  
end Architecture RTL;