vlib work

vcom -93 ../src/*.vhd
vcom -93 tb_processeur.vhd

vsim -novopt tb_processeur

view signals
add wave -position insertpoint sim:/tb_processeur/*
add wave -position insertpoint  \
sim:/tb_processeur/processeur/ALUCtr \
sim:/tb_processeur/processeur/ALUSrc \
sim:/tb_processeur/processeur/MemWr \
sim:/tb_processeur/processeur/RA \
sim:/tb_processeur/processeur/RB \
sim:/tb_processeur/processeur/RW \
sim:/tb_processeur/processeur/RegWr \
sim:/tb_processeur/processeur/WrSrc \
-radix unsigned sim:/tb_processeur/processeur/flag \
-radix hexadecimal sim:/tb_processeur/processeur/instruction \
sim:/tb_processeur/processeur/unite_controle_0/decodeur_instruction_0/instruction_courante \
-radix hexadecimal sim:/tb_processeur/processeur/gestion_instruction_0/bus_adresse \
sim:/tb_processeur/processeur/nPCsel \
sim:/tb_processeur/processeur/unite_controle_0/decodeur_instruction_0/Rd \
sim:/tb_processeur/processeur/unite_controle_0/decodeur_instruction_0/Rm \
sim:/tb_processeur/processeur/unite_controle_0/decodeur_instruction_0/Rn
 
add wave -radix hexadecimal -position insertpoint sim:/tb_processeur/processeur/unite_traitement_finale_0/register_bank/Banc(0)
add wave -radix hexadecimal -position insertpoint sim:/tb_processeur/processeur/unite_traitement_finale_0/register_bank/Banc(1)
add wave -radix hexadecimal -position insertpoint sim:/tb_processeur/processeur/unite_traitement_finale_0/register_bank/Banc(2)
add wave -radix decimal -position insertpoint sim:/tb_processeur/processeur/unite_traitement_finale_0/data_memory/Banc(42)

run 1000 ns