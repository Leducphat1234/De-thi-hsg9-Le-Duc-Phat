var n: integer;
    fi, fo: text;
    P : real;

begin
    assign(fi, './exp.inp'); reset(fi);
    assign(fo, './exp.out'); rewrite(fo);
    readln(fi, n);
    P := (n+1)*(n/2);
    write(fo, P:0:0);
    close(fi);
    close(fo);
end.