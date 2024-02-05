uses SysUtils;
var m, n, S: longword;
function FindWay(m, n: longword): longword;
begin
    if (m = 1) or (n = 1) then exit(1);
    FindWay := FindWay(m, n-1) + FindWay(m-1, n);
end;

BEGIN
    assign(input, 'bai3.inp'); reset(input);
    assign(output, 'bai3.out'); rewrite(output);
    readln(m, n);

    S := FindWay(succ(m), succ(n));

    writeln(S);


    close(input);
    close(output);
END.