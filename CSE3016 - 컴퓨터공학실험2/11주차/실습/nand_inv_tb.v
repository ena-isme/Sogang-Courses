`timescale 1ns / 1ps

module inv_tb;
reg r,s,clk;
wire q,nq;

inv u_inv(
    .r(r ),
    .s(s ),
    .clk(clk ),
    .q(q ),
    .nq(nq )
);

initial begin
    r = 1'b0;
    s = 1'b0;
    clk = 1'b0;
end

always begin
    s = #20 ~s;
    r = #22 ~r;
    clk = #24 ~clk;
end

initial begin
    #1000
    $finish;
end

endmodule