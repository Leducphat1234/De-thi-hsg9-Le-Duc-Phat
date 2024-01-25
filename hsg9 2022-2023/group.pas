uses SysUtils;
const MAXIMUM = 4;
type vector = array of byte;
     Dvector = array of array of byte;
var fi, fo: text;
    n, _, i, j: longword;
    A: vector;
    Groups: Dvector;
procedure swap(var a, b: byte);
var temp: byte;
begin
    temp := a;
    a := b;
    b := temp;
end;
procedure AddE(var A: vector; n: byte);
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
procedure Merge(var G: vector; var Groups: Dvector);
var curGroup: vector;
    S, i: longword;
begin
    setlength(Groups, 0);
    sort(G);
    S := 0;
    for i := 0 to length(G) do
    begin
        if i = length(G) then
        begin
            AddE(Groups, CurGroup);
            break;
        end;
        if S + G[i] <= MAXIMUM then
        begin
            S := S + G[i];
            AddE(curGroup, G[i]);
        end
        else
        begin
            AddE(Groups, curGroup);
            S := G[i];
            setlength(curGroup, 1);
            curGroup[0] := G[i];
        end;
    end;

    {for i := 0 to length(Groups)-1 do
    begin
        for j := 0 to length(Groups[i])-1 do
            write(format('%d/%d/%d ', [Groups[i][j], i, j]));
        writeln;
    end;}
end;

BEGIN
    assign(fi, 'group.inp'); reset(fi);
    assign(fo, 'group.out'); rewrite(fo);
    readln(fi, n);
    setlength(A, n);
    for _ := 0 to n-1 do readln(fi, A[_]);

    Merge(A, Groups);
    //writeln('Length: ', length(Groups));
    writeln(fo, length(Groups));
    close(fi);
    close(fo);
END.
