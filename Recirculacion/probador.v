module probador (
                   output reg       clk,
                   output reg [7:0] data_in0,
                   output reg [7:0] data_in1,
                   output reg [7:0] data_in2,
                   output reg [7:0] data_in3,
                   output reg       valid0,
                   output reg       valid1,
                   output reg       valid2,
                   output reg       valid3,
                   output reg IDL,
                   
                   input  probador_valid0,
                   input  probador_valid1,
                   input  probador_valid2,
                   input  probador_valid3,
                   input  [7:0] probador_in0,
                   input  [7:0] probador_in1,
                   input  [7:0] probador_in2,
                   input  [7:0] probador_in3
                   );
    initial begin
        $dumpfile("resultados_probador.vcd");
        $dumpvars;
        // Mensaje que se imprime en consola una vez
	$display ("\t\t\tclk,\tdata_in0,\tdata_in1,\tdata_in2,\tdata_in3,\tvalid0,\tvalid1,\tvalid2,\tvalid3,\tIDL,\tprobador_in0,\tprobador_in1,\tprobador_in2,\tprobador_in3,\tprobador_valid0,\tprobador_valid1,\tprobador_valid2,\tprobador_valid3");
	// Mensaje que se imprime en consola cada vez que un elemento de la lista cambia
	$monitor($time,"\t%b\t%h\t%h\t%h\t%h\t%b\t%b\t%b\t%b\t%b\t%h\t%h\t%h\t%h\t%b\t%b\t%b\t%b", clk, data_in0, data_in1, data_in2, data_in3, valid0, valid1, valid2, valid3, IDL, probador_in0, probador_in1, probador_in2, probador_in3, probador_valid0, probador_valid1, probador_valid2, probador_valid3);



    	data_in0 <= 8'b00000000;
    	data_in1 <= 8'b00000000;
    	data_in2 <= 8'b00000000;
    	data_in3 <= 8'b00000000;

      	// valid values set to 0
    	valid0 <= 0;
    	valid1 <= 0;
    	valid2 <= 0;
    	valid3 <= 0;
    	IDL <= 0;


    	@(posedge clk);
    	data_in0 <= 8'b00010001;
    	data_in1 <= 8'h22;
    	data_in2 <= 8'h33;
    	data_in3 <= 8'h44;
    	valid0 <= 1;
    	valid1 <= 1;
    	valid2 <= 1;
    	valid3 <= 1;
    	IDL <= 1;

    	@ (posedge clk);
    	data_in0 <= 8'h55;
    	data_in1 <= 8'h66;
    	data_in2 <= 8'h77;
    	data_in3 <= 8'h88;
	valid0 <= 0;
    	valid1 <= 0;
    	valid2 <= 0;
    	valid3 <= 0;
    	IDL <= 0;

    	@ (posedge clk);
    	data_in0 <= 8'h99;
    	data_in1 <= 8'hAA;
    	data_in2 <= 8'hBB;
    	data_in3 <= 8'hCC;
    	valid0 <= 1;
    	valid1 <= 1;
    	valid1 <= 1;
    	valid3 <= 1;
    	IDL <= 1;

    	@ (posedge clk);
	data_in0 <= 8'hEE;
    	data_in1 <= 8'hFF;
    	data_in2 <= 8'h11;
    	data_in3 <= 8'h22;
	valid0 <= 0;
    	valid1 <= 0;
    	valid2 <= 0;
    	valid3 <= 0;
    	IDL <= 0;

	@ (posedge clk);
	data_in0 <= 8'h22;
    	data_in1 <= 8'h33;
    	data_in2 <= 8'h44;
    	data_in3 <= 8'h55;
    	valid0 <= 1;
    	valid1 <= 1;
    	valid2 <= 1;
    	valid3 <= 1;
    	IDL <= 1;

	@ (posedge clk);
	data_in0 <= 8'h66;
    	data_in1 <= 8'h77;
    	data_in2 <= 8'h88;
    	data_in3 <= 8'h99;
	valid0 <= 0;
	valid1 <= 0;
	valid2 <= 0;
	valid3 <= 0;
	IDL <= 0;
	
	@ (posedge clk);
	data_in0 <= 8'hAA;
    	data_in1 <= 8'hBB;
    	data_in2 <= 8'hCC;
    	data_in3 <= 8'hDD;
	valid0 <= 1;
    	valid1 <= 1;
    	valid2 <= 1;
    	valid3 <= 1;
    	IDL <= 1;

   	@ (posedge clk);
	data_in0 <= 8'h00;
    	data_in1 <= 8'h00;
    	data_in2 <= 8'h00;
    	data_in3 <= 8'h00;
    	valid0 <= 0;
    	valid1 <= 0;
    	valid2 <= 0;
    	valid3 <= 0;
    	IDL <= 0;


	$finish;
	end



    initial clk <= 0;
    always	#2 clk 	<= ~clk;



endmodule
