# Fungsi untuk membuat scatter plot
create_scatter_plot <- function(x, y, output_file) {
  # Setup device PNG
  png(output_file, width = 800, height = 600, res = 150)
  
  # Plot parameters
  plot_params <- list(
    pch = 3,        # Tanda plus (+)
    col = "red",    # Warna merah  
    cex = 1.5,      # Ukuran titik
    xlim = c(1, 4), # Batas x
    ylim = c(3, 5), # Batas y
    xlab = "x",     # Label x
    ylab = "y",     # Label y
    main = ""       # Tanpa judul
  )
  
  # Buat plot
  do.call(plot, c(list(x = x, y = y), plot_params))
  
  # Tambah box
  box()
  
  # Tutup device
  dev.off()
}

# Data points
x <- c(2, 1, 2, 4, 1, 2, 3, 4, 2, 3, 1)
y <- c(4, 3, 4, 4, 3, 4, 5, 4, 4, 5, 3)

# Buat plot
create_scatter_plot(x, y, "scatter_plot.png")
