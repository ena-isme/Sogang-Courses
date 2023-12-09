`timescale 1ns / 1ps

module inv_tb;

reg aa,bb,cc,dd,a0,b0;

wire f;

inv u_inv (
.a (aa ),
.b (bb ),
.c (cc ),
.d (dd ),
.a0 (a0 ),
.b0 (b0 ),
.f (f ));

initial begin
aa = 1'b0;
bb = 1'b0;
cc = 1'b0;
dd = 1'b0;
a0 = 1'b0;
b0 = 1'b0;

end

always begin
aa = #10 ~aa;
bb = #20 ~bb;
cc = #30 ~cc;
dd = #40 ~dd;
a0 = #50 ~a0;
b0 = #60 ~b0;

end

initial begin
    #1000
    $finish;
    
end
endmodule