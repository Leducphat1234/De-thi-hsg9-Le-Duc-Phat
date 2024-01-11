uses math;
var n, i: cardinal;
    S: cardinal = 0;
    fi, fo: text;

begin
    assign(fi, 'exp.inp'); reset(fi);
    assign(fo, 'exp.out'); rewrite(fo);
    readln(fi, n);
    for i := 1 to n do
        S := S + i*(i+1);
    writeln(fo, S);
    close(fi);
    close(fo);
end.