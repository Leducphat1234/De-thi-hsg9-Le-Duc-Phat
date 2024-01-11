uses crt, math;
var fi, fo: text;
    n: integer;
    A: array of int64;
    i, j: integer;
    S : integer = 0;

begin
    assign(fi, './sumeven.inp'); reset(fi);
    assign(fo, './sumeven.out'); rewrite(fo);
    readln(fi, n);
    setlength(A, n);
    for i := 0 to n-1 do readln(fi, A[i]);
    for i := 0 to n-1 do
    begin
        for j := 0 to n-1 do
        begin
            if i < j then
            begin
                if (A[i] mod 2 = 0) and (A[j] mod 2 = 0) then S := S + 1
                else if (A[i] mod 2 <> 0) and (A[j] mod 2 <> 0) then S := S + 1;
                // if (A[i] + A[j]) mod 2 = 0 then S := S + 1;
            end;
        end;
    end;
    writeln(fo, S);
    close(fi);
    close(fo);
end.