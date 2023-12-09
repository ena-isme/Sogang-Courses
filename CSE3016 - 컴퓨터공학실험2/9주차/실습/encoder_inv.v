`timescale 1ns / 1ps

module inv(
    input a,
    input b,
    input c,
    input d,
    output e0,
    output e1

);
    
assign e0 = c | d;
assign e1 = b | d;

endmodule