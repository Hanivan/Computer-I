# Membangkitkan data binomial
# n = 30 observasi, size = 10 percobaan, prob = 0.25
set.seed(123)  # untuk reproducibility
data_binom <- rbinom(n = 30, size = 10, prob = 0.25)

# Menyimpan dalam matriks dengan 5 kolom
data_binomial <- matrix(data_binom, ncol = 5)

# Menampilkan hasil
print(data_binomial)
