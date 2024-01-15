uses SysUtils;
var fi, fo: text;
    d: qword;
    n: qword;
function sum_divisor(n: qword): qword;
var S: qword;
    i: longword;
begin
    S := 1;
    for i := 2 to n div 2 do
        if n mod i = 0 then S := S + i;
    exit(S);
end;

begin
    assign(fi, 'bai1.inp'); reset(fi);
    assign(fo, 'bai1.out'); rewrite(fo);
    readln(fi, n);
    d := sum_divisor(n);
    if d > n then writeln(fo, 1)
    else writeln(fo, -1);
    writeln(fo, d);

    close(fi);
    close(fo);
end.