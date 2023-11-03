program Hitung_Volume_LuasPermukaan;
uses crt;
var
  R, T: real;
  V, A: real;

begin
clrscr;
write('Masukan R lingkaran: ');
readln(R);
write('Masukan T lingkaran: ');
readln(T);
  V := 3.1416 * (R/2) * (R/2) * T;
  A := 2 * 3.1416 * (R/2) * (R/2 + T);

  writeln(V:0:4);
  writeln(A:0:4);
end.