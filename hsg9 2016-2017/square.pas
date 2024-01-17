uses SysUtils, math;
var fi, fo: text;
    a: qword;
    c: real;
begin
    assign(fi, 'square.inp'); reset(fi);
    assign(fo, 'square.out'); rewrite(fo);
    readln(fi, a);
    c := sqrt(2*a**2);

    writeln(fo, c:0:2);

    close(fi);
    close(fo);
end.