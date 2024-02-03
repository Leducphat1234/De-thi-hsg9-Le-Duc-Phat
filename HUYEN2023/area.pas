uses SysUtils, math;
var fi, fo: text;
    a, sq_area, cir_area, r: extended;
begin
    assign(fi, 'area.inp'); reset(fi);
    assign(fo, 'area.out'); rewrite(fo);
    readln(fi, a);

    sq_area := a**2;
    r := a/2;
    cir_area := r*r*3.14;

    writeln(fo, (sq_area - cir_area):0:3);


    close(fi);
    close(fo);
end.