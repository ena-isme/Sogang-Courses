`timescale 1ns / 1ps

module inv(
    input a,
    input b,
    input c,
    input d,
    input a0,
    input b0,
    output f
);

assign f = (a & ~b0 & ~a0) | (b & ~b0 & a0) | (~a0 & b0 & c) | (d & b0 & a0);

endmodule