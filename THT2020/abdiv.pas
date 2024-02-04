uses math;
var fi, fo: text;
    a, b, i, count: cardinal;
begin
    assign(fi, 'abdiv.inp'); reset(fi);
    assign(fo, 'abdiv.out'); rewrite(fo);
    readln(fi, a);
    readln(fi, b);
    for i := a to b do
    begin
        if (i mod 4 = 0) and (i mod 6 = 0) and (i mod 15 <> 0) then
            count := count + 1;
        if (i mod 4 = 0) and (i mod 6 <> 0) and (i mod 15 = 0) then
            count := count + 1;
        if (i mod 4 <> 0) and (i mod 6 = 0) and (i mod 15 = 0) then
            count := count + 1;
    end;
    writeln(fo, count);
    close(fi);
    close(fo);
end.