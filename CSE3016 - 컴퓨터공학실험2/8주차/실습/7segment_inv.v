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
    output dp,
    output digit
);

assign a = (~w&y) | (x&y) | (w&~x&~y) | y&~z | (w&~y&~z) | (~w&~z&~x&~y) | (~w&x&~y&z);
assign b = (w&~y&z) | (~w & y & z) | (~w & ~y & ~z) | (~w  &~x) | (~x &~z);
assign c = (~w&z) | (~w & ~y & ~z) | (w&~x) | (~y&z) |(~w & x);
assign d = (x&~y&z) | (~x & y & z) | (x & y&~z) | (~w & ~x & ~z) | (w&~y&~z);
assign e =  (w & x) | (y & ~z) | (w & ~x & y) | (~x & ~z);
assign f = (w&~x) | (~y &~z) | ( w&y) | (x & ~z) | (~w & x & ~y);
assign g = (y & ~z) | (w & ~x) | (w&z) | (~x & y) | (~w & x & ~y);

assign dp = 1;
assign digit = a|b|c|d|e|f|g|dp;


endmodule