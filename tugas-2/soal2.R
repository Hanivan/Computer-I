# Data nilai dan frekuensi
nilai <- c(60, 67, 69, 72, 75, 77, 80, 83, 87, 90)
frekuensi <- c(2, 5, 6, 7, 9, 2, 6, 8, 1, 3)

# Menyimpan pie chart dan boxplot ke file PNG
png("pie_chart_boxplot.png", width = 1200, height = 800)
par(mfrow = c(2, 2))

# Pie chart untuk distribusi nilai
pie(frekuensi, labels = nilai, main = "Distribusi Nilai Mahasiswa",
    col = rainbow(length(nilai)))

# Pie chart untuk distribusi frekuensi
pie(nilai, labels = frekuensi, main = "Distribusi Frekuensi",
    col = heat.colors(length(frekuensi)))

# Boxplot untuk nilai
boxplot(nilai, main = "Boxplot Nilai", ylab = "Nilai", col = "lightblue")

# Boxplot untuk frekuensi
boxplot(frekuensi, main = "Boxplot Frekuensi", ylab = "Frekuensi", col = "lightgreen")

# Menutup dan menyimpan file
dev.off()
cat("Pie chart dan boxplot disimpan ke: pie_chart_boxplot.png\n")


# Menyimpan plot ke file PNG
png("plot_dan_sunflower.png", width = 1200, height = 600)
par(mfrow = c(1, 2))

# Membuat plot biasa
plot(nilai, frekuensi, main = "Plot Nilai vs Frekuensi", 
     xlab = "Nilai", ylab = "Frekuensi", pch = 16, col = "blue")

# Membuat sunflowerplot
sunflowerplot(nilai, frekuensi, main = "Sunflowerplot Nilai vs Frekuensi",
              xlab = "Nilai", ylab = "Frekuensi")

# Menutup dan menyimpan file
dev.off()
cat("Plot dan sunflowerplot disimpan ke: plot_dan_sunflower.png\n")