`timescale 1ns / 1ps

module inv(clk,rst,out);
input clk, rst;
output [1:0] out;
reg[1:0] out;

initial out = 2'b00;

always @(posedge clk) begin
    if (rst == 1'b1) out = 2'b00;
    else out = out + 2'b01;
end

endmodule