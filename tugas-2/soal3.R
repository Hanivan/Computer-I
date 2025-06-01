# Mengatur working directory ke E:/UT
setwd("/home/node/Developments/college/Computer-I/tugas-2")


# Membaca file txt
data_komputer <- read.table("Nilai_Komputer.txt", 
                           sep = ",", 
                           header = TRUE, 
                           stringsAsFactors = FALSE)

# Menampilkan data
cat("Data Nilai Komputer I:\n")
print(data_komputer)

# Menampilkan struktur data
cat("\nStruktur Data:\n")
str(data_komputer)

# Menampilkan ringkasan statistik
cat("\nRingkasan Statistik:\n")
summary(data_komputer)