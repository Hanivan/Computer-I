# Import and prepare matrix data
import_matrix_data <- function(file_path, nrows = 4, ncols = 10) {
  tryCatch({
    if (!file.exists(file_path)) stop(paste("Data file not found:", file_path))
    raw_data <- scan(file_path, quiet = TRUE)
    data_matrix <- matrix(raw_data, nrow = nrows, ncol = ncols, byrow = TRUE)
    rownames(data_matrix) <- paste0("Row_", seq_len(nrows))
    colnames(data_matrix) <- paste0("Col_", sprintf("%02d", seq_len(ncols)))
    return(data_matrix)
  }, error = function(e) {
    cat("Error importing matrix data:", e$message, "\n")
    return(NULL)
  })
}

# Display matrix analysis
display_matrix_analysis <- function(matrix_data) {
  cat("\nMATRIX ANALYSIS\n")
  print(matrix_data)
  cat(sprintf("\nDimensions: %dx%d\n", nrow(matrix_data), ncol(matrix_data)))
  cat(sprintf("Mean: %.2f\n", mean(matrix_data)))
  cat(sprintf("Min: %g, Max: %g\n", min(matrix_data), max(matrix_data)))
  cat(sprintf("SD: %.2f\n", sd(as.vector(matrix_data))))
}

# Main execution
main <- function() {
  matrix_data <- import_matrix_data("data2.txt", 4, 10)
  if (!is.null(matrix_data)) display_matrix_analysis(matrix_data)
}

main()
