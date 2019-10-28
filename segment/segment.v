//segment.v
//SUPREME FILE IN PROJECT
//Cl
//2019.10.27

module segment (input wire[3:0] sw,//switch input
                input wire[3:0] bt,//button input
                output wire[8:0] seg1,
					 output wire[8:0] seg2);//segment output
    reg [3:0] buffer[1:0];    //buffer
    always
        begin
            buffer[1] = sw%10;//prevent overflow
            buffer[0] = (~bt)%10;//prevent overflow
        end
    decoder d1 (.data1(buffer[1]),
					 .data2(buffer[0]),
                .led1(seg1),
					 .led2(seg2));
endmodule