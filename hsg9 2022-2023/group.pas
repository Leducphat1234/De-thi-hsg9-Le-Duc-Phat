uses SysUtils;
const MAXIMUM = 4;
type vector = array of byte;
     Dvector = array of array of byte;
var fi, fo: text;
    n, _, i, j: longword;
    A, list: vector;
    Groups: Dvector;
procedure swap(var a, b: byte);
var temp: byte;
begin
    temp := a;
    a := b;
    b := temp;
end;
procedure AddE(var A: vector; n: longword);
begin
    setlength(A, length(A)+1);
    A[length(A)-1] := n;
end;
procedure AddE(var A: Dvector; n: vector);
begin
    setlength(A, length(A)+1);
    A[length(A)-1] := n;
end;

procedure sort(var A: vector);
var l, i, j: longword;
begin
    l := length(A);
    for i := 0 to l-1 do
        for j := i+1 to l-1 do
            if A[i] > A[j] then swap(A[i], A[j]);
end;
function MaxIdx(const i: longword; const A: vector): longword;
var j: longword;
    S, mx: byte;
begin
    MaxIdx := i;
    mx := A[i];
    for j := i+1 to length(A)-1 do
    begin
        S := A[i] + A[j];
        if (S > mx) and (S <= MAXIMUM) then
        begin
            MaxIdx := j;
            mx := S;
        end;
    end;
    AddE(list, MaxIdx);
end;
function IsIn(var A: vector; n: byte): boolean;
var k: longword;
begin
    if length(A) = 0 then exit(false);
    for k := 0 to length(A)-1 do
        if n = A[k] then exit(true);
    exit(false);
end;

procedure Merge(var G: vector; var Groups: Dvector);
var curGroup: vector;
    S, i, m: longword;
begin
    setlength(Groups, 0);
    sort(G);
    S := 0;
    for i := 0 to length(G) do
    begin
        if not IsIn(list, i) then
        begin
            if i = length(G) then
            begin
                AddE(Groups, CurGroup);
                break;
            end;
            if S + G[i] <= MAXIMUM then
            begin
                m := MaxIdx(i, G)
                S := S + G[m];
                AddE(curGroup, G[i]);
                AddE(curGroup, G[m]);
            end
            else
            begin
                AddE(Groups, curGroup);
                S := G[i];
                setlength(curGroup, 1);
                curGroup[0] := G[i];
            end;
        end
        else continue;
    end;

    for i := 0 to length(Groups)-1 do
    begin
        for j := 0 to length(Groups[i])-1 do
            write(format('%d/%d/%d ', [Groups[i][j], i, j]));
        writeln;
    end;
end;

BEGIN
    assign(fi, 'group.inp'); reset(fi);
    assign(fo, 'group.out'); rewrite(fo);
    readln(fi, n);
    setlength(A, n);
    for _ := 0 to n-1 do readln(fi, A[_]);

    setlength(list, 0);
    Merge(A, Groups);
    //writeln('Length: ', length(Groups));
    writeln(fo, length(Groups));
    close(fi);
    close(fo);
END.
