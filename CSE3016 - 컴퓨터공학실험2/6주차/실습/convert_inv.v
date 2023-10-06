`timescale 1ns / 1ps

module inv(
    input a,
    input b,
    input c,
    input d,
    output w,
    output x,
    output y,
    output z
);
    
assign w = a | ( b & d ) | ( b & c);
assign x = a | ( b & c ) | ( b & ~d);
assign y = a | ( ~b & c ) | ( d & b & ~c );
assign z = d;
endmodule 