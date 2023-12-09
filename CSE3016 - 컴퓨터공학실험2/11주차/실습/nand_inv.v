`timescale 1ns / 1ps

module inv(
    input r,s,clk,
    output q,nq
    );
    
    assign q = ~(~(s&clk) & nq);
    assign nq = ~(~(r&clk) & q);

    
endmodule
