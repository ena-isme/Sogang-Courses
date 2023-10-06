`timescale 1ns / 1ps

module inv(
    input a,
    input b,
    input cin,
    output s,
    output cout
);
    
assign s = (a^b)^cin;
assign cout = ( cin & (a^b))|(a&b);
endmodule