uses SysUtils;
var fi, fo: text;
    n, i, a, count: longword;

function IsPrime(n: longword): boolean;
var i: longword;
begin
    if (n = 2) or (n = 3) then exit(true);
    if (n mod 2 = 0) or (n mod 3 = 0) then exit(false);
    i := 5;
    while i*i <= n do
    begin
        if n mod i = 0 then exit(false);
        i := i + 2;
    end;
    exit(n > 1);
end;

begin
    assign(fi, 'bai2.inp'); reset(fi);
    assign(fo, 'bai2.out'); rewrite(fo);
    readln(fi, n);
    count := 0;
    for i := 1 to n do
    begin
        readln(fi, a);
        if isprime(a) then inc(count);
    end;
    writeln(fo, count);
    close(fi);
    close(fo);
end.