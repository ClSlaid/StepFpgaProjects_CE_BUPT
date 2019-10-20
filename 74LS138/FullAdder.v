//SUPREME FILE IN PROJECT
//ADDER
//Cl
//19.10.19

module top  (input wire[1:0] add,
				 input wire cin,
				 output wire sum,
				 output wire cout
				 );
	wire[7:0] temp;
	wire[7:0] opt;
	wire[2:0] ipt;
	
	assign ipt = {add,cin};
	
	Decoder38 u1(.ads(ipt),
					 .sta(1),
					 .stb(0),
					 .stc(0),
					 .min(opt)
					 );
	assign temp = ~opt;
	assign sum = temp[1] || temp[2] || temp[4] || temp[7];
	assign cout = temp[3] || temp[5] || temp[6] || temp[7];

endmodule
	
	