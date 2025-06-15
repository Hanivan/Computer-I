# Program untuk menampilkan bilangan genap dari 1 sampai 10
cat("Bilangan genap dari 1 sampai 10:\n")

for (i in 1:10) {
  if (i %% 2 == 0) {
    cat(i, " ")
  }
}
cat("\n")
