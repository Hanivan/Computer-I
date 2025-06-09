# Membuat kurva normal dengan rentang -4 < x < 4, panjang 500
x <- seq(-4, 4, length = 500)
y <- dnorm(x)

# Membuat plot dengan sumbu x berwarna hijau
plot(x, y, type = "l", 
     xlab = "x", 
     ylab = "density",
     main = "Kurva Normal",
     col = "black")

# Menambahkan garis sumbu x dengan warna hijau
abline(h = 0, col = "green", lwd = 2)
