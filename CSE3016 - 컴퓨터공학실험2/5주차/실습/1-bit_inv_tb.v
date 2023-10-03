`timescale 1ns / 1ps

module inv_tb;

reg aa,bb;

wire c,d,e,f;

inv u_inv (
.a (aa ),
.b (bb ),
.c (c ),
.d (d ),
.e (e ),
.f (f ));

initial begin
aa = 1'b0;
bb = 1'b0;
end

always begin
aa = #20 ~aa;
bb = #30 ~bb;
end

initial begin
    #1000
    $finish;
    
end

endmodule