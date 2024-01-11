uses math;
var fi, fo: text;
    i, j, k, _, n: longint;
    A: array of int64;
    b, S: int64;

begin
    assign(fi, 'subseg.inp'); reset(fi);
    assign(fo, 'subseg.out'); rewrite(fo);
    readln(fi, n);
    setlength(A, n);
    for _ := 0 to n-1 do read(fi, A[_]);
    S := 0;
    b := 0;
    for i := 0 to n-1 do
    begin
        for j := i to n-1 do
        if a[j] >= 0 then 
        begin
            S := S + A[j];
            writeln('(2)', s, ' ', A[j]);
        end
        else
        begin
            b := A[j-1]; writeln('(3.1)', b);
            for k := j to n-1 do
            begin
                if A[k] < 0 then
                    b := b + A[k]
                else if b < b + A[k] then
                begin
                    S := S + b + A[k];
                end;
                writeln('(3)', s,' ', b, ' ',k, ' ', A[k]);
            end;
        end;
        writeln('(1)',s);
    end;
    
    close(fi);
    close(fo);
end.