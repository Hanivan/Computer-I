cat("\n--- Contoh 1: Kalkulator Sederhana ---\n")

kalkulator_sederhana <- function(ekspresi) {
  cat("Input:", ekspresi, "\n")
  hasil <- eval(parse(text = ekspresi))
  cat("Hasil:", hasil, "\n")
  return(hasil)
}

repeat {
  cat("Masukkan ekspresi matematika (atau 'quit' untuk keluar): ")
  input <- readLines("stdin", n=1)
  
  if (input == "q" || input == "quit" || input == "selesai" || input == "wq" || input == "exit" || input == "x") {
    break
  }
  
  tryCatch({
    kalkulator_sederhana(input)
  }, error = function(e) {
    cat("Error:", e$message, "\n")
  })
  
  cat("\n")
}