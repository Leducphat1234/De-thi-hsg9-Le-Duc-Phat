uses math, StrUtils;
var fi, fo: text;
    s: ansistring;
    count: integer;
    i, c : char;


begin
    assign(fi, 'char.inp'); reset(fi);
    assign(fo, 'char.out'); rewrite(fo);
    readln(fi, s);
    for i := char(32) to char(255) do
    begin
        count := 0;
        for c in s do
            if i = c then count := count + 1;
        if count > 0 then
            writeln(fo, i, ' ', count);
    end;
        
    close(fi);
    close(fo);
end.