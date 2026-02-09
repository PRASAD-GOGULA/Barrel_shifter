//4-bit barrel shifter
module barrel_shifter #(parameter N=4)(
	input [N-1:0]data,
	input [$clog2(N)-1:0]shift,
	input [1:0]mode,
	output reg [N-1:0]out
);
	always @(*) begin
		case(mode)
			2'b00:out=data<<shift; //Shift left
			2'b01:out=data>>shift; //Shift right
			2'b10:out=(shift==0)?data:(data<<shift) | (data>>(N-shift)); //Rotate left
			2'b11:out=(shift==0)?data:(data>>shift) | (data<<(N-shift)); //Rotate right
		endcase
	end
endmodule

