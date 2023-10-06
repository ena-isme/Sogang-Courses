`timescale 1ns / 1ps

module inv_tb;

reg aa,bb;

wire D,B;

inv u_inv (
.a (aa ),
.b (bb ),
.D (D),
.B (B ));

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
