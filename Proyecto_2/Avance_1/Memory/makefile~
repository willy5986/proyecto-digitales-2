Objetivo1:
	yosys phy.v synth.ys
	sed 's/cond/synth/' phy_synth1.v > phy_synth.v
	rm phy_synth1.v
	iverilog -o BancoPrueba.o BancoPrueba.v
	vvp BancoPrueba.o
	gtkwave phy.vcd
