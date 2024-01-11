uses math;
var fi, fo: text;
    a, b: real;
    x: real;


begin
    assign(fi, 'equation.inp'); reset(fi);
    assign(fo, 'equation.out'); rewrite(fo);
    readln(fi, a, b);

    if a = 0 then
    begin
        if b = 0 then
        begin
            writeln(fo, 'VSN');
        end
        else
        begin
            writeln(fo, 'VN');
        end
    end
    else
    begin
        x := -b/a;
        writeln(fo, x:0:2);
    end;
    close(fi);
    close(fo);
end.
