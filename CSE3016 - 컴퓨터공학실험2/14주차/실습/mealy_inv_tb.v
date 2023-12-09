`timescale 1ns / 1ps

module inv_tb;

reg clk, data, rst;
wire res;

inv u_inv(
    .clk( clk),
    .data( data),
    .rst( rst),
    .res( res)
);

initial
begin
    clk = 0;
    data = 0;
    rst = 1;
end
always clk = #20~clk;

always@(rst)begin
rst=#30~rst;
end

always@(data)begin
data=#60~data;
data=#20~data;

data=#20~data;
data=#20~data;

data=#60~data;
data=#20~data;

data=#20~data;
data=#20~data;

data=#60~data;
data=#20~data;

data=#20~data;
data=#20~data;

data=#60~data;
data=#20~data;
end

initial begin
#760
$finish;
end

endmodule
