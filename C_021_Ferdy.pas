program Hitung_Energi_Fanny;
uses crt;
var
  N, M: integer;
  X: real;
  Buff: string;
  totalEnergi: real;

begin
  clrscr;
  write('Masukan bilangan bulat N: ');
  readln(N);
  write('Masukan bilangan desimal X: ');
  readln(X);
  write('Masukan bilangan bulat M: ');
  readln(M);
  write('Masukan nilai boolean Buff: ');
  readln(Buff);


  totalEnergi := M * 15;

  totalEnergi := totalEnergi + (N * X);

  if Buff then
    totalEnergi := totalEnergi / 2;

  writeln(totalEnergi:0:0);
end.