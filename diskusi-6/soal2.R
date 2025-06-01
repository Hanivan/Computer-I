# Import dan analisis data penjualan
data_penjualan <- read.csv("penjualan.csv", header=TRUE)
data_penjualan$Total_Penjualan <- data_penjualan$Jml.Unit * data_penjualan$Harga
data_penjualan$Kategori_Harga <- ifelse(data_penjualan$Harga >= 2000, "Mahal",
                                       ifelse(data_penjualan$Harga >= 1000, "Sedang", "Murah"))
data_penjualan$Ranking <- rank(-data_penjualan$Total_Penjualan, ties.method = "min")
data_penjualan$Persentase <- round((data_penjualan$Total_Penjualan / sum(data_penjualan$Total_Penjualan)) * 100, 2)

# Output analisis
cat("=== ANALISIS PROFIT DAN RANKING ===\n\nTOP 3 PRODUK TERLARIS:\n")
top3 <- head(data_penjualan[order(-data_penjualan$Total_Penjualan), ], 3)
for(i in 1:3) {
    cat(i, ". ", top3$Nama.Barang[i], " - Rp ", format(top3$Total_Penjualan[i], big.mark=","), "\n", sep="")
}

cat("\nANALISIS PER KATEGORI HARGA:\n")
print(aggregate(cbind(Jml.Unit, Total_Penjualan) ~ Kategori_Harga, data_penjualan, sum))

cat("\nKONTRIBUSI SETIAP PRODUK:\n")
print(data_penjualan[, c("Nama.Barang", "Total_Penjualan", "Persentase", "Ranking")])