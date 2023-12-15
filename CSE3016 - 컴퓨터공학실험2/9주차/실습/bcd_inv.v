`timescale 1ns / 1ps

module inv(
    input w,
    input x,
    input y,
    input z,
    output a,
    output b,
    output c,
    output d,
    output e,
    output f,
    output g,
    output h,
    output i
);

assign a = ~w & ~x & ~y & z;
assign b = ~w & ~x & y & ~z;
assign c = ~w & ~x & y & z;
assign d = ~w & x & ~y & ~z;
assign e = ~w & x & ~y & z;
assign f = ~w & x & y & ~z;
assign g = ~w & x & y & z;
assign h = w & ~x & ~y & ~z;
assign i = w & ~x & ~y & z;

endmodule