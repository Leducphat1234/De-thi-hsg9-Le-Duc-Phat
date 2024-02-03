uses crt, math;
var n,i: integer;
    fi,fo: text;
    a,c,ma,S: cardinal;
    isfirsttime: boolean = true;
begin
    assign(fi, './balo.inp'); reset(fi);
    assign(fo, './balo.out'); rewrite(fo);
    readln(fi, n);
    S := 0;
    for i := 0 to n-1 do
    begin
        readln(fi, a, c);
        if isfirsttime then
        begin
            ma := a;
            S := c;
            isfirsttime := false;
        end;
        if ma <= a then
        begin
            ma := a;
            if S < c then
                S := c;
        end;
    end;
    writeln(fo, S);
    close(fi);
    close(fo);
end.