# Function to safely import and convert data to matrix
import_data_to_matrix <- function(file_path, nrows = 4, ncols = 10, by_row = TRUE) {
  tryCatch({
    if (!file.exists(file_path)) {
      stop(paste("File not found:", file_path))
    }
    
    raw_data <- scan(file_path, quiet = TRUE)
    
    if (length(raw_data) != nrows * ncols) {
      warning(paste("Expected", nrows * ncols, "values, but got", length(raw_data)))
    }
    
    data_matrix <- matrix(raw_data, nrow = nrows, ncol = ncols, byrow = by_row)
    rownames(data_matrix) <- paste0("Row_", seq_len(nrows))
    colnames(data_matrix) <- paste0("Col_", seq_len(ncols))
    
    cat("Successfully created", nrows, "x", ncols, "matrix\n")
    return(data_matrix)
    
  }, error = function(e) {
    cat("Error occurred:", e$message, "\n")
    return(NULL)
  })
}

# Main execution
main <- function() {
  DATA_FILE <- "data2.txt"
  MATRIX_ROWS <- 4
  MATRIX_COLS <- 10
  
  result_matrix <- import_data_to_matrix(DATA_FILE, MATRIX_ROWS, MATRIX_COLS)
  
  if (!is.null(result_matrix)) {
    cat("\n", paste(rep("=", 50), collapse = ""), "\n")
    cat("IMPORTED MATRIX DATA\n")
    cat(paste(rep("=", 50), collapse = ""), "\n")
    print(result_matrix)
    
    cat("\nBasic Statistics:\n")
    cat("- Min value:", min(result_matrix), "\n")
    cat("- Max value:", max(result_matrix), "\n")
    cat("- Mean value:", round(mean(result_matrix), 2), "\n")
  }
}

main()
