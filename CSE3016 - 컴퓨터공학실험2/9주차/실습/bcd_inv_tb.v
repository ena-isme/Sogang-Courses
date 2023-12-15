`timescale 1ns / 1ps

module inv_tb;

reg w,x,y,z;

wire aa,bb,cc,dd,ee,ff,gg,hh,ii;

inv u_inv (
.w (w ),
.x (x ),
.y (y ),
.z (z ),
.a (aa ),
.b (bb ),
.c (cc ),
.d (dd ),
.e (ee ),
.f (ff ),
.g (gg ),
.h (hh ),
.i (ii ));

initial begin
w = 1'b0;
x = 1'b0;
y = 1'b0;
z = 1'b0;

end

always begin
w = #10 ~w;
x = #20 ~x;
y = #30 ~y;
z = #40 ~z;


end

initial begin
    #1000
    $finish;
    
end
endmodule