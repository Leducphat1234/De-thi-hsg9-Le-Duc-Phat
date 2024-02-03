uses math;
var fi, fo: text;
    n, k: int64;
    modulus: int64 = 0;
    i: cardinal;
begin
    assign(fi, './mod.inp'); reset(fi);
    assign(fo, './mod.out'); rewrite(fo);
    readln(fi, n, k);
    for i:= 1 to n do
        modulus := modulus + (i**2 mod k);
    writeln(fo, modulus mod k);

    close(fi);
    close(fo);
end.