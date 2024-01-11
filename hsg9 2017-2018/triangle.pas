var fi, fo: text;
    a, h: qword;

begin
    assign(fi, 'triangle.inp'); reset(fi);
    assign(fo, 'triangle.out'); rewrite(fo);
    readln(fi, a);
    readln(fi, h);
    writeln(fo, (a*h/2):0:2);
    close(fi);
    close(fo);
end.