# Menggunakan for loop untuk menghitung penjumlahan yang menghasilkan -110
total <- 0

for(i in 1:10) {
  total <- total + (i * (-2))  # mengalikan dengan -2 untuk mendapat -110
  print(paste("i =", i, "total =", total))
}

print(paste("Hasil penjumlahan:", total))

# Verifikasi: (1+2+3+...+10) * (-2) = 55 * (-2) = -110
