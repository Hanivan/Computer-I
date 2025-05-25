# UNIT CONVERTER - Program R untuk Konversi Satuan

# Install dan load library yang diperlukan
if (!require(shiny)) install.packages("shiny")
library(shiny)

# Definisi unit dan faktor konversi
TEMP_UNITS <- c("Celsius", "Fahrenheit", "Kelvin", "Rankine")
LENGTH_UNITS <- c("Meter", "Kilometer", "Centimeter", "Millimeter", "Inch", "Feet", "Yard", "Mile")
WEIGHT_UNITS <- c("Kilogram", "Gram", "Pound", "Ounce", "Ton", "Stone") 
VOLUME_UNITS <- c("Liter", "Milliliter", "Gallon", "Quart", "Pint", "Cup", "Cubic_Meter")

# Fungsi helper untuk validasi input
validate_units <- function(from, to, valid_units) {
  if (!(from %in% valid_units && to %in% valid_units)) {
    stop("Unit tidak valid")
  }
}

# Fungsi helper untuk format output
format_result <- function(value, result, from, to, precision = 4) {
  sprintf(paste0("%.", precision, "f %s = %.", precision, "f %s"), 
          value, from, result, to)
}

# Fungsi Konversi Suhu
convert_temperature <- function(value, from, to) {
  validate_units(from, to, TEMP_UNITS)
  
  # Konversi ke Celsius dulu
  celsius <- switch(from,
    "Celsius" = value,
    "Fahrenheit" = (value - 32) * 5/9,
    "Kelvin" = value - 273.15,
    "Rankine" = (value - 491.67) * 5/9
  )
  
  # Konversi dari Celsius ke target
  switch(to,
    "Celsius" = celsius,
    "Fahrenheit" = celsius * 9/5 + 32,
    "Kelvin" = celsius + 273.15,
    "Rankine" = celsius * 9/5 + 491.67
  )
}

# Fungsi Konversi Panjang
convert_length <- function(value, from, to) {
  validate_units(from, to, LENGTH_UNITS)
  
  # Konversi ke meter dulu
  meters <- switch(from,
    "Meter" = value,
    "Kilometer" = value * 1000,
    "Centimeter" = value / 100,
    "Millimeter" = value / 1000,
    "Inch" = value * 0.0254,
    "Feet" = value * 0.3048,
    "Yard" = value * 0.9144,
    "Mile" = value * 1609.34
  )
  
  # Konversi dari meter ke target
  switch(to,
    "Meter" = meters,
    "Kilometer" = meters / 1000,
    "Centimeter" = meters * 100,
    "Millimeter" = meters * 1000,
    "Inch" = meters / 0.0254,
    "Feet" = meters / 0.3048,
    "Yard" = meters / 0.9144,
    "Mile" = meters / 1609.34
  )
}

# Fungsi Konversi Berat
convert_weight <- function(value, from, to) {
  validate_units(from, to, WEIGHT_UNITS)
  
  # Konversi ke kilogram dulu
  kg <- switch(from,
    "Kilogram" = value,
    "Gram" = value / 1000,
    "Pound" = value * 0.453592,
    "Ounce" = value * 0.0283495,
    "Ton" = value * 1000,
    "Stone" = value * 6.35029
  )
  
  # Konversi dari kilogram ke target
  switch(to,
    "Kilogram" = kg,
    "Gram" = kg * 1000,
    "Pound" = kg / 0.453592,
    "Ounce" = kg / 0.0283495,
    "Ton" = kg / 1000,
    "Stone" = kg / 6.35029
  )
}

# Fungsi Konversi Volume
convert_volume <- function(value, from, to) {
  validate_units(from, to, VOLUME_UNITS)
  
  # Konversi ke liter dulu
  liters <- switch(from,
    "Liter" = value,
    "Milliliter" = value / 1000,
    "Gallon" = value * 3.78541,
    "Quart" = value * 0.946353,
    "Pint" = value * 0.473176,
    "Cup" = value * 0.236588,
    "Cubic_Meter" = value * 1000
  )
  
  # Konversi dari liter ke target
  switch(to,
    "Liter" = liters,
    "Milliliter" = liters * 1000,
    "Gallon" = liters / 3.78541,
    "Quart" = liters / 0.946353,
    "Pint" = liters / 0.473176,
    "Cup" = liters / 0.236588,
    "Cubic_Meter" = liters / 1000
  )
}

# Fungsi generik untuk konversi
convert <- function(value, from, to, category) {
  switch(category,
    "temperature" = convert_temperature(value, from, to),
    "length" = convert_length(value, from, to),
    "weight" = convert_weight(value, from, to),
    "volume" = convert_volume(value, from, to),
    stop("Kategori tidak valid")
  )
}

# Fungsi Interface Console
unit_converter_console <- function() {
  categories <- c("Suhu (Temperature)", "Panjang (Length)", 
                 "Berat (Weight)", "Volume")
  
  repeat {
    cat("\n=== UNIT CONVERTER ===\n")
    for (i in seq_along(categories)) {
      cat(sprintf("%d. %s\n", i, categories[i]))
    }
    cat("5. Keluar\n")
    
    choice <- as.numeric(readline("Pilih kategori (1-5): "))
    
    if (choice == 5) {
      cat("Terima kasih!\n")
      break
    }
    
    if (choice >= 1 && choice <= 4) {
      category <- tolower(strsplit(categories[choice], " ")[[1]][1])
      do.call(paste0(category, "_converter"), list())
    } else {
      cat("Pilihan tidak valid!\n")
    }
  }
}

# Fungsi helper untuk konverter individual
create_converter <- function(category, units) {
  function() {
    cat(sprintf("\n=== KONVERSI %s ===\n", toupper(category)))
    cat("Satuan tersedia:", paste(units, collapse = ", "), "\n")
    
    value <- as.numeric(readline("Masukkan nilai: "))
    from <- readline("Dari satuan: ")
    to <- readline("Ke satuan: ")
    
    tryCatch({
      result <- convert(value, from, to, category)
      cat(format_result(value, result, from, to), "\n")
    }, error = function(e) {
      cat("Error:", e$message, "\n")
    })
  }
}

# Definisi konverter individual
temperature_converter <- create_converter("temperature", TEMP_UNITS)
length_converter <- create_converter("length", LENGTH_UNITS)
weight_converter <- create_converter("weight", WEIGHT_UNITS)
volume_converter <- create_converter("volume", VOLUME_UNITS)

# Fungsi Batch Conversion
batch_convert <- function(values, from, to, category) {
  results <- sapply(values, convert, from = from, to = to, category = category)
  data.frame(Input = values, From = from, Result = results, To = to)
}

# Fungsi Save Hasil Konversi
save_conversion <- function(conversion_data, filename = "conversion_results.csv") {
  write.csv(conversion_data, filename, row.names = FALSE)
  cat("Hasil konversi disimpan ke:", filename, "\n")
}

# Demo dan contoh penggunaan
demo_unit_converter <- function() {
  cat("=== DEMO UNIT CONVERTER ===\n\n")
  
  demos <- list(
    list("Suhu", 100, "Celsius", "Fahrenheit", "temperature", 1),
    list("Panjang", 1, "Meter", "Feet", "length", 2),
    list("Berat", 1, "Kilogram", "Pound", "weight", 2),
    list("Volume", 1, "Liter", "Gallon", "volume", 3)
  )
  
  for (i in seq_along(demos)) {
    demo <- demos[[i]]
    cat(sprintf("%d. Konversi %s:\n", i, demo[[1]]))
    result <- convert(demo[[2]], demo[[3]], demo[[4]], demo[[5]])
    cat(format_result(demo[[2]], result, demo[[3]], demo[[4]], demo[[6]]), "\n\n")
  }
  
  cat("5. Batch Conversion (Suhu):\n")
  temps <- c(0, 20, 37, 100)
  batch_results <- batch_convert(temps, "Celsius", "Fahrenheit", "temperature")
  print(batch_results)
  
  save_conversion(batch_results, "temp_conversion.csv")
}

# Tampilkan cara penggunaan
cat("=== UNIT CONVERTER READY ===\n")
cat("Fungsi yang tersedia:\n")
cat("1. unit_converter_console() - Interface interaktif\n")
cat("2. convert(value, from, to, category) - Konversi umum\n")
cat("3. batch_convert(values, from, to, category) - Konversi batch\n")
cat("4. demo_unit_converter() - Demo semua fungsi\n")
cat("\nContoh: convert(100, 'Celsius', 'Fahrenheit', 'temperature')\n")

# Jalankan demo
demo_unit_converter()