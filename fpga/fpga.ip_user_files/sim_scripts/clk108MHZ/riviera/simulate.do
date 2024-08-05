onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+clk108MHZ -L xil_defaultlib -L xpm -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.clk108MHZ xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {clk108MHZ.udo}

run -all

endsim

quit -force
