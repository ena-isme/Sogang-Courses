`timescale 1ns / 1ps

module inv(
    input d,clk,
    output q,nq
    );
    
    assign q = ~(~(d&clk) & nq);
    assign nq  = ~(~(~d&clk) & q);

    
endmodule
