vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xil_defaultlib

vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib

vlog -work xil_defaultlib -64 -incr "+incdir+../../../ipstatic" \
"../../../../fpga.srcs/sources_1/ip/CLK25MHZ/CLK25MHZ_clk_wiz.v" \
"../../../../fpga.srcs/sources_1/ip/CLK25MHZ/CLK25MHZ.v" \


vlog -work xil_defaultlib \
"glbl.v"

