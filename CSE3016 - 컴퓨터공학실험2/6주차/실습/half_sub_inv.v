`timescale 1ns / 1ps

module inv(
    input a,
    input b,
    output D,
    output B
);
    
assign D = a^b;
assign B = (~a)&b;
endmodule