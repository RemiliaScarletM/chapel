use BlockDist;

config var n: int = 8;

var A, B, C: [{1..n} dmapped blockDist(rank=1,boundingBox={1..n})] int;

for (a,b,i) in zip(A,B,1..n) do
  (a,b) = (i,n-i+1);

writeln(+ reduce C);
writeln(+ reduce (A+B));
