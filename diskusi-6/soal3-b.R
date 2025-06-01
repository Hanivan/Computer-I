# Load and process sales data
process_sales_data <- function(file_path) {
  if (!file.exists(file_path)) stop(paste("File not found:", file_path))
  sales <- read.csv(file_path, header=TRUE, stringsAsFactors=FALSE)
  sales$Total_Revenue <- sales$Jml.Unit * sales$Harga
  sales$Price_Category <- ifelse(sales$Harga >= 2000, "Premium", 
                                ifelse(sales$Harga >= 1000, "Standard", "Budget"))
  sales$Revenue_Share <- round((sales$Total_Revenue / sum(sales$Total_Revenue)) * 100, 2)
  sales$Revenue_Rank <- rank(-sales$Total_Revenue, ties.method="min")
  return(sales)
}

# Generate sales report
generate_report <- function(sales) {
  cat("\nTOP 3 PRODUCTS BY REVENUE:\n")
  top3 <- head(sales[order(-sales$Total_Revenue),], 3)
  for(i in 1:3) {
    cat(sprintf("%d. %s - Rp %s (%.1f%%)\n", i, top3$Nama.Barang[i],
                format(top3$Total_Revenue[i], big.mark=","), top3$Revenue_Share[i]))
  }
  
  cat("\nCATEGORY SUMMARY:\n")
  print(aggregate(Total_Revenue ~ Price_Category, sales, sum))
  
  cat("\nPRODUCT DETAILS:\n")
  print(sales[order(sales$Revenue_Rank), c("Nama.Barang", "Total_Revenue", "Revenue_Share")])
}

# Main execution
sales <- process_sales_data("penjualan.csv")
generate_report(sales)
