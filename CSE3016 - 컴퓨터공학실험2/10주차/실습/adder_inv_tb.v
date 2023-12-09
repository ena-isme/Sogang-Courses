`timescale 1ns / 1ps

module inv_tb;
reg [3:0] a,b;
reg cin;
wire [3:0] s;
wire c4;

inv u_inv(
    .a(a ),
    .b(b ),
    .cin(cin ),
    .s(s ),
    .c4(c4 )
);

initial begin
    a = 4'b0000;
    b = 4'b0000;
    cin = 1'b0;
end

always@(a or b or cin) begin
    a <= #1 a+4'b0001;
    b <= #2 b-4'b0001;
    cin <= #4 ~cin;
end

initial begin
    #100
    $finish;
end

endmodule