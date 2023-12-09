`timescale 1ns / 1ps

module inv_tb;

reg aa,bb;

wire d0,d1,d2,d3;

inv u_inv (
.a (aa ),
.b (bb ),
.d0 (d0 ),
.d1 (d1 ),
.d2 (d2 ),
.d3 (d3 ));

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
    