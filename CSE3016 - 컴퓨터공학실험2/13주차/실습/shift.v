`timescale 1ns / 1ps

module inv(
    input d, clk,rst, 
    output reg [3:0] out);
    
always @(posedge clk)
begin
    if( rst == 1 ) out = 4'b0000;
    else
    begin
    out[3] = out[2];
    out[2] = out[1];
    out[1] = out[0];
    out[0] = d;
    end
end
endmodule