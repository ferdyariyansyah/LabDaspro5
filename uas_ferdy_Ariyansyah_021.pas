program uas;
uses crt, Sysutils, math;

//label global
label error;

//variable global
var
    kode        :string;
    ulang       :integer;
    pilihan     :char;
    f           :TextFile;

//Gambar Bangun Ruang
procedure Tampilkan_Persegi(sisi: integer);
    var
        i, j: integer;

    begin
        writeln('Persegi:');
        writeln(f, 'Persegi');
        writeln;
        writeln(f);

        for i := 1 to sisi do
            begin
                for j := 1 to sisi do 
                    begin
                        write('* ');
                        append(f);      //Append untuk menambah penulisan ke dalam file txt untuk setiap perulangan for
                        write(f,'* ');
                    end;
                writeln;
                writeln(f);
            end;
        writeln;
    end;

procedure Tampilkan_Persegi_Panjang(panjang, lebar: integer);
    var
        i, j: integer;

    begin
        writeln('Persegi Panjang:');
        writeln(f, 'Persegi Panjang');
        writeln(f);
        writeln;

        for i := 1 to lebar do
            begin
                for j := 1 to panjang do
                    begin
                        write('* ');
                        append(f);
                        write(f,'* ');
                    end;
                writeln;
                writeln(f);
            end;
        writeln;
    end;

procedure Tampilkan_Segitiga_Siku(alas: integer);
    var
        i, j: integer;

    begin
        writeln('Segitiga Siku:');
        writeln(f,'Segitiga Siku:');
        writeln;
        writeln(f);

        for i := 1 to alas do
            begin
                for j := 1 to i do
                    begin
                        write('* ');
                        append(f);
                        write(f,'* ');
                    end;
                writeln;
                writeln(f);
            end;
        writeln;
    end;

procedure Tampilkan_Lingkaran(jariJari: integer);
    var
    i, j: integer;
    
    begin
        writeln('Lingkaran:');
        writeln(f,'Lingkaran:');
        writeln;
        writeln(f);
        
        for i := -jariJari to jariJari do
            begin
                for j := -jariJari to jariJari do
                    begin
                        if (i * i + j * j) <= jariJari * jariJari then
                            begin
                                write('* ');
                                append(f);
                                write(f,'* ');
                            end
                        else
                            begin
                                write(f,'  ');
                                write('  ');
                            end;
                    end;
                writeln;
                writeln(f);
            end;
        writeln;
    end;

procedure Tampilkan_Bangun_Ruang(ulang:integer);
    label error;
    begin
        clrscr;
        error:
        writeln('||==============================================||');
        writeln('||         Program Gambar Bangun Ruang          ||');
        writeln('||==============================================||');
        writeln('|| 1. Persegi                                   ||');
        writeln('|| 2. Persegi Panjang                           ||');
        writeln('|| 3. Segitiga Siku-Siku                        ||');
        writeln('|| 4. Lingkaran                                 ||');
        writeln('||==============================================||');
        write('Masukkan kode gambar bangun ruang yang diinginkan : ');
        readln(kode);
        
        case (kode) of 
            '1' : Tampilkan_Persegi(5); 
            '2' : Tampilkan_Persegi_Panjang(6, 4); 
            '3' : Tampilkan_Segitiga_Siku(5); 
            '4' : Tampilkan_Lingkaran(5);
        else 
            begin
                clrscr;
                writeln('-------------------------------------------');
                writeln('Error, silahkan masukkan kode yang tersedia');
                writeln('-------------------------------------------');
                writeln(f,'Input Error');                                   //output dari file txt jika terjadi error
                writeln(f);
                ulang += 1;
                writeln(f,'|------------------------------------|');
                writeln(f, 'Percobaan ke-', ulang);
                writeln(f,'|------------------------------------|');
                goto error;
            end;
        end;
    end;


//Logaritma
function syarat_logaritma(log:real;i:integer):real;
    label error;

    type
        recordlogaritma = record
            basis:real;
            numerus:real;
        end;

    var
        logaritma : recordlogaritma;
        hasil: ^real;

    begin
        with logaritma do begin
        writeln('Persamaan logartima ke-',i);
        writeln('-------------------------------------------');
        error:
            write('Masukkan bilangan basis : ');
            readln(basis);
                //Basis dari persamaan logaritma tidak boleh 1 ataupun negatif
                if (basis<0) or (basis=1) then begin 
                    writeln('-------------------------------------------');
                    writeln('Error, silahkan masukkan ulang');
                    writeln('-------------------------------------------');
                goto error; end;
                write('Masukkan bilangan dari numerus : ');
                readln(numerus);

            //Sifat dasar logaritma                
            if (numerus= 1) then log:=0;
            if (numerus= 0) then log:=1;
            if (basis=numerus) then log:=1;

            log:= Logn(basis,numerus);
            hasil := @log;
            syarat_logaritma:= hasil^;
            writeln('-------------------------------------------');
            write(f, basis:4:2,' log (',numerus:4:2,')');
        end;
    end;

function logaritma():real;
    label error,v;

    var
        total,x:real;
        log: array[1..100] of real;
        i,pangkat:integer;
        operasi:string;

    begin
        clrscr;
        total:=0;
        i:=1;
        writeln('===========================================');
        writeln('||               Logaritma               ||');
        writeln('===========================================');
        repeat
            begin
                if(i=1) then begin
                total:=syarat_logaritma(log[i],i);
                i:=i+1; end;
                error:
                writeln('===========================================');
                writeln('||   SIMBOL   |          OPERASI         ||');
                writeln('-------------------------------------------');
                writeln('||     +      |        PENJUMLAHAN       ||');
                writeln('||     -      |        PENGURANGAN       ||');
                writeln('||     *      |        PERKALIAN         ||');
                writeln('||     /      |        PEMBAGIAN         ||');
                writeln('||     ^      |        PERPANGAKATAN     ||');
                writeln('||     =      |        HASIL TOTAL       ||');
                writeln('===========================================');
                write('Masukkan pengoperasian  yang ingin dilakukan : ');
                readln(operasi);
                write(f, ' ', operasi, ' ');
                    case (operasi) of
                        '+' : begin
                                    x:= syarat_logaritma(log[i],i);
                                    total:= total + x;
                                end;
                        '-' : begin
                                    x:= syarat_logaritma(log[i],i);
                                    total:= total - x;
                                end;
                        '*' :   begin
                                    x:= syarat_logaritma(log[i],i);
                                    total:= total * x;
                                end;
                        '/' :  begin
                                    x:= syarat_logaritma(log[i],i);
                                    total:= total / x;
                                end;
                        '^' :   begin
                                    write('Masukkan pangkat : ');
                                    readln(pangkat);
                                    total:= power(x,pangkat);
                                    goto v;
                                end;
                        '=' :   begin if (i=1) then begin total:= x; end; end;
                                    else 
                                        writeln('-------------------------------------------');
                                        writeln('Error, silahkan masukkan kembali'); 
                                        writeln('-------------------------------------------');
                                        write(f,'(Input Error) '); 
                                        goto error;
                                end;
                            i:= i+1;
                    end;
                until ( operasi = '=');
                V:
                writeln('===========================================');
                writeln('Total : ',total:0:2); 
                writeln(f, total:0:2);
                writeln('===========================================');
    end;


//Eliminasi Gauss Jordan
procedure Gauss_Jordan;
    const
        Maksimal = 10;

    type
        Matriks = array[1..Maksimal, 1..Maksimal + 1] of Real;

    var
        A       : Matriks;
        N, i    : Integer;

procedure TukarBarisNol(var A: Matriks; i, j: Integer);
    var
        k       : Integer;
        sub     : Real;
    begin
        for k := 1 to N + 1 do
        begin
            sub := A[i, k];
            A[i, k] := A[j, k];
            A[j, k] := sub;
        end;
    end;

procedure ProsesEliminasi(var A: Matriks);
    var
        i, j, k: Integer;
        pivot : shortint;
        c: real;

    begin
        for i := 1 to N do
            begin              
                pivot := i;
                for j := i + 1 to N do
                    begin
                        if Abs(A[j, i]) > Abs(A[pivot, i]) then
                            pivot := j;
                    end;

                if pivot <> i then
                    TukarBarisNol(A, i, pivot);

                c := A[i, i];

                for j := 1 to N + 1 do
                    A[i, j] := A[i, j] / c;

                for j := 1 to N do
                    begin
                        if (i <> j) and (A[j, i] <> 0) then
                            begin
                                c := A[j, i];
                                for k := 1 to N + 1 do
                                    A[j, k] := A[j, k] - c * A[i, k];
                            end;
                    end;
            end;
    end;

procedure PrintMatriks(var A: Matriks);
    var
        i, j: Integer;
    begin
        for i := 1 to N do
            begin
                for j := 1 to N + 1 do 
                    begin
                        append(f);
                        Write(A[i, j]:8:4, ' ');
                        Write(f, A[i, j]:8:4, ' ');
                    end;
            Writeln;
            writeln(f,' '); 
            end;
    end;

procedure InputMatriks;
    var
        i, j: Integer;

    begin
        writeln('|------------------------------------|');
        writeln('| PROGRAM ELIMINASI PERSAMAAN LINEAR |');
        writeln('| DENGAN METODE GAUSS JORDAN         |');
        writeln('|------------------------------------|');
            
            repeat
                write('Masukkan jumlah variabel yang digunakan (N, 1 <= N <= ', Maksimal, '): ');
                readln(N);
            until (N >= 1) and (N <= Maksimal);
            
            writeln('Matriks : ');
            for i := 1 to N do
                begin
                    writeln('BARIS ', i, ' ');
                    writeln();
                        for j := 1 to N + 1 do
                            begin
                                writeln('kolom ', j );
                                read(A[i, j]);
                            end;
                    writeln();
                end;
    end;

begin
    clrscr;
    InputMatriks;
    clrscr;
    writeln('Bentuk Matriks:');
    writeln(f, 'Bentuk Matriks; ');
    PrintMatriks(A);
    ProsesEliminasi(A);
    writeln;
    writeln('Matriks Hasil:');
    writeln(f,'Matriks Hasil');
    PrintMatriks(A);
    writeln;
    writeln('Hasil Akhir:');
    writeln(f, 'Hasil Akhir');
    for i := 1 to N do begin
        append(f);
        writeln('x', i, ' = ', A[i, N + 1]:8:4);
        writeln(f,'x', i, ' = ', A[i, N + 1]:8:4); end;
    readln();
end;

//Statistika
procedure Mean_Median_Modus;
    var
    data, mo: array [1..100] of integer;
    i, j, n, temp, modus, moduscount: integer;
    x, median: real;

procedure urutdata(n:integer);
var
  temp,i,j: integer;
  swapped: boolean;

begin
  repeat
    swapped := False;
    for i := 1 to n-1 do
    begin
      for j := 1 to n-i do
      begin
        if data[j] > data[j + 1] then
        begin
          temp := data[j];
          data[j] := data[j + 1];
          data[j + 1] := temp;
          swapped := True;
        end;
      end;
    end;
  until (not swapped);
end;

begin
    clrscr;
    writeln('|---------------------------|');
    writeln('|PROGRAM MEAN, MEDIAN, MODUS|');
    writeln('|---------------------------|');
    write('Masukkan banyak nilai : '); readln(n);

    for i:=1 to n do 
        begin
            write('Nilai ke-',i,'=');
            readln(data[i]);
        end;

    //mencari mean 
    x := 0;
    for i:=1 to n do 
        begin
            x:=x+data[i];
        end;

    //mencari median
    urutdata(n);
        if (n mod 2 = 0) then 
            median := (data[n div 2]+data[(n div 2)+1])/2
        else 
            median := data[(n div 2)+1];

    //mencari modus 
    for i := 1 to n do begin
        mo[i] := 0;
            for j := 1 to n do begin
                if data[i] = data[j] then
                mo[i] := mo[i] + 1;
        end;
    end;

    modus := 1;
    moduscount := mo[1];

    for i := 2 to n do
    begin
        if mo[i] > moduscount then begin
        modus := i;
        moduscount := mo[i];
        end;
    end;

    writeln('============================');
    writeln('Hasil ');
    writeln('============================');
    writeln('Mean : ', x / n:4:2);
    writeln(f,'Mean : ', x / n:4:2);
    writeln('Median : ', median:4:2);
    writeln(f,'Median : ', median:4:2);

    if moduscount > 1 then
        begin
            writeln('Modus adalah : ', data[modus]);
            writeln(f, 'Modus adalah : ', data[modus]);
        end
    else
        begin
            writeln('Tidak ada modus');
            writeln(f,'Tidak ada modus');
        end;    
end;

//PROGRAM UTAMA 
begin

    //output file txt
    ulang := 1;
    assign(f,'Tugas UAS PHP.txt');
    rewrite(f);
    writeln(f,'||==============================================||');
    writeln(f,'||          Program Materi Matematika           ||');
    writeln(f,'||==============================================||');
    writeln(f,'|| 1. Gambar Bangun Ruang                       ||');
    writeln(f,'|| 2. Persamaan Logaritma                       ||');
    writeln(f,'|| 3. Eliminasi Persamaan Linear Dengan         ||');
    writeln(f,'||    Metode Gauss Jordan                       ||');
    writeln(f,'|| 4. Mean, Median, dan Modus                   ||');
    writeln(f,'||==============================================||');
        
    repeat
        clrscr; 
        error:  
        writeln('||==============================================||');
        writeln('||          Program Materi Matematika           ||');
        writeln('||==============================================||');
        writeln('|| 1. Gambar Bangun Ruang                       ||');
        writeln('|| 2. Persamaan Logaritma                       ||');
        writeln('|| 3. Eliminasi Persamaan Linear Dengan         ||');
        writeln('||    Metode Gauss Jordan                       ||');
        writeln('|| 4. Mean, Median, dan Modus                   ||');
        writeln('||==============================================||');
        
        write('Masukkan kode dari program materi matematika yang ingin dijalankan : ');
        readln(kode);
        writeln(f);
        writeln(f,'|------------------------------------|');
        writeln(f, 'Percobaan ke-', ulang);
        writeln(f,'|------------------------------------|');
        writeln(f,'');
        case (kode) of 
        '1' : Tampilkan_Bangun_Ruang(ulang); //parameter variabel 'ulang' dipakai jika terjadi error di dalam sub-program dan digunakan untuk file txt
        '2' : Logaritma;
        '3' : Gauss_Jordan; 
        '4' : Mean_Median_Modus;
        else 
            begin
                clrscr; 
                writeln('-------------------------------------------');
                writeln('Error, silahkan masukkan kode yang tersedia');
                writeln('-------------------------------------------');
                writeln(f,'Input Error');                                   
                goto error;
            end;
        end;
        writeln;
        writeln('-------------------------------------------');
        ulang += 1;
        write('Apakah Anda ingin mengulang program ?(Y/N) ');
        readln(pilihan);
        pilihan:= upcase(pilihan);
    until (pilihan <> 'Y');
    close(f);
end.