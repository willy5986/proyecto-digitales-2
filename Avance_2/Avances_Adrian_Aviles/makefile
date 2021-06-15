Objetivo1:
	yosys Serial_Paralelo_phy_tx.v synth.ys
	sed 's/Serial_Paralelo_phy_tx/Serial_Paralelo_phy_tx_synth/' Serial_Paralelo_phy_tx_synth1.v > Serial_Paralelo_phy_tx_synth.v
	rm Serial_Paralelo_phy_tx_synth1.v
	iverilog -o BancoPruebas.o BancoPruebas.v
	vvp BancoPruebas.o
	gtkwave Serial_Paralelo_phy_tx.vcd
