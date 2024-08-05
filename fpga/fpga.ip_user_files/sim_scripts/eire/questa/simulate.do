onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib eire_opt

do {wave.do}

view wave
view structure
view signals

do {eire.udo}

run -all

quit -force
