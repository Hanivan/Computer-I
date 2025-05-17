# Mendefinisikan matriks-matriks dari soal
M <- matrix(c(4, 2, 1, 0, 8, 5, 0, 0, 3, 9, 2, 0, 6, 4, 1, 7), nrow = 4, byrow = FALSE)
a <- c(2, 5, 7, 8)
B <- matrix(c(2, 2, 2, 4, 4, 4, 6, 6, 6), nrow = 3, byrow = FALSE)

print("Matriks M:")
print(M)
print("Vektor a:")
print(a)
print("Matriks B:")
print(B)

# 1. Menambahkan vektor a sebagai baris baru ke matriks M
M3 <- rbind(M, a)
print("Matriks M3 (M dengan a sebagai baris tambahan):")
print(M3)

# 2. Menambahkan transpose dari B ke kolom 1 dan 2 dari M
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

print("Matriks M4 (M dengan B_transpose ditambahkan ke kolom 1 dan 2):")
print(M4)

# 3. Menghitung M^T × M
MT_times_M <- t(M) %*% M
print("M^T × M:")
print(MT_times_M)

# 4. Eigenvalues dan eigenvectors dari M
eigen_M <- eigen(M)
print("Eigenvalues dari M:")
print(eigen_M$values)
print("Eigenvectors dari M:")
print(eigen_M$vectors)
