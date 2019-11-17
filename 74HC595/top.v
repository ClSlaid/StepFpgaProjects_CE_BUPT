//74HC595.v
//Cl
//2019.11.16
//SURPREME FILE IN PROJECT

module top  (input wire SCK,    //ShiftRegister Clock
             input wire RCK,    //LatchRegister Clock
             input wire SCLR,   //ShiftRegister Clear
             input wire OE,     //Output Enable
             input wire SI,     //Serial Input
             output reg SQH,   //Serial Data Output
             output reg[7:0] Q);//Parallel Data Output
    reg[7:0] buffer;

    always SQH = buffer[7];

    always@(negedge SCK)
        begin
            if(!SCLR)
                buffer <= 0;
            else
                buffer <= {buffer[6:0], SI};
        end
    always@(negedge RCK)
        begin
            if(!OE)
                Q <= 8'bzzzz_zzzz;
            else
                Q <= buffer;
        end

endmodule 
