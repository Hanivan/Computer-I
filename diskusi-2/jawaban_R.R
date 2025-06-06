# Jawaban Pertanyaan R

# ============== Pertanyaan 1 ==============
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

# ============== Pertanyaan 2 ==============
# Metode 1: Membuat data frame dengan expand.grid
cat("Metode 1: Membuat data frame dengan expand.grid\n\n")
jurusan <- c("Komputer", "Matematika")
asal_daerah <- c("Jakarta", "Surabaya", "Makassar")
usia <- c(25, 26, 27, 28)

siswa <- expand.grid(jurusan = jurusan, asal_daerah = asal_daerah, usia = usia)
siswa <- siswa[, c("jurusan", "asal_daerah", "usia")]  # Mengurutkan kolom
siswa

# Metode 2: Membuat data frame secara manual
cat("\n\nMetode 2: Membuat data frame secara manual\n\n")
jurusan2 <- rep(c("Komputer", "Matematika"), 12)
asal_daerah2 <- rep(rep(c("Jakarta", "Jakarta", "Surabaya", "Surabaya", "Makassar", "Makassar"), 4))
usia2 <- rep(c(25, 25, 25, 25, 25, 25, 26, 26, 26, 26, 26, 26, 27, 27, 27, 27, 27, 27, 28, 28, 28, 28, 28, 28))

siswa2 <- data.frame(jurusan = jurusan2, asal_daerah = asal_daerah2, usia = usia2)
siswa2

# ============== Pertanyaan 3 ==============
# Contoh perhitungan bangun ruang dengan R

# Contoh 1: Menghitung Volume dan Luas Permukaan Kubus
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

# Contoh 2: Menghitung Volume dan Luas Permukaan Balok
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

# Contoh 3: Visualisasi Perbandingan Volume Tabung
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