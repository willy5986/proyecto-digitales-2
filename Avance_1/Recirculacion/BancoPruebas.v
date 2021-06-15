`timescale 1ns/100ps
// escala	unidad temporal (valor de "#1") / precisi�n

`include "probador.v"
`include "recirculacion.v"
`include "recirculacion_estructural.v"
`include "./lib/cmos_cells.v"


module BancoPruebas; // Testbench
	// Por lo general, las se�ales en el banco de pruebas son wires.
	// No almacenan un valor, son manejadas por otras instancias de m�dulos.


	//salidas del probador 
	wire [7:0] data_in0, data_in1, data_in2, data_in3;
	wire IDL, valid0, valid1, valid2, valid3;

	//para las entradas al Probador 
	wire [7:0] probador_in0, probador_in1, probador_in2, probador_in3;
	wire probador_valid0, probador_valid1, probador_valid2, probador_valid3;
	
	//para L1
	wire [7:0] L1_in0, L1_in1, L1_in2, L1_in3, L1_out0_cond, L1_out1_cond;
	wire L1_valid0, L1_valid1, L1_valid2, L1_valid3;
	
	//para las entradas al Probador (Estructural)
	wire [7:0] prob_in0_estruc, prob_in1_estruc, prob_in2_estruc, prob_in3_estruc;
	wire prob_valid0_estruc, prob_valid1_estruc, prob_valid2_estruc, prob_valid3_estruc;

	//para L1 (Estructural)
	wire [7:0] L1_in0_estruc, L1_in1_estruc, L1_in2_estruc, L1_in3_estruc;
	wire L1_valid_0_estruc, L1_valid_1_estruc, L1_valid_2_estruc, L1_valid_3_estruc;



	recirculacion	recirculacion_(
				.clk			(clk),
				.IDL 			(IDL),
				.data_in0		(data_in0[7:0]),
				.data_in1		(data_in1[7:0]),
				.data_in2		(data_in2[7:0]),
				.data_in3		(data_in3[7:0]),
				.valid0			(valid0),
				.valid1			(valid1),
				.valid2			(valid2),
				.valid3			(valid3),
				.L1_in0 		(L1_in0),
				.L1_in1 		(L1_in1),
				.L1_in2 		(L1_in2),
				.L1_in3 		(L1_in3),
				.L1_valid0		(L1_valid0),
				.L1_valid1		(L1_valid1),
				.L1_valid2		(L1_valid2),
				.L1_valid3		(L1_valid3),
				.probador_in0		(probador_in0[7:0]),
				.probador_in1		(probador_in1[7:0]),
				.probador_in2		(probador_in2[7:0]),
				.probador_in3		(probador_in3[7:0]),
				.probador_valid0	(probador_valid0),
				.probador_valid1	(probador_valid1),
				.probador_valid2	(probador_valid2),
				.probador_valid3	(probador_valid3)
							

	);




	recirculacion_estructural	recirc_estruc_(
							.clk			(clk),
							.IDL 			(IDL),
							.data_in0		(data_in0[7:0]),
							.data_in1		(data_in1[7:0]),
							.data_in2		(data_in2[7:0]),
							.data_in3		(data_in3[7:0]),
							.valid0			(valid0),
							.valid1			(valid1),
							.valid2			(valid2),
							.valid3			(valid3),
							.L1_in0 		(L1_in0_estruc),
							.L1_in1 		(L1_in1_estruc),
							.L1_in2 		(L1_in2_estruc),
							.L1_in3 		(L1_in3_estruc),
							.L1_valid0		(L1_valid0_estruc),
							.L1_valid1		(L1_valid1_estruc),
							.L1_valid2		(L1_valid2_estruc),
							.L1_valid3		(L1_valid3_estruc),
							.probador_in0		(prob_in0_estruc[7:0]),
							.probador_in1		(prob_in1_estruc[7:0]),
							.probador_in2		(prob_in2_estruc[7:0]),
							//.probador_in3		(prob_in3_estruc[7:0]),
							.probador_valid0	(prob_valid0_estruc),
							.probador_valid1	(prob_valid1_estruc),
							//.probador_valid2	(prob_valid2_estruc),
							.probador_valid3	(prob_valid3_estruc)
							

	);


	probador	probador_(	
						.clk				(clk),
						.IDL				(IDL),
						.data_in0			(data_in0[7:0]),
						.data_in1			(data_in1[7:0]),
						.data_in2			(data_in2[7:0]),
						.data_in3			(data_in3[7:0]),
						.valid0				(valid0),
						.valid1				(valid1),
						.valid2				(valid2),
						.valid3				(valid3),
						.probador_valid0		(probador_valid0),
						.probador_valid1		(probador_valid1),
						.probador_valid2		(probador_valid2),
						.probador_valid3		(probador_valid3),
						.probador_in0			(probador_in0[7:0]),
						.probador_in1			(probador_in1[7:0]),
						.probador_in2			(probador_in2[7:0]),
						.probador_in3			(probador_in3[7:0])
	);			   

endmodule
