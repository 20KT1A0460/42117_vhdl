vcom -2008 -reportprogress 30 bhf_mx_2x1.vhd 
vsim -voptargs=+acc mx_2X1_tb 
add wave -r *
run -all

