uses SysUtils;
var fi, fo: text;
    n, i, M, _, j, k, mx, l: longword;
    S: longword = 0;
    A, del_A: array of longword;

begin
    assign(fi, 'mushroom.inp'); reset(fi);
    assign(fo, 'mushroom.out'); rewrite(fo);
    readln(fi, n, M);
    setlength(A, n);
    for _ := 0 to n-1 do readln(fi, A[_]);
    del_A := A;
    for l := 0 to n-1 do S := S + A[l];
    if S <= M then mx := S
    else
        for i := 1 to n-1 do
            for j := 0 to n-1 do
            begin
                delete(del_A, j, i);
                S := 0;
                for k := 0 to length(del_A)-1 do
                begin
                    S := S + del_A[k];
                    if (mx < S) and (S <= M) then mx := S;
                end;
                del_A := A;
            end;
    writeln(fo, mx);
    close(fi);
    close(fo);
end.
