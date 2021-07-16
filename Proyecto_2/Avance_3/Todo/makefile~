Objetivo1:
	yosys FIFO.v synth.ys
	sed 's/cond/synth/' FIFO_synth1.v > FIFO_synth.v
	rm FIFO_synth1.v
	iverilog -o BancoPruebas.o BancoPruebas.v
	vvp BancoPruebas.o
	gtkwave FIFO.vcd
