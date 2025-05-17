# Mendefinisikan matriks M
M <- matrix(c(7, 0, 0, 0, 6, 9, 0, 0, 5, 7, 1, 0, 4, 5, 2, 3), nrow = 4, byrow = FALSE)
print("Matriks M:")
print(M)

element_wise_product <- M * M
print("a. Perkalian elemen demi elemen dari matriks M:")
print(element_wise_product)

matrix_product <- M %*% M
print("b. Perkalian matriks M dengan matriks M (secara aljabar):")
print(matrix_product)

# Cek apakah matriks dapat diinvers
if(det(M) != 0) {
  inverse_M <- solve(M)
  print("c. Invers dari matriks M:")
  print(inverse_M)
} else {
  print("c. Matriks M tidak memiliki invers karena determinannya 0")
}

transpose_M <- t(M)
print("d. Transpose dari matriks M:")
print(transpose_M)

MT_times_M <- t(M) %*% M
print("e. M^T × M:")
print(MT_times_M)
