`timescale 1ns / 1ps

module inv(
    input[3:0] a,b,
    input cin,
    output[3:0] sum,
    output C4
    );
wire[3:0] s;
wire cout;
wire c1,c2,c3,c4;
wire C1,C2,C3;
    

assign s[0]=a[0]^b[0]^cin;
assign c1=(a[0]&b[0])|(cin&(a[0]^b[0]));
assign s[1]=a[1]^b[1]^c1;
assign c2=(a[1]&b[1])|(c1&(a[1]^b[1]));
assign s[2]=a[2]^b[2]^c2;
assign c3=(a[2]&b[2])|(c2&(a[2]^b[2]));
assign s[3]=a[3]^b[3]^c3;
assign c4=(a[3]&b[3])|(c3&(a[3]^b[3]));
assign cout = (c4 || (s[2] && s[3]) || (s[1] && s[3]));

assign sum[0] = s[0];
assign C1 = (0 && (s[0]^0)) || (s[0] && 0);
assign sum[1] = (s[1]^cout)^C1;
assign C2 = (s[1]&&cout) || (C1 &&(s[1] ^ cout));
assign sum[2] = (s[2]^cout)^C2;
assign C3 =  (s[2]&&cout) || (C2 && (s[2] ^ cout));
assign sum[3] = (s[3]^0)^C3;
assign C4 = (0 && s[3]) || (C3 &&(0 ^ s[3])) || cout;
endmodule