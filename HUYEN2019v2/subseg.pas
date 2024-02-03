uses SysUtils;
var fi, fo: text;
    _, n, mx, s_cur, i: longint;
    A: array of longint;

begin
    assign(fi, 'subseg.inp'); reset(fi);
    assign(fo, 'subseg.out'); rewrite(fo);
    readln(fi, n);
    setlength(A, n);
    for _ := 0 to n-1 do read(fi, A[_]);
    mx := low(longint);
    for i := 0 to n-1 do
    begin
        s_cur := s_cur + A[i];
        if mx < s_cur then mx := s_cur;
        if s_cur < 0 then s_cur := 0;
    end;
    writeln(fo, mx);

    close(fi);
    close(fo);
end.
