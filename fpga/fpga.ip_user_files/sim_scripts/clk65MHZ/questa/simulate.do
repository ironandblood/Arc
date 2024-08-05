onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib clk65MHZ_opt

do {wave.do}

view wave
view structure
view signals

do {clk65MHZ.udo}

run -all

quit -force
