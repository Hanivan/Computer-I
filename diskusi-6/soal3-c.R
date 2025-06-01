create_separator <- function(char = "=", length = 70) paste(rep(char, length), collapse = "")

create_subsection <- function(title, char = "-", length = 50) {
  cat("\n", title, "\n", paste(rep(char, length), collapse = ""), "\n", sep = "")
}

prepare_data <- function(matrix_file, sales_file) {
  matrix_data <- tryCatch({
    if (!file.exists(matrix_file)) stop("Matrix file not found")
    m <- matrix(scan(matrix_file, quiet = TRUE), nrow = 4, ncol = 10, byrow = TRUE)
    rownames(m) <- paste0("Row_", 1:4)
    colnames(m) <- paste0("Col_", sprintf("%02d", 1:10))
    m
  }, error = function(e) NULL)
  
  sales_data <- tryCatch({
    if (!file.exists(sales_file)) stop("Sales file not found")
    sales <- read.csv(sales_file, header = TRUE, stringsAsFactors = FALSE)
    sales$Total_Revenue <- sales$Jml.Unit * sales$Harga
    sales$Price_Category <- ifelse(sales$Harga >= 2000, "Premium",
                                 ifelse(sales$Harga >= 1000, "Standard", "Budget"))
    sales$Revenue_Share <- round(sales$Total_Revenue/sum(sales$Total_Revenue) * 100, 2)
    sales
  }, error = function(e) NULL)
  
  list(matrix = matrix_data, sales = sales_data)
}

analyze_data <- function(data) {
  create_subsection("MATRIX ANALYSIS")
  print(data$matrix)
  cat(sprintf("\nDimensions: %dx%d\nMean: %.2f\nMin: %g, Max: %g\nSD: %.2f\n", 
              nrow(data$matrix), ncol(data$matrix), mean(data$matrix),
              min(data$matrix), max(data$matrix), sd(as.vector(data$matrix))))
  
  create_subsection("SALES ANALYSIS")
  top3 <- head(data$sales[order(-data$sales$Total_Revenue),], 3)
  cat("\nTOP 3 PRODUCTS BY REVENUE:\n")
  for(i in 1:3) cat(sprintf("%d. %s - Rp %s (%.1f%%)\n", i, top3$Nama.Barang[i],
                           format(top3$Total_Revenue[i], big.mark=","), top3$Revenue_Share[i]))
  cat("\nCATEGORY SUMMARY:\n")
  print(aggregate(Total_Revenue ~ Price_Category, data$sales, sum))
}

main <- function() {
  cat(create_separator(), "\nCOMBINED DATA ANALYSIS\n", create_separator(), "\n")
  data <- prepare_data("data2.txt", "penjualan.csv")
  if (!is.null(data$matrix) && !is.null(data$sales)) analyze_data(data)
  else cat("Error importing data\n")
}

main()
