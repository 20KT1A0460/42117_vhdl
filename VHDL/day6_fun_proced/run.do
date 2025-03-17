vcom -2008 -reportprogress 30 fun_prod.vhd 
vsim -voptargs=+acc fun_prod_tb 
add wave -r *
run -all

