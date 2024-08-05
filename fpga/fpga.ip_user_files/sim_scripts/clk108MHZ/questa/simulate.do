onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib clk108MHZ_opt

do {wave.do}

view wave
view structure
view signals

do {clk108MHZ.udo}

run -all

quit -force
