uses SysUtils;
var fi, fo: text;
    _, i, j, k, count, n: longword;
    A: array of longword;
function IsSumAver(a, b: longword): boolean;
begin
    if k = (a+b)/2 then exit(true)
    else exit(false);
end;

begin
    assign(fi, 'numaver.inp'); reset(fi);
    assign(fo, 'numaver.out'); rewrite(fo);
    readln(fi, n, k);
    setlength(A, n);
    count := 0;

    for _ := 0 to n-1 do readln(fi, A[_]);
    for i := 0 to n-1 do
    begin
        for j := i to n-1 do
        begin
            if IsSumAver(A[i], A[j]) then count := count + 1;
        end;
    end;
    writeln(fo, count);

    close(fi);
    close(fo);
end.