`timescale 1ns / 1ps

module inv_tb;

reg aa,bb,bn_1;

wire Dn,Bn;

inv u_inv (
.a (aa ),
.b (bb ),
.bn_1 (bn_1),
.Dn (Dn),
.Bn (Bn ));

initial begin
aa = 1'b0;
bb = 1'b0;
bn_1 = 1'b0;
end

always begin
aa = #20 ~aa;
bb = #30 ~bb;
bn_1 = #40 ~bn_1;
end

initial begin
    #1000
    $finish;
    
end

endmodule
