//DTrigger.v
//Cl
//2019.11.03

//Basic RETrigger
module RSTrigger(input wire _s,
                 input wire _r,
                 output wire q,
                 output wire _q);
    nand g1(q,_s,_q);
    nand g2(_q,_r,q);

endmodule

//DTrigger relying on posedge
module DTrigger (input wire d,
                 input wire clk,
                 output wire q,
                 output wire _q);
                 
    wire q1,_q1,_q2;
    wire _s1;
    RSTrigger u1(.q(q1),._q(_q1),._s(_s1),._r(D));
    RSTrigger u2(/*  */._q(_q2),._s(_q1),._r(clk));//q2 is abandoned;
    RSTrigger u3(.q(q),._q(_q),._s(_q2),._r(q1));
    and Find_s1(_s1,_q2,clk);

endmodule