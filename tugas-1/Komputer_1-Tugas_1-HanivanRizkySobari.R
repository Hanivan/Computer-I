cat("Penjelasan tentang perintah ls(pat=\"v\"), for (i in 1:15) {print(i)}, dan setwd()")
# 1a. ls(pat="v")
# Membuat beberapa objek untuk contoh
var1 <- 10
vector1 <- c(1, 2, 3)
value <- "test"
number <- 42
# Menjalankan perintah ls(pat="v")
ls(pat="v")

# 1b. for (i in 1:15) {print(i)}
# Menjalankan loop for
for (i in 1:15) {
  print(i)
}

# 1c. setwd("C:\\Dokumen")
# Menjalankan perintah setwd (tidak benar-benar mengubah direktori)
# untuk demonstrasi saja
# setwd("C:\\Dokumen")
# Menampilkan direktori kerja saat ini
setwd("~/Developments")
getwd()
cat("--------------------------------\n\n")

# Cara efisien untuk membuat deret bilangan
print("Deret bilangan:")
a <- seq(-1.0, 3.8, by = 0.4)
print(a)
cat("--------------------------------\n\n")

print("Buat dan analisis bilangan 1-20")
# Membuat dan menganalisis bilangan 1-20 dalam satu script terstruktur
bilangan <- 1:20

# a. Membentuk matriks 4×5 dengan byrow=TRUE untuk mengisi baris demi baris
matriks <- matrix(bilangan, nrow = 4, ncol = 5, byrow = TRUE)
print("Matriks 4×5:")
print(matriks)

# b. Menghitung statistik dengan fungsi yang lebih ringkas
print("Statistik bilangan:")
statistik <- c(
  Minimum = min(bilangan),
  Maksimum = max(bilangan),
  Rata_rata = mean(bilangan),
  Median = median(bilangan)
)
print(statistik)

# Alternatif untuk mendapatkan semua statistik sekaligus
summary(bilangan)
cat("--------------------------------\n\n")
