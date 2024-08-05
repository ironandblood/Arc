-makelib ies_lib/xil_defaultlib -sv \
  "D:/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
-endlib
-makelib ies_lib/xpm \
  "D:/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../../fpga.srcs/sources_1/ip/clk50MHZ/clk50MHZ_clk_wiz.v" \
  "../../../../fpga.srcs/sources_1/ip/clk50MHZ/clk50MHZ.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  glbl.v
-endlib

