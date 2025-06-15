# Program 2: Membaca file teks dan menghitung frekuensi kata
# Membuat file teks sampel
teks_sampel <- c(
  "Pemrograman R adalah bahasa pemrograman yang powerful",
  "R digunakan untuk analisis data dan statistik",
  "Dengan R kita dapat membuat visualisasi data yang menarik",
  "Pemrograman R memiliki banyak package yang berguna"
)

# Menyimpan ke file teks
writeLines(teks_sampel, "sampel.txt")

# Membaca file teks
isi_file <- readLines("sampel.txt")

cat("=== PROGRAM 2: ANALISIS FILE TEKS ===\n")
cat("Isi file sampel.txt:\n")
for (i in 1:length(isi_file)) {
  cat("Baris", i, ":", isi_file[i], "\n")
}

# Menggabungkan semua baris menjadi satu string
teks_gabungan <- paste(isi_file, collapse = " ")

# Memisahkan kata-kata
kata_kata <- unlist(strsplit(tolower(teks_gabungan), "\\s+"))

cat("\nAnalisis teks:\n")
cat("Total baris:", length(isi_file), "\n")
cat("Total kata:", length(kata_kata), "\n")

# Menghitung frekuensi kata tertentu menggunakan loop dan kondisi
kata_target <- c("r", "data", "pemrograman")
cat("\nFrekuensi kata kunci:\n")

for (kata in kata_target) {
  jumlah <- 0
  for (i in 1:length(kata_kata)) {
    if (kata_kata[i] == kata) {
      jumlah <- jumlah + 1
    }
  }
  cat("Kata '", kata, "' muncul:", jumlah, "kali\n")
}

# Menampilkan kata-kata unik
kata_unik <- unique(kata_kata)
cat("\nJumlah kata unik:", length(kata_unik), "\n")
