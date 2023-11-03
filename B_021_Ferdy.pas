program Bilangan_Ganjil_Kelipatan_Tiga;
uses crt;
var
  N, i, jumlah, banyak: integer;
begin
clrscr;
  writeln('Masukkan nilai N: ');
  readln(N);
  
  banyak := 0;
  jumlah := 0;
  
  writeln('Bilangan ganjil kelipatan 3 dari ', N, ' sampai 1:');
  for i := N downto 1 do
  begin
    if (i mod 2 = 1) and (i mod 3 = 0) then
    begin
      write(i, ' ');
      banyak := banyak + 1;
      jumlah := jumlah + i;
    end;
  end;
  
  writeln;
  writeln('Banyaknya bilangan: ', banyak);
  writeln('Jumlah semua bilangan: ', jumlah);
end.