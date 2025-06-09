# Computer-I Tugas 3

Repository ini berisi program R untuk menyelesaikan tugas-tugas dasar pemrograman dengan R.

## Daftar File

### soal1.R
Program ini membuat kurva normal dengan rentang -4 < x < 4 dan menampilkannya sebagai plot dengan sumbu x berwarna hijau.

```r
# Membuat kurva normal dengan rentang -4 < x < 4, panjang 500
x <- seq(-4, 4, length = 500)
y <- dnorm(x)

# Membuat plot dengan sumbu x berwarna hijau
plot(x, y, type = "l", 
     xlab = "x", 
     ylab = "density",
     main = "Kurva Normal",
     col = "black")

# Menambahkan garis sumbu x dengan warna hijau
abline(h = 0, col = "green", lwd = 2)
```

**Output:**  
Program ini menghasilkan sebuah plot kurva normal dalam file `Rplots.pdf` dan juga ditampilkan sebagai `soal1-1.png`.

### soal2.R
Program ini membangkitkan data binomial dengan 30 observasi, 10 percobaan, dan probabilitas sukses 0.25, kemudian menyimpannya dalam matriks dengan 5 kolom.

```r
# Membangkitkan data binomial
# n = 30 observasi, size = 10 percobaan, prob = 0.25
set.seed(123)  # untuk reproducibility
data_binom <- rbinom(n = 30, size = 10, prob = 0.25)

# Menyimpan dalam matriks dengan 5 kolom
data_binomial <- matrix(data_binom, ncol = 5)

# Menampilkan hasil
print(data_binomial)
```

**Output:**
```
     [,1] [,2] [,3] [,4] [,5]
[1,]    2    3    3    2    3
[2,]    4    4    3    5    3
[3,]    2    3    1    4    3
[4,]    4    2    4    3    3
[5,]    5    5    2    3    2
[6,]    0    2    0    6    1
```

### soal3.R
Program ini menggunakan for loop untuk menghitung penjumlahan dengan pola tertentu yang menghasilkan -110, yaitu menjumlahkan hasil kali angka 1 sampai 10 dengan -2.

```r
# Menggunakan for loop untuk menghitung penjumlahan yang menghasilkan -110
total <- 0

for(i in 1:10) {
  total <- total + (i * (-2))  # mengalikan dengan -2 untuk mendapat -110
  print(paste("i =", i, "total =", total))
}

print(paste("Hasil penjumlahan:", total))

# Verifikasi: (1+2+3+...+10) * (-2) = 55 * (-2) = -110
```

**Output:**
```
[1] "i = 1 total = -2"
[1] "i = 2 total = -6"
[1] "i = 3 total = -12"
[1] "i = 4 total = -20"
[1] "i = 5 total = -30"
[1] "i = 6 total = -42"
[1] "i = 7 total = -56"
[1] "i = 8 total = -72"
[1] "i = 9 total = -90"
[1] "i = 10 total = -110"
[1] "Hasil penjumlahan: -110"
```

## Dokumen Pendukung

- `output-soal1.png`: Gambar kurva normal yang dihasilkan dari soal1.R
- `Rplots.pdf`: File PDF yang berisi plot kurva normal dari soal1.R 
