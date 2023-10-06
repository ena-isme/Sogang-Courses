`timescale 1ns / 1ps

module inv(
    input a,
    input b,
    input bn_1,
    output Dn,
    output Bn
);
    
assign Dn = (a^b)^bn_1;
assign Bn = ( ~(a^b) & bn_1) | (~a & b);
endmodule