# Mendefinisikan matriks M seperti pada soal
M <- matrix(c(3, 1, 2, 0, 8, 4, 1, 2, 6, 5, 9, 1, 2, 7, 4, 8), nrow = 4, byrow = FALSE)
print("Matriks M:")
print(M)

# Operasi-operasi pada matriks
# 1. Perkalian elemen demi elemen
element_wise_product <- M * M
print("Perkalian elemen demi elemen dari matriks M:")
print(element_wise_product)

# 2. Perkalian matriks aljabar
matrix_product <- M %*% M
print("Perkalian matriks M secara aljabar:")
print(matrix_product)

# 3. Transpose matriks
transpose_M <- t(M)
print("Transpose dari matriks M:")
print(transpose_M)

# 4. Mengakses submatriks (anak matriks)
# Mendapatkan M1 = [[9, 7], [0, 1]]
M1 <- M[2:3, 2:3]
print("Anak matriks M1:")
print(M1)

# 5. Mendapatkan determinan
det_M <- det(M)
print(paste("Determinan dari matriks M:", det_M))
