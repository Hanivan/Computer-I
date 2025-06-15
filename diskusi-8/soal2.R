# Membuat vektor v dengan 30 nilai normal acak
set.seed(123)  # Untuk reproduksibilitas hasil
v <- rnorm(30)

cat("10 nilai pertama dari vektor v:\n")
print(v[1:10])

cat("\nHasil perkalian v[i] × v[i] untuk i = 1 sampai 10:\n")

# Pernyataan pengulangan untuk mengalikan v[i] dengan v[i]
for (i in 1:10) {
  hasil <- v[i] * v[i]
  cat("v[", i, "] × v[", i, "] = ", v[i], " × ", v[i], " = ", hasil, "\n")
}
