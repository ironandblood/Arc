vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xil_defaultlib

vmap xil_defaultlib questa_lib/msim/xil_defaultlib

vlog -work xil_defaultlib -64 "+incdir+../../../ipstatic" \
"../../../../fpga.srcs/sources_1/ip/CLK25MHZ/CLK25MHZ_clk_wiz.v" \
"../../../../fpga.srcs/sources_1/ip/CLK25MHZ/CLK25MHZ.v" \


vlog -work xil_defaultlib \
"glbl.v"

