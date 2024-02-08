uses SysUtils;
var n, k, S: longword;

function divideGroup(n: longword): longword;
var g1, g2: longword;
begin
    g1 := n div 2 + k div 2;
    g2 := n - g1;
    if (g1 = 0) or (g2 = 0) or (abs(g1 - g2) <> k) then exit(1);
    divideGroup := divideGroup(g1) + divideGroup(g2);
end;

BEGIN
     assign(input, 'explore.inp'); reset(input);
     assign(output, 'explore.out'); rewrite(output);
     readln(n, k);

     S := divideGroup(n);

     writeln(S);
     close(input);
     close(output);
END.
