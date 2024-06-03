# constraints.tcl
#
# This file is where design timing constraints are defined for Genus and Innovus.
# Many constraints can be written directly into the Hammer config files. However, 
# you may manually define constraints here as well.
#

# TODO: add constraints here!
create_clock -name clk -period 11.0 [get_ports clk_i]
set_clock_uncertainty 0.050 [get_clocks clk]

set_input_delay  5.0 -max -clock [get_clocks clk] [all_inputs]
set_output_delay 5.0 -max -clock [get_clocks clk] [remove_from_collection [all_outputs] [get_ports clk_o]]

set_input_delay  0.0 -min -clock [get_clocks clk] [all_inputs]
set_output_delay 0.0 -min -clock [get_clocks clk] [remove_from_collection [all_outputs] [get_ports clk_o]]

