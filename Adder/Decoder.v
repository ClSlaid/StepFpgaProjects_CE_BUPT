//Decoder.v
//Cl
//2019.10.08

module Decoder (input wire[4:0] value,
                output wire[8:0] seg1,
                output wire[8:0] seg2);
    
	reg[8:0] ch[9:0];
	initial
	begin
		ch[0] = 9'h3f;                                           //对存储器中第一个数赋值9'b00_0011_1111,相当于共阴极接地，DP点变低不亮，7段显示数字  0
	   ch[1] = 9'h06;                                           //7段显示数字  1
	   ch[2] = 9'h5b;                                           //7段显示数字  2
	   ch[3] = 9'h4f;                                           //7段显示数字  3
	   ch[4] = 9'h66;                                           //7段显示数字  4
	   ch[5] = 9'h6d;                                           //7段显示数字  5
	   ch[6] = 9'h7d;                                           //7段显示数字  6
	   ch[7] = 9'h07;                                           //7段显示数字  7
	   ch[8] = 9'h7f;                                           //7段显示数字  8
	   ch[9] = 9'h6f;                                           //7段显示数字  9
	end
	
	assign seg1 = ch[value/10];
	assign seg2 = ch[value%10];

endmodule