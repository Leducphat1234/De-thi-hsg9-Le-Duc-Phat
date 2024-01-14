program AllUniquePermutationsSorted;

var
    wd, temp, sortedWord: string;
    i, j: integer;
    permutations: array of string;
    permutationCount: integer;

procedure Swap(var a, b: char);
var
    temp: char;
begin
    temp := a;
    a := b;
    b := temp;
end;

procedure Permute(left, right: integer);
var
    i: integer;
begin
    if left = right then
    begin
        if temp <> wd then
        begin
            permutations[permutationCount] := temp;
            Inc(permutationCount);
        end;
    end
    else
    begin
        for i := left to right do
        begin
            if (i = left) or ((temp[i] <> temp[left]) and (temp[i] <> temp[i - 1])) then
            begin
                Swap(temp[left], temp[i]);
                Permute(left + 1, right);
                Swap(temp[left], temp[i]);
            end;
        end;
    end;
end;

procedure SortPermutations();
var
    i, j: integer;
    temp: string;
begin
    for i := 0 to permutationCount - 1 do
    begin
        for j := i + 1 to permutationCount - 1 do
        begin
            if permutations[i] > permutations[j] then
            begin
                temp := permutations[i];
                permutations[i] := permutations[j];
                permutations[j] := temp;
            end;
        end;
    end;
end;

procedure PrintPermutations();
var
    i: integer;
begin
    writeln('Các hoán vị theo thứ tự từ điển:');
    for i := 0 to permutationCount - 1 do
    begin
        writeln(permutations[i]);
    end;
    writeln('Tổng số hoán vị: ', permutationCount);
end;

procedure SortAndPrintPermutations(wd: string);
begin
    permutationCount := 0;
    SetLength(permutations, 24);
    sortedWord := wd;
    for i := 1 to Length(sortedWord) - 1 do
    begin
        for j := i + 1 to Length(sortedWord) do
        begin
            if sortedWord[i] > sortedWord[j] then
            begin
                Swap(sortedWord[i], sortedWord[j]);
            end;
        end;
    end;

    temp := '';
    i := 1;
    repeat
        temp := '';
        for j := 1 to Length(sortedWord) do
        begin
            temp := temp + sortedWord[i];
            Inc(i);
        end;

        if Pos(wd, temp) = 0 then
        begin
            Permute(1, Length(temp));
        end;
    until i > Length(sortedWord);

    SortPermutations();
    PrintPermutations();
end;

begin
    wd := 'BOOK'; // từ tiếng Anh cho trước
    SortAndPrintPermutations(wd);
end.
