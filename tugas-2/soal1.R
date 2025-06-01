# Membuat matriks M
M <- matrix(c(2, 5, 6, 1, 8, 10, 9, 4, 7), nrow = 3, ncol = 3, byrow = TRUE)
print("Matriks M:")
print(M)

# Menambahkan kolom ke-4 dengan nilai 7, 4, 5 (M1)
M1 <- cbind(M, c(7, 4, 5))
print("Matriks M1 (menambah kolom ke-4):")
print(M1)

# Menambahkan kolom ke-1 dengan nilai 7, 4, 5 (M2)
M2 <- cbind(c(7, 4, 5), M)
print("Matriks M2 (menambah kolom ke-1):")
print(M2)

# Perkalian elemen demi elemen
perkalian <- M1 * M2
print("Perkalian elemen demi elemen M1 * M2:")
print(perkalian)

# Penjumlahan elemen demi elemen
penjumlahan <- M1 + M2
print("Penjumlahan elemen demi elemen M1 + M2:")
print(penjumlahan)
