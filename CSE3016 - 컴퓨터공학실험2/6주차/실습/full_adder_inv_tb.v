`timescale 1ns / 1ps

module inv_tb;

reg aa,bb,cin;

wire s,cout;

inv u_inv (
.a (aa ),
.b (bb ),
.cin (cin),
.s (s),
.cout (cout ));

initial begin
aa = 1'b0;
bb = 1'b0;
cin = 1'b0;
end

always begin
aa = #20 ~aa;
bb = #30 ~bb;
cin = #50 ~cin;
end

initial begin
    #1000
    $finish;
    
end

endmodule
