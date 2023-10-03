`timescale 1ns / 1ps

module inv(
    input a,
    input b,
    input c,
    input d,
    output x,
    output y,
    output z
);
    
assign x = a&b;
assign y = c&d;
assign z = ~(x|y);

endmodule