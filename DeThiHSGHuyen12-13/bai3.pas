uses SysUtils;
const MAXL = 6;
      MAXLS = 7;
type
    vectorChar = array[0..MAXL] of char;
    vectorBool = array[0..MAXL] of boolean;
    vectorStr = array of vectorChar;

var S: string[MAXLS];
    sortedS: string[MAXLS];
    A: vectorChar;
    l: longword;
    B: vectorBool;
    C: vectorStr;
    isOrigin: boolean;
    count: longword = 0;

procedure swap(var a, b: char);
var temp: char;
begin
    temp := a;
    a := b;
    b := temp;
end;

procedure sort(var S: string);
var j, i: longword;
begin
    sortedS := S;
    if length(S) < 2 then exit;
    for j := 1 to l-1 do
        for i := 1 to l-1 do
            if ord(sortedS[i]) >= ord(sortedS[i+1]) then
                swap(sortedS[i], sortedS[i+1]);
end;

procedure init;
begin
    fillChar(A, sizeof(A), $0);
    fillChar(B, sizeof(B), false);
    l := length(S);
    setlength(C, 2);
    C[0] := S;
    sort(S);
    if S <> sortedS then
    begin
        C[1] := sortedS;
        inc(count);
    end;
end;
procedure Add(str: vectorChar);
begin
    setlength(C, length(C)+1);
    C[length(C)-1] := str;
end;
function IsInC(var A: vectorChar): boolean; // is an array in C (a 2d array)
var i, j: longword;
begin
    for i := 0 to length(C)-1 do
    begin
        IsInC := true;
        for j := 0 to length(A)-1 do
            if A[j] <> C[i][j] then IsInc := false;
        if IsInC = true then exit;
    end;
end;

procedure try(i: longword);
var j, k: longword;
begin
    for j := 1 to l do
        if not B[j-1] then
        begin
            A[i-1] := sortedS[j];
            B[j-1] := true;
            if (i = l) then
            begin
                isOrigin := true;
                for k := 0 to l-1 do
                    if A[k] <> sortedS[k+1] then
                    begin
                        isOrigin := false;
                        break;
                    end;
                if (not isOrigin) then
                begin
                    if not IsInC(A) then
                    begin
                        for k := 0 to length(A)-1 do
                            write(A[k]);
                        writeln;
                        Add(A);
                        inc(count);
                    end;

                end;
            end
            else
                try(i+1);
            B[j-1] := false;
        end;

end;

BEGIN
    assign(input, 'bai3.inp'); reset(input);
    assign(output, 'bai3.out'); rewrite(output);
    readln(S);
    init;
    try(1);
    if count = 0 then writeln('Khong co hoan vi nao')
    else writeln(format('Co tat ca %d hoan vi', [count]));
    close(input);
    close(output);
END.
