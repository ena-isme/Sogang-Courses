`timescale 1ns / 1ps

module inv_tb;

reg clk, rst;
wire [3:0] out;

inv u_inv(
    .clk(clk),
    .rst( rst),
    .out(out));

initial
begin
    clk = 0;
    rst = 0;
end

initial
begin
    #50 rst = 1;
    #70 rst = 0;
end

always @(clk)
begin
    clk <= #10 ~clk;
end

initial #1000 $finish;

endmodule