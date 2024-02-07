uses SysUtils;
const MAX = 7;
type
    vectorBool = array[1..MAX] of boolean;
    vectorStr = array of string; // DynArray
var s: string;
    origin: string;
    curStr: string;
    B: vectorBool;
    list: vectorStr;
    l: byte;
    count: longint;

procedure swap(var a, b: char);
var temp: char;
begin
    temp := a;
    a := b;
    b := temp;
end;

procedure quicksort(var s: string; left, right: shortint);
var pivot, i, j: shortint;
begin
    if left >= right then exit;
    pivot := right;
    i := left;
    j := right-1;
    while true do
    begin
        while s[i] < s[pivot] do inc(i);
        while s[j] > s[pivot] do dec(j);
        if i >= j then break;
        swap(s[i], s[j]);
    end;
    swap(s[pivot], s[i]);
    quicksort(s, left, i-1);
    quicksort(s, i+1, right);
end;
procedure Add(var list: vectorStr; v: string);
begin
    setlength(list, length(list)+1);
    list[length(list)-1] := v;
end;
function IsIn(v: string; list: vectorStr): boolean;
var _: byte;
begin
    for _ := 0 to length(list)-1 do
        if v = list[_] then exit(true);
    exit(false);
end;

procedure init;
begin
    origin := s;
    quicksort(s, 1, length(s));
    setlength(list, 0);
    Add(list, origin);
    if s <> origin then
    begin
        writeln(s);
        Add(list, s);
    end;
    curStr := s;
    fillchar(B, sizeof(B), false);
    l := length(s);
end;


procedure try(i: byte);
var j: byte;
begin
    for j := 1 to l do
    begin
        if not B[j] then
        begin
            curStr[i] := s[j];
            B[j] := true;
            if i = l then
            begin
                if not IsIn(curStr, list) then
                begin
                    writeln(curStr);
                    Add(list, curStr);
                end;
            end
            else
            begin
                try(i+1);
            end;
            B[j] := false;
        end;
    end;
end;

BEGIN
    assign(input, 'bai3.inp'); reset(input);
    assign(output, 'bai3.out'); rewrite(output);
    readln(s);
    init;
    try(1);
    count := length(list) - 1;
    if count > 0 then writeln(format('Co tat ca %d hoan vi', [count]))
    else writeln('Khong co hoan vi nao');
    close(input);
    close(output);
END.
