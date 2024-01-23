uses Sysutils;
var fi, fo: text;
    A: array of byte;
    n, _, i: longword;
begin
    assign(fi, 'group.inp'); reset(fi);
    assign(fo, 'group.out'); rewrite(fo);
    readln(fi, n);
    setlength(A, n);
    for _ := 0 to n-1 do readln(fi, A[_]);

    for i := 0 to n-1 do
    begin
        S := A[i];
        for j := 0 to n-1 do
        begin
            if
        end;
    end;

    close(fi);
    close(fo);
end.
