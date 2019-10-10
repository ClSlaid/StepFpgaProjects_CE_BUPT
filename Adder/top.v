//top.v
//SUPREME FILE IN PROJECT
//Cl
//2019.10.08

module top( input wire [3:0]sw,     //switches, used as keyboard
            input wire [1:0]bt,     //buttons, used as command keys
            input wire clk,         //clock
            output reg [8:0]seg1,   //number of 10s
            output reg [8:0]seg2,   //number of 1s
            output reg [2:0]led     //mode showing
            );
    
    reg [3:0] add[1:0];
    reg [4:0] sum;
    reg [2:0] mode;
    wire [4:0] value;
    wire enter , rst;
    always led = ~mode;
    assign rst = bt[1];
	 
	 reg[3:0]Esw;
	 reg[4:0]Esum;
	 assign value = (sw & Esw)+(sum & Esum);
	 
    debounce u1(.clk(clk),.rst(rst),.key(bt[0]),.key_pulse(enter));
    FourByteAdder F1(add[0],add[1],sum);
    Decoder D1(value,seg1,seg2);

    always@(posedge clk or negedge rst)
        begin
				if(!rst)
					begin
					mode = 3'b001;                      //initializing
					//value = {1'b0,sw};                   //screen shows value of switch
					Esw=4'b1111;
					Esum=5'b0;
					end
				else if(mode == 3'b001 && enter == 1)
                begin
                add[0] <= sw;
                mode <= 3'b010;
                end
            else if(mode == 3'b010 && enter == 1)
                begin
                add[1] <= sw;
                mode <= 3'b100;
                //value <= sum;                  //screen shows value of sum
                Esw=4'b0;
					 Esum=5'b11111;
					 end
            else
                ;
        end
endmodule