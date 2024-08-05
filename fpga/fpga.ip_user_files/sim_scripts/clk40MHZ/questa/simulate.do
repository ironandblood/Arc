onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib clk40MHZ_opt

do {wave.do}

view wave
view structure
view signals

do {clk40MHZ.udo}

run -all

quit -force
