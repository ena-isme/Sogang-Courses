`timescale 1ns / 1ps

module inv_tb;

reg clk, d,rst;
wire [3:0] out;

inv u_inv(
    .clk(clk),
    .d(d),
    .rst( rst),
    .out(out));

initial
begin
    clk = 0;
    d = 0;
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
    d <= #100 ~d;
end

initial #1000 $finish;

endmodule