uses SysUtils;
var fi, fo: text;
    s: string;
    n: longint = 0;
    mx, i: longint;

begin
    assign(fi, 'khkt.inp'); reset(fi);
    assign(fo, 'khkt.out'); rewrite(fo);
    readln(fi, s);
    for i := 1 to length(s) do
    begin
        if s[i] = '+' then n := n + 1
        else if s[i] = '-' then
            if n > 0 then n := n - 1
            else
            begin
                mx := -1;
                break;
            end;
        if mx < n then mx := n;
    end;
    writeln(mx);
    close(fi);
    close(fo);
end.