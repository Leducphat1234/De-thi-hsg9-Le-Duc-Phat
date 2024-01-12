uses SysUtils;
{$mode objfpc}
var fi, fo: text;
    s: string;

procedure swap(var a, b: char);
var tmp: char;
begin
    tmp := a;
    a := b;
    b := tmp;
end;

procedure idx(s: string);
var i, n: integer;
begin
    n :=
    for i := 1 to length(s) do
    begin
        if pos(chr(i+48), n) <> 0 then writeln(i);
    end;

end;


begin
    assign(fi, 'bai3.inp'); reset(fi);
    assign(fo, 'bai3.out'); rewrite(fo);
    readln(fi, s);
    idx(s);

    close(fi);
    close(fo);
end.
