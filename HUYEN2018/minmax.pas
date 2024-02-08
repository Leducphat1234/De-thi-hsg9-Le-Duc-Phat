uses math;
var fi, fo: text;
    n, i, j, cur, _: longword;
    A: array of int64;
    mn, mx: qword;

begin
    assign(fi, 'minmax.inp'); reset(fi);
    assign(fo, 'minmax.out'); rewrite(fo);
    readln(fi, n);
    setlength(A, n);
    for _ := 0 to length(A)-1 do readln(fi, A[_]);
    
    mn:= high(qword);
    mx:= 0;
    for i := 0 to n-1 do
    begin
        for j := i+1 to n-1 do
        begin
            if i <> j then
            begin
                cur := abs(A[i] + A[j]);
                if mn > cur then mn := cur;
                if mx < cur then mx := cur;
            end;
        end;
    end;
    writeln(fo, mn);
    writeln(fo, mx);

    close(fi);
    close(fo);
end.
