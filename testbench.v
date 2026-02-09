//Testbench
`timescale 1ns/1ps
`include"design.v"
module tb;
	parameter N=4;
	reg clk;
	reg [N-1:0]data;
	reg [$clog2(N)-1:0]shift;
	reg [1:0]mode;
	wire [N-1:0]out;
	barrel_shifter dut(.data(data), .shift(shift), .mode(mode), .out(out));
	always #5 clk=~clk;
	initial begin
		clk=0;
		$display("data\tshift\tmode\tout");
		$monitor("%b \t %0d \t %b \t %b",data,shift,mode,out);
		repeat(20) begin
			data=$random%(1<<N);
			shift=$random%4;
			mode=$random%4;
			#1;
		end
		#50;
		$finish;
	end
endmodule
