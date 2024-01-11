var fi, fo: text;
    A, B: array of longint;
    i, j, k, m, n: longint;
    IsValid: boolean = false;
function IsInArr(n: longint; Arr: array of longint): boolean;
begin
    for i := 0 to length(Arr)-1 do
        if n = Arr[i] then exit(true);
    exit(false);
end;

begin
    assign(fi, 'sequence.inp'); reset(fi);
    assign(fo, 'sequence.out'); rewrite(fo);
    readln(fi, m);
    setlength(A, m);
    for i := 1 to m do
    begin
        read(fi, A[i]);
    end;

    readln(fi, n);
    setlength(B, n);
    for j := 1 to n do
    begin
        read(fi, B[j]);
    end;
    
    for k := 1 to m do
    begin
        if not IsInArr(A[k], B) then
        begin
            write(fo, A[k], ' ');
            IsValid := true;
        end;
    end;
    if not IsValid then writeln('KHONG TIM THAY');

    close(fi);
    close(fo);
end.