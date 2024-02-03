uses math, sysutils;
var fi, fo: text;
    n, a: int64;
    i: cardinal;

function is_squared(n: int64): boolean;
begin
    if sqrt(n) = int(sqrt(n)) then
        exit(true);
    exit(false);
end;

begin
    assign(fi, './square.inp'); reset(fi);
    assign(fo, './square.out'); rewrite(fo);
    readln(fi, n);
    for i := 1 to n do
    begin
        read(fi, a);
        if is_squared(a) then write(fo, a, ' ');
    end;
    close(fi);
    close(fo);
end.