vlib work
vlib activehdl

vlib activehdl/xil_defaultlib

vmap xil_defaultlib activehdl/xil_defaultlib

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../ipstatic" \
"../../../../fpga.srcs/sources_1/ip/CLK25MHZ/CLK25MHZ_clk_wiz.v" \
"../../../../fpga.srcs/sources_1/ip/CLK25MHZ/CLK25MHZ.v" \


vlog -work xil_defaultlib \
"glbl.v"

