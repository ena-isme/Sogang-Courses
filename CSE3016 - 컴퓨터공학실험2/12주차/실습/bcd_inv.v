`timescale 1ns / 1ps

module inv(clk,rst,out);
   input clk, rst;
    output [3:0] out;
    reg [3:0] out,tmp;
    
always @(posedge clk) begin
    if(rst==1'b1) out=4'b0000;
    else out=out+4'b0001;
    
    if(out==4'b0101) begin
    tmp[3]=out[3];
    tmp[2]=out[2];
    tmp[1]=out[1];
    tmp[0]=out[0];
    out[3]<=tmp[3]|~(~(tmp[2]&tmp[0])&~(tmp[2]&tmp[1]));
    out[2]<=tmp[3]|~(~(tmp[2]&~tmp[0])&~(tmp[2]&tmp[1]));
    out[1]<=tmp[3]|~(~(~(~(tmp[2]&tmp[0])|tmp[1]))&~(~(tmp[2]|~tmp[1])));
    out[0]<=tmp[0];
    
    end
end
endmodule