//FourByteAdder.v
//Cl
//2019.10.08
`include "fulladder.v"
module FourByteAdder(input wire [3:0]add1,
                     input wire [3:0]add2,
                     output wire[4:0]sum
                     );
    wire c1,c2,c3;

    HalfAdder a1(add1[0],add2[0],sum[0],c1);
    FullAdder a2(add1[1],add2[1],c1,sum[1],c2);
    FullAdder a3(add1[2],add2[2],c2,sum[2],c3);
    FullAdder a4(add1[3],add2[3],c3,sum[3],sum[4]);

endmodule

