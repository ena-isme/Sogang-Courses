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
    
assign x = ~(a&b);
assign y = ~(x&c);
assign z = ~(y&d);

endmodule