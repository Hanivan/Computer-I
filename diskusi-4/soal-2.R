# Mendefinisikan matriks-matriks
M <- matrix(c(7, 0, 0, 0, 6, 9, 0, 0, 5, 7, 1, 0, 4, 5, 2, 3), nrow = 4, byrow = FALSE)
a <- c(1, 4, 5, 6)
B <- matrix(c(1, 1, 1, 2, 2, 2, 3, 3, 3, 4, 4, 4), nrow = 3, byrow = FALSE)

# print("Matriks M:")
# print(M)
# print("Vektor a:")
# print(a)
# print("Matriks B:")
# print(B)

M1 <- M[2:3, 2:3]
# print("a. Anak matriks M1:")
# print(M1)

M2 <- M[c(1, 4), c(1, 4)]
# print("b. Anak matriks M2:")
# print(M2)

M3 <- rbind(M, a)
# print("c. Matriks M3 (M dengan a sebagai baris tambahan):")
# print(M3)

# Transpose B
B_transpose <- t(B)
print("Transpose dari B:")
print(B_transpose)

# Membuat salinan M untuk M4
M4 <- M

# Menambahkan nilai B_transpose ke kolom 1 dan 2 dari M
for (i in 1:3) {
  M4[i, 1] <- M[i, 1] + B_transpose[i, 1]
  M4[i, 2] <- M[i, 2] + B_transpose[i, 2]
}

print("d. Matriks M4 (M dengan B_transpose ditambahkan ke kolom 1 dan 2):")
print(M4)