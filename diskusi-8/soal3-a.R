# Program 1: Membaca dan menganalisis file CSV
# Membuat data sampel terlebih dahulu
data_mahasiswa <- data.frame(
  Nama = c("Ahmad", "Budi", "Citra", "Dina", "Eko"),
  Nilai = c(85, 78, 92, 88, 76),
  Jurusan = c("Informatika", "Matematika", "Fisika", "Informatika", "Matematika")
)

# Menyimpan ke file CSV
write.csv(data_mahasiswa, "mahasiswa.csv", row.names = FALSE)

# Membaca file CSV
data <- read.csv("mahasiswa.csv")

cat("=== PROGRAM 1: ANALISIS DATA MAHASISWA ===\n")
cat("Data yang dibaca dari file mahasiswa.csv:\n")
print(data)

cat("\nInformasi ringkas data:\n")
cat("Jumlah mahasiswa:", nrow(data), "\n")
cat("Rata-rata nilai:", mean(data$Nilai), "\n")
cat("Nilai tertinggi:", max(data$Nilai), "\n")
cat("Nilai terendah:", min(data$Nilai), "\n")

# Menggunakan pernyataan bersyarat
cat("\nStatus kelulusan mahasiswa:\n")
for (i in 1:nrow(data)) {
  if (data$Nilai[i] >= 80) {
    status <- "LULUS dengan predikat BAIK"
  } else if (data$Nilai[i] >= 70) {
    status <- "LULUS dengan predikat CUKUP"
  } else {
    status <- "TIDAK LULUS"
  }
  cat(data$Nama[i], ":", status, "\n")
}
