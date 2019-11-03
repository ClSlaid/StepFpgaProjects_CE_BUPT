//
//
module top (input wire tap,
            input wire clk,
            input wire rst,
            output wire[8:0] seg0,
				output wire[8:0] seg1);
    wire[6:0] times;
    Counter c1(tap,clk,rst,times);

    reg[3:0]num1;
    reg[3:0]num0;

    always num1 = times/10;
    always num0 = times%10;
    decoder d1(.led2(seg1),.led1(seg0),.data2(num1),.data1(num0));

endmodule

module decoder (input wire[3:0] data1,
					 input wire[3:0] data2,
                output wire[8:0] led1,
					 output wire[8:0] led2);
    reg[8:0] seg[9:0];
	 initial
        begin
           seg[0] = 9'h3f;                                           //对存储器中第一个数赋值9'b00_0011_1111,相当于共阴极接地，DP点变低不亮，7段显示数字  0
	        seg[1] = 9'h06;                                           //7段显示数字  1
	        seg[2] = 9'h5b;                                           //7段显示数字  2
	        seg[3] = 9'h4f;                                           //7段显示数字  3
	        seg[4] = 9'h66;                                           //7段显示数字  4
	        seg[5] = 9'h6d;                                           //7段显示数字  5
	        seg[6] = 9'h7d;                                           //7段显示数字  6
	        seg[7] = 9'h07;                                           //7段显示数字  7
	        seg[8] = 9'h7f;                                           //7段显示数字  8
	        seg[9] = 9'h6f;                                           //7段显示数字  9
        end
    assign led1 = seg[data1];
    assign led2 = seg[data2];
endmodule