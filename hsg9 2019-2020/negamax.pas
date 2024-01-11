uses crt, math;
var fi, fo: text;
    nm: int64;
    A: array of int64;
    n, i: integer;
    isfirsttime: boolean = true;

begin
    assign(fi, './negamax.inp'); reset(fi);
    assign(fo, './negamax.out'); rewrite(fo);
    readln(fi, n);
    setlength(A, n);
    for i := 0 to n - 1 do
    begin
        read(fi, A[i]);
        if isfirsttime and (A[i] < 0) then
        begin
            nm := A[i];
            isfirsttime := false;
        end;
        if (A[i] < 0) and (A[i] > nm) then nm:= A[i];
    end;
    writeln(fo, nm);
    close(fi);
    close(fo);
end.
