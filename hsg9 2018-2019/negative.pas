uses math;
var fi, fo: text;
    i: cardinal;
    n: int64;
    S: int64 = 0;
    A: array of int64;
    is_in_negative_rank: boolean = false;

begin
    assign(fi, './negative.inp'); reset(fi);
    assign(fo, './negative.out'); rewrite(fo);
    
    readln(fi, n);
    setlength(A, n);
    for i := 0 to n - 1 do
    begin
        readln(fi, A[i]);
        if is_in_negative_rank then
        begin
            if A[i] < 0 then S := S + 1
            else
            begin
                is_in_negative_rank := false;
            end;
        end
        else if A[i] < 0 then
        begin
            is_in_negative_rank := true;
            S := 1;
        end;

    end;
    writeln(fo, S);
    close(fi);
    close(fo);
end.