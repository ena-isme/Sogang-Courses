`timescale 1ns / 1ps

module inv(data,clk,rst,res);
input data, clk,rst;
output reg res;
reg[3:0] out;
reg[3:0] target = 5'b1101;
    
always @(posedge clk)
begin
    if( rst == 1 ) 
    begin
    out = 4'b0000;
    res = 1'b0;
    end
    
    else
    begin
    out[3] = out[2];
    out[2] = out[1];
    out[1] = out[0];
    out[0] = data;
    end
    
    if(out == target) res = 1'b1;
    else res = 1'b0;
end
endmodule