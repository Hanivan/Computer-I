cat("=== PERTANYAAN 1: Data Binomial ===\n")

# Parameter
n <- 30        # jumlah observasi
size <- 10     # ukuran percobaan (size)
prob <- 0.3    # peluang sukses

# Set seed untuk reproduktibilitas
set.seed(123)

# Membangkitkan data binomial
data_binomial <- rbinom(n, size, prob)

# Menampilkan data dalam matriks 5 kolom
data_matrix <- matrix(data_binomial, nrow = 6, ncol = 5, byrow = TRUE)

cat("Data binomial dalam bentuk matriks (6 baris x 5 kolom):\n")
print(data_matrix)

cat("\nRingkasan statistik data binomial:\n")
print(summary(data_binomial))
