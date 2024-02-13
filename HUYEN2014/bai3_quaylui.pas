uses SysUtils;
type figure = array[1..18] of char;
     vector = array of figure;
var m, n, _, l: byte;
    S: string[18];
    A: figure;
    B: array[1..18] of boolean;
    C: vector;
    count: longword = 0;

function isin(A: figure; C: vector): boolean;
var i: longword;
begin
    for i := 0 to length(C) - 1 do
        if A = C[i] then exit(true);
    exit(false);
end;


procedure push(v: figure);
begin
    setlength(C, length(C) + 1);
    C[length(C)-1] := v;
end;

procedure init;
begin
    readln(m, n);
    l := n + m;
    for _ := 1 to m do S := S + 'L';
    for _ := 1 to n do S := S + 'P';
    setlength(C, 0);
    push(S);
    inc(count);
end;

procedure Try(i: longword);
var j: longword;
begin
    for j := 1 to l do
    begin
        if not B[j] then
        begin
            A[i] := S[j];
            B[j] := true;
            if i = l then
            begin
                if not isin(A, C) then
                begin
                    push(A);
                    inc(count);
                end;
            end
            else Try(i + 1);
            B[j] := false;
        end;
    end;
end;

BEGIN
    assign(input, 'bai3.inp'); reset(input);
    assign(output, 'bai3.out'); rewrite(output);
    init;

    Try(1);

    writeln(count);

    close(input);
    close(output);
END.