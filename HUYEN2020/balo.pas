uses SysUtils;
type vector = array of longword;
var _, n, S, mxA, mxC, i, j, k: longword;
    A, C: vector;

BEGIN
    assign(input, 'balo.inp'); reset(input);
    assign(output, 'balo.out'); rewrite(output);
    readln(n);
    setlength(A, n);
    setlength(C, n);
    for _ := 0 to n-1 do readln(A[_], C[_]);

    mxC := C[i];
    for i := 0 to n-1 do
    begin
        for k := 0 to n-1-i do
        begin
            mxA := A[i];
            S := C[i];
            j := i+1 + k;
            while j < n do
            begin
                if mxA < A[j] then
                begin
                    S := S + C[j];
                    mxA := A[j];
                end;
                inc(j);
            end;
            if mxC < S then mxC := S;
        end;
    end;
    writeln(mxC);

    close(input);
    close(output);
END.
