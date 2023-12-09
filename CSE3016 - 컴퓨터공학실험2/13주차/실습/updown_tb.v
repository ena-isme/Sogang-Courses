`timescale 1ns / 1ps

module inv_tb;

reg clk, rst, updown;
wire [3:0] out;
wire [6:0] seg;
wire dp, digit;

inv u_inv(
    .clk(clk),
    .rst( rst),
    .updown( updown),
    .out( out),
    .seg( seg),
    .dp( dp),
    .digit( digit));

initial
begin
    clk = 0;
    rst = 0;
    updown = 0;
end

initial
begin
    #50 rst = 1;
    #70 rst = 0;
end

always @(clk)
begin
    clk <= #10 ~clk;
    updown <= #20 ~updown;
end

initial #1000 $finish;

endmodule