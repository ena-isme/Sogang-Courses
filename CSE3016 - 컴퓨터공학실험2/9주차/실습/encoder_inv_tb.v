`timescale 1ns / 1ps

module inv_tb;

reg aa,bb,cc,dd;

wire e0,e1;

inv u_inv (
.a (aa ),
.b (bb ),
.c (cc ),
.d (dd ),
.e0 (e0 ),
.e1 (e1 ));

initial begin
aa = 1'b0;
bb = 1'b0;
cc = 1'b0;
dd = 1'b0;
end

always begin
aa = #20 ~aa;
bb = #30 ~bb;
cc = #30 ~cc;
dd = #30 ~dd;
end

initial begin
    #1000
    $finish;
end

endmodule
    