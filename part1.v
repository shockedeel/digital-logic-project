
module Breadboard (w,x,y,z, r0, r1, r2, r3, r4, r5, r6, r7, r8, r9);
input w,x,y,z;
output r0, r1, r2, r3, r4, r5, r6, r7, r8, r9;
reg r0, r1, r2, r3, r4, r5, r6, r7, r8, r9;
always @ (w,x,y,z,r0, r1, r2, r3, r4, r5, r6, r7, r8, r9) begin

r0 = (!w) & (!x) & y & z 
|
(!w) & x & y & (!z)
|
(!w) & x & y & z
|
w & (!x) & (!y) & z
|
w & (!x) & y & z
|
w & x & (!y) & (!z)
|
w & x & (!y) & z
|
w & x & y & (!z)
|
w & x & y & z;


r1 = (!w) & (!x) & y & z 
| 
(!w) & x & (!y) & z
|
(!w) & x & y & z
| 
w & (!x) & y & z
|
w & x & (!y) & (!z)
|
w & x & (!y) & z
|
w & x & y & (!z)
| 
w & x & y & z;

r2 = (!w) & x & y & z
|
w & (!x) & y & z
|
w & x & (!y) & z
|
w & x & y & (!z)
|
w & x & y & z;

r3 = (!w) & x & y & (!z)
|
(!w) & x & y & z
|
w & (!x) & (!y) & z
|
w & (!x) & y & z
|
w & x & (!y) & z
|
w & x & y & (!z)
|
w & x & y & z;

r4 = (!w) & (!x) & y & z
|
(!w) & x & y & z
|
w & (!x) & y & z
|
w & x & y & z;

r5 = (!w) & (!x) & (!y) & (!z)
|
(!w) & (!x) & (!y) & z
|
(!w) & (!x) & y & (!z)
|
(!w) & (!x) & y & z
|
(!w) & x & (!y) & (!z)
|
w & (!x) & (!y) & (!z)
|
w & x & (!y) & (!z);

r6 = (!w) & (!x) & (!y) & z
|
(!w) & (!x) & y & (!z)
|
(!w) & (!x) & y & z
|
(!w) & x & (!y) & z
|
w & (!x) & (!y) & (!z)
|
w & x & (!y) & z;

r7 = (!w) & (!x) & y & z
|
(!w) & x & (!y) & z
|
(!w) & x & y & (!z)
|
w & (!x) & (!y) & z
|
w & (!x) & y & (!z)
|
w & x & (!y) & (!z);

r8 = (!w) & (!x) & y & z
| 
(!w) & x & y & z
|
w & (!x) & y & z
|
w & x & y & z;

r9 = (!w) & (!x) & (!y) & z
|
(!w) & (!x) & y & (!z)
|
(!w) & x & (!y) & (!z)
|
(!w) & x & y & z
|
w & (!x) & (!y) & (!z)
|
w & (!x) & y & z
|
w & x & (!y) & z
|
w & x & y & (!z);

end

endmodule

module testbench();

reg [4:0] i;
reg a;
reg b;
reg c;
reg d;

wire f0, f1, f2, f3, f4, f5, f6, f7, f8, f9;

Breadboard zap(a,b,c,d, f0,f1,f2,f3, f4, f5, f6, f7, f8, f9);

initial begin

$display("|##|A|B|C|D| F0|F1|F2|F3|F4|F5|F6|F7|F8|F9|");
$display("|==+=+=+=+=+ ==|==|==|==|==|==|==|==|==|==|");

for(i = 0; i <= 15; i= i+1)
begin
	a=(i/8)%2;
	b=(i/4)%2;
	c=(i/2)%2;
	d=(i/1)%2;

	#1000;

	$display("|%2d|%1d|%1d|%1d|%1d| %1d |%1d |%1d |%1d |%1d |%1d |%1d |%1d |%1d |%1d |", i, a,b,c,d,f0,f1,f2, f3, f4, f5, f6, f7, f8, f9);
	if(i%4==3)
		$display("|--+-+-+-+-+ --|--|--|--|--|--|--|--|--|--|");
end

#10

$finish;
end

endmodule