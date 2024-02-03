uses SysUtils;
var fi, fo: text;
    _, n, i, j, mn, p, idx: longword;
    A, sortA: array of longword;
begin
    assign(fi, 'sort.inp'); reset(fi);
    assign(fo, 'sort.out'); rewrite(fo);
    readln(fi, n);
    setlength(A, n);
    setlength(sortA, n);
    p := 0;
    for _ := 0 to n-1 do read(fi, A[_]);
    for i := 0 to n-1 do
    begin
        mn := high(longword);
        for j := 0 to n-1 do
        begin
            if (mn > A[j]) and (A[j] > p) then mn := A[j];
            writeln(mn);
        end;
        sortA[i] := mn;
        p := mn;
    end;
    for idx in sortA do write(fo, idx, ' ');
    close(fi);
    close(fo);
end.
