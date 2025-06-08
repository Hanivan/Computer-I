cat("\n=== PERTANYAAN 2: Plot Distribusi Chi-square ===\n")

# Parameter
df <- 1          # derajat bebas
x_range <- seq(0, 5, by = 0.01)

# Menghitung fungsi kepadatan
kepadatan <- dchisq(x_range, df)

# Membuat plot
plot(x_range, kepadatan, 
     type = "l", 
     lwd = 2,
     main = "Distribusi Chisq: df=1",
     xlab = "x",
     ylab = "Kepadatan",
     xlim = c(0, 5),
     ylim = c(0, 1.5))

# Menambahkan grid
grid()

cat("Plot fungsi kepadatan distribusi chi-square dengan df=1 telah dibuat.\n")
