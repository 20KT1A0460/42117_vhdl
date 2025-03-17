vcom -2008 -reportprogress 30 loops.vhd 
vsim -voptargs=+acc loops 
add wave -r *
run -all

