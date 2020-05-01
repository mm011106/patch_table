vcom -reportprogress 300 -work work C:/Users/miyam/OneDrive/Documents/HDL/ROM/ROM_tb.vhdl
vsim work.sim
mem load -i C:/Users/miyam/OneDrive/Documents/HDL/ROM/simulation/modelsim/patch_table.hex /sim/DUT/ROM
