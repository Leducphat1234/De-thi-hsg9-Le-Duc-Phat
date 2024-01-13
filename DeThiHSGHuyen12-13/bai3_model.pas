program AllUniquePermutationsSorted;

var
  wd, temp, sortedWord: string;
  i, j, uniqueCount: integer;
  isUnique: boolean;

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
    if temp <> wd then // Kiểm tra xem hoán vị có bằng word hay không
    begin
      writeln(temp);
      Inc(uniqueCount);
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

procedure SortAndPrintPermutations(wd: string);
var
  i, j: integer;
begin
  uniqueCount := 0;
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

    if Pos(wd, temp) = 0 then // Kiểm tra xem hoán vị có chứa từ ban đầu hay không
    begin
      Permute(1, Length(temp));
    end;
  until i > Length(sortedWord);

  writeln('Tổng số hoán vị: ', uniqueCount);
end;

begin
  wd := 'BOOK'; // từ tiếng Anh cho trước
  SortAndPrintPermutations(wd);
end.
