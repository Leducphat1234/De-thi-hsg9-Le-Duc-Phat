uses {games,} math, SysUtils; // dung random tao ham giong games
var
    a,b: longword;
    guess: byte;
    A_FROM_COM, B_FROM_COM: longword;
    Howtimes: longint = 0;
const
    MAXAB = 1000000;
    MAX_AB = 100;

function Num(n: longword): byte;
begin
    Howtimes := Howtimes + 1;
    if (n >= A_FROM_COM) and (n <= B_FROM_COM) then exit(0)
    else if n < A_FROM_COM then exit(-1)
    else if n > B_FROM_COM then exit(1);
end;

procedure findRange(n, x: longword); // n la so mu, x la co so dang x*10**n
var i, j: longword;
begin
    for i := 0 to 9 do
        Guess := Num(x*10**(n+1) +  i*10**n);
        if guess > 0 then findRange(n-1, i-1)
        else if guess = 0 then
        begin
            for j := 1 to MAX_AB-1 do
            begin
                if Num(x*10**(n+1) +  i*10**n + i) > 0 then
                    b := x*10**(n+1) +  i*10**n + i-1;
                if Num(x*10**(n+1) +  i*10**n - i) < 0 then
                    a := x*10**(n+1) +  i*10**n - i+1;
            end;

            exit;
        end;
end;
procedure games_simulator(var a, b: longword);
begin
    randomize;
    a := random(MAXAB);
    b := a - random(MAX_AB);
end;


begin
    games_simulator(A_FROM_COM, B_FROM_COM);
    findRange(6, 0);
    writeln(format('a, b: %d %d', [a, b]));
    writeln(format('expected: %d %d', [A_FROM_COM, B_FROM_COM]));
    writeln(format('times: %d', [Howtimes]));
end.
