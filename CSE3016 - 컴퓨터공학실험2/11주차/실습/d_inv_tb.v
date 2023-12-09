`timescale 1ns / 1ps

module inv_tb;
reg dd,clock;
wire q,nq;

inv u_inv(
    .d(dd ),
    .clk(clock ),
    .q(q ),
    .nq(nq )
);

initial begin
    dd = 1'b0;
    clock = 1'b0;
end

always begin
    clock = #50 ~clock;
     dd = #100 ~dd;
end

initial begin
    #1000
    $finish;
end

endmodule