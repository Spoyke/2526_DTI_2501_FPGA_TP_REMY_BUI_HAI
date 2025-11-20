quit -sim

vlib work

vcom DiviseurFrequence.vhd
vcom DiviseurFrequence_tb.vhd

vsim -c work.DiviseurFrequence_tb

# INPUTS
add wave -divider Inputs:
add wave -color yellow uut/i_clk

# OUTPUTS
add wave -divider Outputs:
add wave -color red uut/o_clk

run -all