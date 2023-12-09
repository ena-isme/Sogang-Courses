`timescale 1ns / 1ps

module inv(
    input r,s,clk,
    output q,nq
    );
    
    assign q = ~(r&clk | nq);
    assign nq = ~(s&clk | q);

    
endmodule
