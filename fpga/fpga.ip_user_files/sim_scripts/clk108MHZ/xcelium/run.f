-makelib xcelium_lib/xil_defaultlib -sv \
  "D:/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
-endlib
-makelib xcelium_lib/xpm \
  "D:/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../../fpga.srcs/sources_1/ip/clk108MHZ/clk108MHZ_clk_wiz.v" \
  "../../../../fpga.srcs/sources_1/ip/clk108MHZ/clk108MHZ.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  glbl.v
-endlib

