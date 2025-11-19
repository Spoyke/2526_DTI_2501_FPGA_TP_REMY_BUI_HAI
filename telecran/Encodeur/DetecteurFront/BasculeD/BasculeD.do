quit -sim

vlib work

vcom BasculeD.vhd
vcom BasculeD_tb.vhd

vsim -c work.BasculeD_tb

# INPUTS
add wave -divider Inputs:
add wave -color yellow uut/i_clk
add wave -color yellow uut/i_d
add wave -color yellow uut/i_en

# OUTPUTS
add wave -divider Outputs:
add wave -color red uut/o_q

run -all