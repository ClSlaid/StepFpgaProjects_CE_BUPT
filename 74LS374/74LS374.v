//74LS374.v
//SURPREME FILE IN PROJECT
//Cl
//2019.11.09

module top (	input wire[7:0] D,	//D inputs
				input wire OE,		//Enable (if 0)
				input wire CP,		//clock
				output reg[7:0] O);	//O outputs
				
	always@(posedge CP or posedge OE)
		begin
			if(OE)	//OE == 1, O == z
				begin
					O = 8'bzzzz_zzzz;
				end
			else
				begin
					O = D;
				end
		end

endmodule
			
