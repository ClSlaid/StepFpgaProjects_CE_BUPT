//FullAdder.v
//Cl
//2019.10.08

module HalfAdder(input wire add1,
                 input wire add2,
                 output wire sum,
                 output wire cout);

    assign sum = add1^add2;
    assign cout= add1&add2;

endmodule

module FullAdder(input wire add1,
                 input wire add2,
                 input wire cin,
                 output wire sum,
                 output wire cout);
    
    wire subsum;
    wire subcout_a;
    wire subcout_b;

    HalfAdder A1(add1,add2,subsum,subcout_a);
    HalfAdder A2(subsum,cin,sum,subcout_b);
    assign cout = subcout_a + subcout_b;
    
endmodule
    