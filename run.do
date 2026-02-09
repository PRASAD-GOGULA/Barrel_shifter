#To creates the default working library
vlib work

#To compiles the testbench file tb.v into the work library
vlog testbench.v

#To loads the tb module for simulation
vsim tb

# To add all signals in tb to the waveform window
add wave -position insertpoint sim:/tb/*


# To run the simulation until it finishes
run -all

