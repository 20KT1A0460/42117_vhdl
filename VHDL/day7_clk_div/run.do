vcom -2008 -reportprogress 30 clk_div.vhd 
vsim -voptargs=+acc clk_div_tb 
add wave -r *
run -all

