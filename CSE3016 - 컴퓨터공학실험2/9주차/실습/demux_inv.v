`timescale 1ns / 1ps

module inv(
    input a0,
    input b0,
    input f,
    output a,
    output b,
    output c,
    output d
);

assign a = ~a0 & ~b0 & f;
assign b = a0 & ~b0 & f;
assign c = ~a0 & b0 & f;
assign d = f & b0 & a0;

endmodule