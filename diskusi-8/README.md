# Diskusi 8 - Program R untuk Pemrograman Komputer I

Repositori ini berisi program R yang mendemonstrasikan konsep pemrograman dasar seperti loop, kondisi, file I/O, dan manipulasi data.

## Daftar File dan Tujuan Program

### 1. soal1.R
**Tujuan:** Program untuk menampilkan bilangan genap dari 1 sampai 10 menggunakan loop dan kondisi.

**Cara menjalankan:**
```bash
Rscript soal1.R
```

**Output:**
```
Bilangan genap dari 1 sampai 10:
2  4  6  8  10
```

---

### 2. soal2.R
**Tujuan:** Program untuk membuat vektor dengan 30 nilai normal acak, menampilkan 10 nilai pertama, dan menghitung hasil perkalian v[i] × v[i] untuk i = 1 sampai 10.

**Cara menjalankan:**
```bash
Rscript soal2.R
```

**Output:**
```
10 nilai pertama dari vektor v:
 [1] -0.56047565 -0.23017749  1.55870831  0.07050839  0.12928774  1.71506499
 [7]  0.46091621 -1.26506123 -0.68685285 -0.44566197

Hasil perkalian v[i] × v[i] untuk i = 1 sampai 10:
v[ 1 ] × v[ 1 ] =  -0.5604756  ×  -0.5604756  =  0.314133 
v[ 2 ] × v[ 2 ] =  -0.2301775  ×  -0.2301775  =  0.05298168 
v[ 3 ] × v[ 3 ] =  1.558708  ×  1.558708  =  2.429572 
v[ 4 ] × v[ 4 ] =  0.07050839  ×  0.07050839  =  0.004971433 
v[ 5 ] × v[ 5 ] =  0.1292877  ×  0.1292877  =  0.01671532 
v[ 6 ] × v[ 6 ] =  1.715065  ×  1.715065  =  2.941448 
v[ 7 ] × v[ 7 ] =  0.4609162  ×  0.4609162  =  0.2124437 
v[ 8 ] × v[ 8 ] =  -1.265061  ×  -1.265061  =  1.60038 
v[ 9 ] × v[ 9 ] =  -0.6868529  ×  -0.6868529  =  0.4717668 
v[ 10 ] × v[ 10 ] =  -0.445662  ×  -0.445662  =  0.1986146
```

---

### 3. soal3-a.R
**Tujuan:** Program untuk membaca dan menganalisis file CSV data mahasiswa. Program ini membuat data sampel, menyimpannya ke file CSV, kemudian membaca kembali file tersebut dan melakukan analisis statistik serta penentuan status kelulusan.

**Cara menjalankan:**
```bash
Rscript soal3-a.R
```

**Output:**
```
=== PROGRAM 1: ANALISIS DATA MAHASISWA ===
Data yang dibaca dari file mahasiswa.csv:
   Nama Nilai     Jurusan
1 Ahmad    85 Informatika
2  Budi    78  Matematika
3 Citra    92      Fisika
4  Dina    88 Informatika
5   Eko    76  Matematika

Informasi ringkas data:
Jumlah mahasiswa: 5 
Rata-rata nilai: 83.8 
Nilai tertinggi: 92 
Nilai terendah: 76 

Status kelulusan mahasiswa:
Ahmad : LULUS dengan predikat BAIK 
Budi : LULUS dengan predikat CUKUP 
Citra : LULUS dengan predikat BAIK 
Dina : LULUS dengan predikat BAIK 
Eko : LULUS dengan predikat CUKUP
```

---

### 4. soal3-b.R
**Tujuan:** Program untuk membaca file teks dan menghitung frekuensi kata. Program ini membuat file teks sampel tentang pemrograman R, membacanya kembali, dan melakukan analisis teks termasuk menghitung frekuensi kata tertentu.

**Cara menjalankan:**
```bash
Rscript soal3-b.R
```

**Output:**
```
=== PROGRAM 2: ANALISIS FILE TEKS ===
Isi file sampel.txt:
Baris 1 : Pemrograman R adalah bahasa pemrograman yang powerful 
Baris 2 : R digunakan untuk analisis data dan statistik 
Baris 3 : Dengan R kita dapat membuat visualisasi data yang menarik 
Baris 4 : Pemrograman R memiliki banyak package yang berguna 

Analisis teks:
Total baris: 4 
Total kata: 30 

Frekuensi kata kunci:
Kata ' r ' muncul: 4 kali
Kata ' data ' muncul: 2 kali
Kata ' pemrograman ' muncul: 3 kali

Jumlah kata unik: 22
```

---

## File Data

### mahasiswa.csv
File CSV yang berisi data mahasiswa dengan kolom Nama, Nilai, dan Jurusan. File ini dibuat otomatis oleh program soal3-a.R.

### sampel.txt
File teks yang berisi contoh teks tentang pemrograman R. File ini dibuat otomatis oleh program soal3-b.R.

## Konsep Pemrograman yang Didemonstrasikan

1. **Loop for** - Perulangan untuk iterasi data
2. **Pernyataan bersyarat (if-else)** - Pengambilan keputusan berdasarkan kondisi
3. **File I/O** - Membaca dan menulis file CSV dan teks
4. **Manipulasi data** - Operasi matematika, statistik dasar, dan pemrosesan teks
5. **Data frame** - Struktur data tabular untuk menyimpan data mahasiswa
6. **Vektor** - Struktur data array untuk menyimpan nilai numerik
7. **String processing** - Pemrosesan teks dan analisis kata

## Cara Menjalankan Semua Program

```bash
# Menjalankan semua program secara berurutan
Rscript soal1.R
Rscript soal2.R
Rscript soal3-a.R
Rscript soal3-b.R
```
