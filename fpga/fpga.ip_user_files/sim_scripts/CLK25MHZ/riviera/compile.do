vlib work
vlib riviera

vlib riviera/xil_defaultlib

vmap xil_defaultlib riviera/xil_defaultlib

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../ipstatic" \
"../../../../fpga.srcs/sources_1/ip/CLK25MHZ/CLK25MHZ_clk_wiz.v" \
"../../../../fpga.srcs/sources_1/ip/CLK25MHZ/CLK25MHZ.v" \


vlog -work xil_defaultlib \
"glbl.v"

