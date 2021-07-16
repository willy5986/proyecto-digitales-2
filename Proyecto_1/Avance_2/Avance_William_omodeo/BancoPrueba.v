`timescale 	1ns				/ 100ps
// escala	unidad temporal (valor de "#1") / precisión
// includes de archivos de verilog
// Pueden omitirse y llamarse desde el testbench
`include "paralelo_serial_phy_rx.v"
`include "paralelo_serial_phy_rx_estructural6.v"
`include "probador.v"
`include "cmos_cells.v"

module BancoPruebas; // Testbench
	// Por lo general, las señales en el banco de pruebas son wires.
	// No almacenan un valor, son manejadas por otras instancias de módulos.
	wire active, clk_4f, clk_32f;
	wire [7:0] data_out_cond, data_out_estru, data_out;
	// Descripción conductual de alarma
	paralelo_serial_phy_rx	paralelo_cond(	.data_out	(data_out_cond[7:0]),
						.active		(active),
						.clk_4f		(clk_4f),
						.clk_32f	(clk_32f)
	);
	// Descripción estructural de alarma
	paralelo_serial_phy_rx_estructural6	paralelo_estru(	.data_out	(data_out_estru[7:0]),
								.active		(active),
								.clk_4f		(clk_4f),
								.clk_32f	(clk_32f)
	);
	// Probador: generador de señales y monitor
	probador	probador(	.data_out	(data_out[7:0]),
					.active		(active),
					.clk_4f		(clk_4f),
					.clk_32f	(clk_32f)
	);
endmodule
