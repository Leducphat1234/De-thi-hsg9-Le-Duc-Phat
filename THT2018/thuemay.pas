uses SysUtils;
type vector = array of longword;
var n, _: longword;
    A, B, C: vector;
    S: qword = 0;
    blacklist: vector; // khach hang co so tien it hon se dua vao danh sach den

procedure Add(var A: vector; v: longword);
begin
    setlength(A, length(A)+1);
    A[length(A)-1] := v;
end;
function IsIn(v: longword; var A: vector): boolean;
var i: longword;
begin
    if length(A) < 1 then exit(false);
    for i := 0 to length(A)-1 do
        if v = A[i] then exit(true);
    exit(false);
end;

procedure compare(var C: vector; i, j: longword);
begin
    if C[i] > C[j] then Add(blacklist, j)
    else if C[i] <= C[j] then Add(blacklist, i);
end;

procedure serve(var A, B, C: vector);
var i, j, k, l: longword;
begin
    for i := 0 to n-1 do
    begin
        for j := i+1 to n-1 do
            for k := A[i] to B[i] do
                for l := A[j] to B[j] do
                    if k = l then
                        if (not IsIn(i, blacklist)) or (not IsIn(j, blacklist)) then
                            compare(C, i, j);
    end;
end;

BEGIN
    assign(input, 'thuemay.inp'); reset(input);
    assign(output, 'thuemay.out'); rewrite(output);
    readln(n);
    setlength(A, n);
    setlength(B, n);
    setlength(C, n);
    setlength(blacklist, 0);
    for _ := 0 to n-1 do
        readln(A[_], B[_], C[_]);

    serve(A, B, C);

    for _ := 0 to n-1 do
        if not IsIn(_, blacklist) then
            S := S + C[_];
    writeln(S);

    close(input);
    close(output);
END.