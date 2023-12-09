`timescale 1ns / 1ps

module inv_tb;

reg a0,b0,f;

wire a,b,c,d;

inv u_inv (
.a0 (a0 ),
.b0 (b0 ),
.f (f ),
.a (a ),
.b (b ),
.c (c ),
.d (d )
);

initial begin
a0 = 1'b0;
b0 = 1'b0;
f = 1'b0;

end

always begin
a0 = #10 ~a0;
b0 = #20 ~b0;
f = #30 ~f;

end

initial begin
    #1000
    $finish;
    
end
endmodule