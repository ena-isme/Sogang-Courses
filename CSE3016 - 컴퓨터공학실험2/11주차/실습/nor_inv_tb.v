`timescale 1ns / 1ps

module inv_tb;
reg rr,ss,clock;
wire q,nq;

inv u_inv(
    .r(rr ),
    .s(ss ),
    .clk(clock ),
    .q(q ),
    .nq(nq )
);

initial begin
    rr = 1'b0;
    ss = 1'b0;
    clock = 1'b0;
end

always begin
    ss = #20 ~ss;
    rr = #22 ~rr;
    clock = #24 ~clock;
end

initial begin
    #1000
    $finish;
end

endmodule