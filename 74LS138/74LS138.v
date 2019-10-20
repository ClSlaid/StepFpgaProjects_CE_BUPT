//74LS138 Decoder
//Cl
//2019.10.18

module Decoder38 (input wire[2:0] ads,  //adress input
                  input wire sta,     //
                  input wire stb,
                  input wire stc,
                  output reg[7:0] min                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
                  );
    if (sta == 0 or stb == 1 or stc == 1)
        begin
            min = 8'b1111_1111;
        end
    else
        begin
            min =~ {(ads[0]) & (ad[1]) & (ad[2]),    //Y7
                    (ads[0]) & (ad[1]) & (~ad[2]),     //Y6
                    (ads[0]) & (~ad[1]) & (ad[2]),    //Y5
                    (ads[0]) & (~ad[1]) & (~ad[2]),    //Y4

                    (~ads[0]) & (ad[1]) & (ad[2]),    //Y3
                    (~ads[0]) & (ad[1]) & (~ad[2]),    //Y2    
                    (~ads[0]) & (~ad[1]) & (ad[2]),    //Y1
                    (~ads[0]) & (~ad[1]) & (~ad[2]),    //Y0
                    };
        end
endmodule
            