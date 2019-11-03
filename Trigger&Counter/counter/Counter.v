//JohnsonCounter
//Cl
//2019.10.03

module Counter (input wire _tap,
                input wire clk,
                input wire rst,
                output reg[6:0] times);
    wire tap;
    debounce u1(clk,rst,_tap,tap);
    always@ (posedge clk or negedge rst)
        begin
            if(!rst)
                begin
                    times = 0;    
                end
            else if(tap)
                begin
                    times = times + 1'b1;
                end
        end
endmodule