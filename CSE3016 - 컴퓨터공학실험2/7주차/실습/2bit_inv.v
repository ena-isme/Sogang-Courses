`timescale 1ns / 1ps

module inv(
    input a,
    input b,
    input c,
    input d,
    output f1,
    output f2,
    output f3
);
    
assign f1 = (a&~c)+(b&~c&~d)+(a&b&~d);
assign f2 = ~((b^d)|(a^c));
assign f3 = (~a&c)+(~b&c&d)+(~a&~b&d);
endmodule