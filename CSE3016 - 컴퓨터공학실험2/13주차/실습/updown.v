`timescale 1ns / 1ps

module inv(
    input clk,rst,updown, 
    output reg [3:0] out, reg [6:0] seg, reg dp, reg digit);
    initial seg = 0;
    
always @(posedge clk)
begin
    if( rst == 1 ) out = 4'b0000;
    else
    begin
    if (updown == 1)
    begin
    out = out + 1;
    seg[0] = 0;
    seg[1] = 1;
    seg[2] = 1;
    seg[3] = 1;
    seg[4] = 1;
    seg[5] = 1;
    seg[6] = 0;
    end
    
    else
    begin
    out = out-1;
    seg[0] = 0;
    seg[1] = 1;
    seg[2] = 1;
    seg[3] = 1;
    seg[4] = 1;
    seg[5] = 0;
    seg[6] = 1;
    end
    
    
    dp = seg[0]|seg[1]|seg[2]|seg[3]|seg[4]|seg[5]|seg[6];
    digit = 1;
    
    end
    
end
endmodule