Objetivo1:
	yosys memory.v synth.ys
	sed 's/cond/synth/' memory_synth1.v > memory_synth.v
	rm memory_synth1.v
	iverilog -o BancoPruebas.o BancoPruebas.v
	vvp BancoPruebas.o
	gtkwave memory.vcd
