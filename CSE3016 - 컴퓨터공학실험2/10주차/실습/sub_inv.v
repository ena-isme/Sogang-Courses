`timescale 1ns / 1ps

module inv(
    input[3:0] a,b,
    input cin,
    output[3:0] d, 
    output c4
    );
    
    wire c1,c2,c3;
    

assign d[0]=a[0]^b[0]^cin;
assign c1=(~(a[0]^b[0])&cin)|(~a[0]&b[0]);
assign d[1]=a[1]^b[1]^c1;
assign c2=(~(a[1]^b[1])&c1)|(~a[1]&b[1]);
assign d[2]=a[2]^b[2]^c2;
assign c3=(~(a[2]^b[2])&c2)|(~a[2]&b[2]);
assign d[3]=a[3]^b[3]^c3;
assign c4=(~(a[3]^b[3])&c3)|(~a[3]&b[3]);
    
endmodulex