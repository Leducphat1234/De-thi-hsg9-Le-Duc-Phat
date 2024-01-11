uses crt, math;
var a, b, c: int64;
    fi, fo: text;
    S: double;

begin
    assign(fi, './value.inp'); reset(fi);
    assign(fo, './value.out'); rewrite(fo);
    readln(fi, a);
    readln(fi, b);
    readln(fi, c);
    S := (a + b + c)/(a*b*c) + sqrt(a*b*c);
    writeln(fo, S:0:2);
    close(fi);
    close(fo);
end.