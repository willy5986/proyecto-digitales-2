Objetivo1:
	yosys phy_rx.v synth.ys
	sed 's/cond/synth/' phy_rx_synth1.v > phy_rx_synth.v
	rm phy_rx_synth1.v
	iverilog -o BancoPruebas.o BancoPruebas.v
	vvp BancoPruebas.o
	gtkwave Serial_Paralelo_phy_rx_TEMP.vcd
