vcom -2008 -reportprogress 30 fsm.vhd 
vsim -voptargs=+acc fsm_tb 
add wave -r *
run -all

