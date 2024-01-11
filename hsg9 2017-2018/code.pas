uses SysUtils;
var fi, fo: text;
    s: string;
    ch: string[3];
    i: longint = 1;
    r: string = '';

begin
    assign(fi, 'code.inp'); reset(fi);
    assign(fo, 'code.out'); rewrite(fo);
    readln(fi, s);
    while i <= length(s) do
    begin
        ch := copy(s, i, 3);
        if trunc(StrToInt(ch)) > 128 then
        begin
            ch := copy(s, i, 2);
            r := r + chr(trunc(StrToInt(ch)));
            i := i + 2;
        end
        else
        begin
            r := r + chr(trunc(StrToInt(ch)));
            i := i + 3;
        end;
    end;
    writeln(fo, r);
    close(fi);
    close(fo);
end.