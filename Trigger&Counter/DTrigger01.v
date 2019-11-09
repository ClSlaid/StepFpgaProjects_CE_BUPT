//DTrigger.v
//Cl
//2019.11.09

module DTrigger (input wire D,      //D input
                 input wire clk,    //clock
                 input wire clr,    //clear     clear + preset >= 1
                 input wire prs,    //preset    clear + preset >= 1
                 output reg Q,      //Q out
                 output reg _Q);    //_Q out    _Q == !Q
    always _Q = !Q;
    always@(posedge clk or negedge clr or negedge prs)
        begin
            if(!clr)    //clr == 0 , Q = 0
                begin
                    Q = 0;    
                end
            else if(!prs)
                begin
                    Q = 1;
                end
            else
                begin
                    Q = D;
                end
        end

endmodule
