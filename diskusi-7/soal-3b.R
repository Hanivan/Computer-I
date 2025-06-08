cat("\n--- Contoh 2: Kalkulator BMI ---\n")

# Fungsi kalkulator BMI
hitung_bmi <- function(berat, tinggi) {
  cat("Input: Berat =", berat, "kg, Tinggi =", tinggi, "m\n")
  
  bmi <- berat / (tinggi^2)
  
  # Menentukan kategori BMI
  if (bmi < 18.5) {
    kategori <- "Kurus"
  } else if (bmi < 25) {
    kategori <- "Normal"
  } else if (bmi < 30) {
    kategori <- "Gemuk"
  } else {
    kategori <- "Obesitas"
  }
  
  cat("Hasil: BMI =", round(bmi, 2), "- Kategori:", kategori, "\n")
  return(bmi)
}

# Contoh penggunaan
bmi1 <- hitung_bmi(70, 1.75)    # 70 kg, 175 cm
bmi2 <- hitung_bmi(55, 1.60)    # 55 kg, 160 cm
bmi3 <- hitung_bmi(90, 1.70)    # 90 kg, 170 cm
