# Fungsi untuk membuat plot kosong dengan nomor
create_empty_plot <- function(number) {
  par(mar = c(0, 0, 0, 0))
  plot(0, 0, type = "n", xlim = c(0, 1), ylim = c(0, 1),
       axes = FALSE, xlab = "", ylab = "")
  text(0.5, 0.5, number, cex = 4, font = 2)
  box()
}

# Setup grafik
png("grafik_partisi.png", width = 800, height = 600, res = 150)
par(mar = c(0, 0, 0, 0))

# Layout matrix untuk partisi 3x2
layout(matrix(c(1, 3, 
               2, 3,
               2, 4), 
             nrow = 3, byrow = TRUE))

# Membuat plot untuk setiap region
create_empty_plot("1") # Region 1 (atas kiri)
create_empty_plot("2") # Region 2 (kiri bawah - lebih tinggi)
create_empty_plot("3") # Region 3 (atas kanan)
create_empty_plot("4") # Region 4 (bawah kanan)

dev.off()
