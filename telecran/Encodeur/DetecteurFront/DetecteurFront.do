quit -sim

vlib work

vcom DetecteurFront.vhd
vcom DetecteurFront_tb.vhd

vcom DiviseurFrequence/DiviseurFrequence.vhd
vcom BasculeD/BasculeD.vhd

vsim -c work.DetecteurFront_tb

# INPUTS
add wave -divider Inputs:
add wave -color yellow uut/i_clk_50
add wave -color yellow uut/i_in

# REGISTERS
add wave -divider Registers:
add wave -color green uut/s_BasculeD_en
add wave -color green uut/s_E1
add wave -color green uut/s_E2

# OUTPUTS
add wave -divider Outputs:
add wave -color red uut/o_front
add wave -color red uut/o_front_type

run -all