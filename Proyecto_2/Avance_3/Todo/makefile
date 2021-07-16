Objetivo1:
	yosys Todo.v synth.ys
	sed 's/cond/synth/' Todo_synth1.v > Todo_synth.v
	rm Todo_synth1.v
	iverilog -o BancoPruebas.o BancoPruebas.v
	vvp BancoPruebas.o
	gtkwave Todo.vcd
