uses math;
var fi, fo: text;
    n, k, i, _, count, mn: cardinal;
    A: array of cardinal;
{function minOfArr(var A: array of cardinal; k: cardinal): cardinal;
var i, mn: cardinal;
begin
    mn := high(cardinal);
    for i := 0 to k-2 do
        if mn > A[i] then
             if A[i] < A[k] then
                mn := A[i];
    exit(mn);
end; }

begin
    assign(fi, 'subseg.inp'); reset(fi);
    assign(fo, 'subseg.out'); rewrite(fo);
    readln(fi, n, k);
    setlength(A, n);
    k := k - 1; // setlength consequence
    for _ := 0 to n-1 do readln(fi, A[_]);
    i := 0;
    mn := 0;
    while i < k do
    begin
        if (A[i] < A[k]) and (A[i] > mn) then
        begin
            count := count + 1;
            mn := A[i];

        end;

        i := i + 1;
    end;
    i := k;
    mn := A[k];
    while i < n do
    begin
        if (A[i] > A[k]) and (A[i] > mn) then
        begin
            count := count + 1;
            mn := A[i];

        end;

        i := i + 1;
    end;

    writeln(fo, count);
    close(fi);
    close(fo);
end.