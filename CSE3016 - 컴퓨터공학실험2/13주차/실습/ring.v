`timescale 1ns / 1ps

module inv(
    input clk, rst, 
    output reg [3:0] out);
    
    initial out[0]= 4'b0001;
    
always @(posedge clk)
begin
    if( rst == 1 ) out = 4'b0001;
    else
    begin
        out[3] <= out[2];
        out[2] <= out[1];
        out[1] <= out[0];
        out[0] <= out[3];
     end
end
endmodule