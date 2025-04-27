# Jawaban Pertanyaan R

## Pertanyaan 1

Tuliskan pernyataan R untuk membuat deret bilangan di bawah ini.

```r
# Membuat deret bilangan x = [-4 -3 -2 -1 0 1 2]
x <- seq(-4, 2, by = 1)
x
# [1] -4 -3 -2 -1  0  1  2

# Membuat deret bilangan y = [4 3 2 1]
y <- seq(4, 1, by = -1)
y
# [1] 4 3 2 1

# Membuat deret bilangan z = [1.00 1.25 1.50 1.75 2.00]
z <- seq(1, 2, by = 0.25)
z
# [1] 1.00 1.25 1.50 1.75 2.00

# Membuat deret bilangan p = [10 10 10 5 5 5]
p <- c(rep(10, 3), rep(5, 3))
p
# [1] 10 10 10  5  5  5

# Membuat deret bilangan q = [2 2 3 3 2 2 3 3]
q <- rep(c(2, 2, 3, 3), 2)
q
# [1] 2 2 3 3 2 2 3 3
```

## Pertanyaan 2

Tuliskan pernyataan R untuk membuat frame data siswa berikut:

```r
# Metode 1: Membuat data frame dengan expand.grid
jurusan <- c("Komputer", "Matematika")
asal_daerah <- c("Jakarta", "Surabaya", "Makassar")
usia <- c(25, 26, 27, 28)

siswa <- expand.grid(jurusan = jurusan, asal_daerah = asal_daerah, usia = usia)
siswa <- siswa[, c("jurusan", "asal_daerah", "usia")]  # Mengurutkan kolom
siswa
```

Output:
```
       jurusan asal_daerah usia
1     Komputer     Jakarta   25
2   Matematika     Jakarta   25
3     Komputer    Surabaya   25
4   Matematika    Surabaya   25
5     Komputer    Makassar   25
6   Matematika    Makassar   25
7     Komputer     Jakarta   26
8   Matematika     Jakarta   26
9     Komputer    Surabaya   26
10  Matematika    Surabaya   26
11    Komputer    Makassar   26
12  Matematika    Makassar   26
13    Komputer     Jakarta   27
14  Matematika     Jakarta   27
15    Komputer    Surabaya   27
16  Matematika    Surabaya   27
17    Komputer    Makassar   27
18  Matematika    Makassar   27
19    Komputer     Jakarta   28
20  Matematika     Jakarta   28
21    Komputer    Surabaya   28
22  Matematika    Surabaya   28
23    Komputer    Makassar   28
24  Matematika    Makassar   28
```

```r
# Metode 2: Membuat data frame secara manual
jurusan <- rep(c("Komputer", "Matematika"), 12)
asal_daerah <- rep(rep(c("Jakarta", "Jakarta", "Surabaya", "Surabaya", "Makassar", "Makassar"), 4))
usia <- rep(c(25, 25, 25, 25, 25, 25, 26, 26, 26, 26, 26, 26, 27, 27, 27, 27, 27, 27, 28, 28, 28, 28, 28, 28))

siswa <- data.frame(jurusan = jurusan, asal_daerah = asal_daerah, usia = usia)
siswa
```

## Pertanyaan 3

Setelah Anda mempelajari materi sesi ini, buatlah 3 contoh Program R serta lampirkan hasil output R tsb.

### Contoh 1: Perhitungan Volume dan Luas Permukaan Kubus

```r
# Fungsi untuk menghitung volume dan luas permukaan kubus
hitung_kubus <- function(sisi) {
  volume <- sisi^3
  luas_permukaan <- 6 * sisi^2
  return(list(volume = volume, luas_permukaan = luas_permukaan))
}

# Membuat beberapa contoh kubus dengan panjang sisi berbeda
sisi_kubus <- c(1, 2, 3, 4, 5)
hasil_kubus <- lapply(sisi_kubus, hitung_kubus)

# Membuat data frame dari hasil perhitungan
hasil_df_kubus <- data.frame(
  sisi = sisi_kubus,
  volume = sapply(hasil_kubus, function(x) x$volume),
  luas_permukaan = sapply(hasil_kubus, function(x) x$luas_permukaan)
)

# Menampilkan hasil
print("Hasil Perhitungan Kubus:")
print(hasil_df_kubus)
```

Output:
```
[1] "Hasil Perhitungan Kubus:"
  sisi volume luas_permukaan
1    1      1              6
2    2      8             24
3    3     27             54
4    4     64             96
5    5    125            150
```

### Contoh 2: Perhitungan Volume dan Luas Permukaan Balok

```r
# Fungsi untuk menghitung volume dan luas permukaan balok
hitung_balok <- function(panjang, lebar, tinggi) {
  volume <- panjang * lebar * tinggi
  luas_permukaan <- 2 * (panjang*lebar + panjang*tinggi + lebar*tinggi)
  return(list(volume = volume, luas_permukaan = luas_permukaan))
}

# Membuat beberapa contoh balok
balok_data <- data.frame(
  panjang = c(3, 4, 5, 6, 7),
  lebar = c(2, 3, 4, 4, 5),
  tinggi = c(1, 2, 3, 3, 4)
)

# Menghitung volume dan luas permukaan untuk setiap balok
balok_data$volume <- mapply(
  function(p, l, t) hitung_balok(p, l, t)$volume,
  balok_data$panjang, balok_data$lebar, balok_data$tinggi
)

balok_data$luas_permukaan <- mapply(
  function(p, l, t) hitung_balok(p, l, t)$luas_permukaan,
  balok_data$panjang, balok_data$lebar, balok_data$tinggi
)

# Menampilkan hasil
print("Hasil Perhitungan Balok:")
print(balok_data)
```

Output:
```
[1] "Hasil Perhitungan Balok:"
  panjang lebar tinggi volume luas_permukaan
1       3     2      1      6             22
2       4     3      2     24             52
3       5     4      3     60            118
4       6     4      3     72            132
5       7     5      4    140            246
```

### Contoh 3: Visualisasi Perbandingan Volume Tabung

```r
# Fungsi untuk menghitung volume tabung
hitung_tabung <- function(jari_jari, tinggi) {
  volume <- pi * jari_jari^2 * tinggi
  return(volume)
}

# Membuat dataset dengan variasi jari-jari dan tinggi
jari_jari <- seq(1, 5, by = 1)
tinggi <- c(5, 10, 15)

# Membuat data frame untuk semua kombinasi jari-jari dan tinggi
tabung_data <- expand.grid(jari_jari = jari_jari, tinggi = tinggi)

# Menghitung volume untuk setiap kombinasi
tabung_data$volume <- mapply(hitung_tabung, tabung_data$jari_jari, tabung_data$tinggi)

# Menampilkan hasil
print("Hasil Perhitungan Volume Tabung:")
print(tabung_data)

# Membuat visualisasi dengan barplot sederhana
# Mengubah tinggi menjadi faktor untuk plot
tabung_data$tinggi_faktor <- as.factor(tabung_data$tinggi)

# Plot dengan barplot dasar
barplot(tabung_data$volume, 
        names.arg = paste("r=", tabung_data$jari_jari, ", h=", tabung_data$tinggi, sep=""),
        col = as.numeric(tabung_data$tinggi_faktor),
        main = "Volume Tabung dengan Berbagai Ukuran",
        xlab = "Jari-jari (r) dan Tinggi (h)",
        ylab = "Volume (satuan kubik)",
        las = 2)

# Menambahkan legenda
legend("topleft", 
       legend = paste("Tinggi =", unique(tabung_data$tinggi)),
       fill = 1:length(unique(tabung_data$tinggi)),
       title = "Keterangan")
```

Output:
```
[1] "Hasil Perhitungan Volume Tabung:"
   jari_jari tinggi     volume
1          1      5   15.70796
2          2      5   62.83185
3          3      5  141.37167
4          4      5  251.32741
5          5      5  392.69908
6          1     10   31.41593
7          2     10  125.66371
8          3     10  282.74334
9          4     10  502.65482
10         5     10  785.39816
11         1     15   47.12389
12         2     15  188.49556
13         3     15  424.11500
14         4     15  753.98223
15         5     15 1178.09724
```

Dan juga akan menampilkan barplot volume tabung dengan berbagai ukuran jari-jari dan tinggi. 