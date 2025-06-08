# Diskusi 7 - Pemrograman R

## soal-1.R
Program ini membangkitkan data berdistribusi binomial dengan parameter:
- n = 30 (jumlah observasi)
- size = 10 (ukuran percobaan)
- prob = 0.3 (peluang sukses)

Data ditampilkan dalam bentuk matriks 6x5 beserta ringkasan statistiknya.

**Output:**
```
=== PERTANYAAN 1: Data Binomial ===
Data binomial dalam bentuk matriks (6 baris x 5 kolom):
     [,1] [,2] [,3] [,4] [,5]
[1,]    2    5    0    4    3
[2,]    1    4    4    4    3
[3,]    2    3    2    5    3
[4,]    4    3    3    3    3
[5,]    1    4    1    4    6
[6,]    4    1    4    1    3

Ringkasan statistik data binomial:
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
  0.000   2.000   3.000   3.033   4.000   6.000 
```

## soal-2.R
Program ini membuat plot distribusi Chi-square dengan derajat kebebasan (df) = 1. Plot menunjukkan fungsi kepadatan probabilitas (PDF) dengan sumbu x dari 0 hingga 5.

**Output:**
Program akan menghasilkan grafik distribusi Chi-square dan menampilkan pesan:
```
=== PERTANYAAN 2: Plot Distribusi Chi-square ===
Plot fungsi kepadatan distribusi chi-square dengan df=1 telah dibuat.
```

## soal-3a.R
Program ini merupakan kalkulator sederhana interaktif yang dapat mengevaluasi ekspresi matematika yang dimasukkan pengguna. Program akan terus berjalan sampai pengguna memasukkan perintah keluar ('quit', 'q', 'exit', 'x', 'wq', atau 'selesai').

**Output:**
```
--- Contoh 1: Kalkulator Sederhana ---
Masukkan ekspresi matematika (atau 'quit' untuk keluar): 2+2
Input: 2+2 
Hasil: 4 

Masukkan ekspresi matematika (atau 'quit' untuk keluar): 3*5+2
Input: 3*5+2 
Hasil: 17 

Masukkan ekspresi matematika (atau 'quit' untuk keluar): quit
```

## soal-3b.R
Program ini menghitung Body Mass Index (BMI) dan menentukan kategori berat badan berdasarkan BMI. Kategori yang digunakan adalah:
- Kurus: BMI < 18.5
- Normal: 18.5 ≤ BMI < 25
- Gemuk: 25 ≤ BMI < 30
- Obesitas: BMI ≥ 30

**Output:**
```
--- Contoh 2: Kalkulator BMI ---
Input: Berat = 70 kg, Tinggi = 1.75 m
Hasil: BMI = 22.86 - Kategori: Normal 
Input: Berat = 55 kg, Tinggi = 1.6 m
Hasil: BMI = 21.48 - Kategori: Normal 
Input: Berat = 90 kg, Tinggi = 1.7 m
Hasil: BMI = 31.14 - Kategori: Obesitas 
```

## Menjalankan Program
Untuk menjalankan program, gunakan perintah:
```
Rscript nama_file.R
```

Misalnya:
```
Rscript soal-1.R
``` 