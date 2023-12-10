program tugas_2;
uses crt,SysUtils;

type
    recordmatkul = record
        nama: string;
        sks: integer;
    end;

    recordmahasiswa = record
        nama: string;
        nim: string[9];
        huruf: array [1..10] of string;
        total_nilai:real;
        ip:real;
    end;

var
    matkul: array[1..10] of recordmatkul;
    mahasiswa: recordmahasiswa;
    banyak: integer; 
    i,j: integer;
    total_sks: real;
    panjang: integer; 
    f: TextFile;

function pengubah(huruf:string;sks:real):real;
var
    nilai: real;

begin
    huruf:=uppercase(huruf);
    case (huruf) of
        'A'  : huruf:= '4';
        'B+' : huruf:= '3,5';
        'B'  : huruf:= '3';
        'C+' : huruf:= '2,5';
        'C'  : huruf:= '2';
        'D'  : huruf:= '1';
        'E'  : huruf:= '0';
    end;
    nilai:= StrToFloat(huruf) * sks;
    pengubah:= nilai;
end;

begin
    clrscr;
    total_sks:= 0;
    mahasiswa.total_nilai:= 0;

    write('Masukkan banyak mata kuliah : ');
    readln(banyak);

    for i:= 1 to banyak do
        begin
            clrscr;
            writeln('Matkul [',i,']');
            writeln('==================================');
            writeln;
            write('Nama mata kuliah : ');
            readln(matkul[i].nama);
            write('SKS : ');
            readln(matkul[i].sks);
            total_sks:= total_sks + matkul[i].sks;
        end;


    clrscr;
    writeln('Mahasiswa');
    writeln('==================================');
    writeln;
    write('Masukkan nama Mahasiswa : ');
    readln(mahasiswa.nama);
    write('Masukkan NIM Mahasiswa : ');
    readln(mahasiswa.nim);

    for i:= 1 to banyak do
        begin
            write('Nilai ',matkul[i].nama,' : ');
            readln(mahasiswa.huruf[i]);
            if panjang>0 then begin
            panjang:= length(mahasiswa.huruf[i]); end;
            mahasiswa.total_nilai:= mahasiswa.total_nilai + pengubah(mahasiswa.huruf[i],matkul[i].sks);
        end;

    mahasiswa.ip:= mahasiswa.total_nilai / total_sks;

    clrscr;
    assign(f,'KHS_231401021_Ferdy Ariyansyah.txt');
    rewrite(f);
    writeln(f, 'Kartu Hasil Studi');
    writeln(f, '==================================');
    writeln(f);
    writeln(f, 'Nama : ',mahasiswa.nama);
    writeln(f, 'NIM  : ',mahasiswa.nim);
    writeln(f);
    writeln(f, '|=======================================================|');
    writeln(f, '|No |Matkul                                       |Nilai|'); 
    writeln(f, '|=======================================================|');

    for i:= 1 to banyak do
    begin
        write(f, '|',i,'. |',matkul[i].nama);
            for j:= 1 to (45 + panjang - length(matkul[i].nama)) do begin
            write(f, ' '); end;

        write(f, '|',mahasiswa.huruf[i]);
            for j:= 1 to (5 - length(mahasiswa.huruf[i])) do begin
            write(f, ' '); end;
        write(f, '|');
        writeln(f);
    end;

    writeln(f, '|=======================================================|');
    writeln(f);
    writeln(f, 'Total SKS   : ',total_sks:0:0);
    writeln(f, 'IP semester : ',mahasiswa.ip:0:2);
    close(f);
end.