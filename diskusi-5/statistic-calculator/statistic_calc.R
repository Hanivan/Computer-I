# KALKULATOR STATISTIK - Program R untuk Analisis Statistik

# Install dan load library yang diperlukan
if (!require(ggplot2)) install.packages("ggplot2")
if (!require(dplyr)) install.packages("dplyr")
if (!require(moments)) install.packages("moments")
if (!require(nortest)) install.packages("nortest")
if (!require(gridExtra)) install.packages("gridExtra")

library(ggplot2)
library(dplyr)
library(moments)
library(nortest)
library(gridExtra)

# Fungsi Statistik Deskriptif Lengkap
descriptive_stats <- function(data, na_remove = TRUE) {
  if (!is.numeric(data)) {
    stop("Data harus berupa numerik!")
  }
  
  if (na_remove) {
    data <- data[!is.na(data)]
  }
  
  n <- length(data)
  
  if (n == 0) {
    stop("Data kosong atau semua nilai NA!")
  }
  
  stats <- list(
    # Ukuran Pemusatan
    mean = mean(data),
    median = median(data),
    mode = as.numeric(names(sort(table(data), decreasing = TRUE)[1])),
    
    # Ukuran Penyebaran
    variance = var(data),
    std_dev = sd(data),
    range = max(data) - min(data),
    min = min(data),
    max = max(data),
    iqr = IQR(data),
    
    # Kuartil
    q1 = quantile(data, 0.25),
    q3 = quantile(data, 0.75),
    
    # Ukuran Bentuk
    skewness = skewness(data),
    kurtosis = kurtosis(data),
    
    # Lainnya
    n = n,
    sum = sum(data),
    cv = sd(data) / mean(data) * 100  # Coefficient of Variation
  )
  
  return(stats)
}

# Fungsi untuk menampilkan hasil statistik
print_descriptive_stats <- function(stats) {
  cat("=== STATISTIK DESKRIPTIF ===\n\n")
  
  cat("UKURAN PEMUSATAN:\n")
  cat(sprintf("Mean (Rata-rata)    : %.4f\n", stats$mean))
  cat(sprintf("Median              : %.4f\n", stats$median))
  cat(sprintf("Modus               : %.4f\n", stats$mode))
  
  cat("\nUKURAN PENYEBARAN:\n")
  cat(sprintf("Variance (Varians)  : %.4f\n", stats$variance))
  cat(sprintf("Std. Deviation      : %.4f\n", stats$std_dev))
  cat(sprintf("Range               : %.4f\n", stats$range))
  cat(sprintf("IQR                 : %.4f\n", stats$iqr))
  cat(sprintf("Minimum             : %.4f\n", stats$min))
  cat(sprintf("Maximum             : %.4f\n", stats$max))
  cat(sprintf("Coeff. of Variation : %.2f%%\n", stats$cv))
  
  cat("\nKUARTIL:\n")
  cat(sprintf("Q1 (25th percentile): %.4f\n", stats$q1))
  cat(sprintf("Q3 (75th percentile): %.4f\n", stats$q3))
  
  cat("\nUKURAN BENTUK:\n")
  cat(sprintf("Skewness            : %.4f", stats$skewness))
  if (stats$skewness > 0.5) cat(" (Right-skewed)")
  else if (stats$skewness < -0.5) cat(" (Left-skewed)")
  else cat(" (Symmetric)")
  cat("\n")
  
  cat(sprintf("Kurtosis            : %.4f", stats$kurtosis))
  if (stats$kurtosis > 3) cat(" (Leptokurtic)")
  else if (stats$kurtosis < 3) cat(" (Platykurtic)")
  else cat(" (Mesokurtic)")
  cat("\n")
  
  cat("\nINFORMASI UMUM:\n")
  cat(sprintf("Jumlah Data (n)     : %d\n", stats$n))
  cat(sprintf("Sum (Total)         : %.4f\n", stats$sum))
}

# Fungsi untuk uji normalitas
normality_test <- function(data, alpha = 0.05) {
  if (length(data) < 3) {
    stop("Data minimal 3 observasi untuk uji normalitas!")
  }
  
  results <- list()
  
  # Shapiro-Wilk Test
  if (length(data) <= 5000) {
    shapiro_test <- shapiro.test(data)
    results$shapiro <- list(
      statistic = shapiro_test$statistic,
      p_value = shapiro_test$p.value,
      normal = shapiro_test$p.value > alpha
    )
  }
  
  # Anderson-Darling Test
  ad_test <- ad.test(data)
  results$anderson_darling <- list(
    statistic = ad_test$statistic,
    p_value = ad_test$p.value,
    normal = ad_test$p.value > alpha
  )
  
  # Kolmogorov-Smirnov Test
  ks_test <- ks.test(data, "pnorm", mean(data), sd(data))
  results$kolmogorov_smirnov <- list(
    statistic = ks_test$statistic,
    p_value = ks_test$p.value,
    normal = ks_test$p.value > alpha
  )
  
  return(results)
}

# Fungsi untuk menampilkan hasil uji normalitas
print_normality_test <- function(norm_results, alpha = 0.05) {
  cat("=== UJI NORMALITAS DATA ===\n\n")
  cat(sprintf("Alpha level: %.3f\n\n", alpha))
  
  if (!is.null(norm_results$shapiro)) {
    cat("SHAPIRO-WILK TEST:\n")
    cat(sprintf("Statistic: %.6f\n", norm_results$shapiro$statistic))
    cat(sprintf("P-value  : %.6f\n", norm_results$shapiro$p_value))
    cat(sprintf("Result   : %s\n", 
               ifelse(norm_results$shapiro$normal, "Normal", "Tidak Normal")))
    cat("\n")
  }
  
  cat("ANDERSON-DARLING TEST:\n")
  cat(sprintf("Statistic: %.6f\n", norm_results$anderson_darling$statistic))
  cat(sprintf("P-value  : %.6f\n", norm_results$anderson_darling$p_value))
  cat(sprintf("Result   : %s\n", 
             ifelse(norm_results$anderson_darling$normal, "Normal", "Tidak Normal")))
  cat("\n")
  
  cat("KOLMOGOROV-SMIRNOV TEST:\n")
  cat(sprintf("Statistic: %.6f\n", norm_results$kolmogorov_smirnov$statistic))
  cat(sprintf("P-value  : %.6f\n", norm_results$kolmogorov_smirnov$p_value))
  cat(sprintf("Result   : %s\n", 
             ifelse(norm_results$kolmogorov_smirnov$normal, "Normal", "Tidak Normal")))
}

# Fungsi untuk membuat visualisasi
create_statistical_plots <- function(data, title = "Data Analysis") {
  df <- data.frame(values = data)
  
  # Plot 1: Histogram
  p1 <- ggplot(df, aes(x = values)) +
    geom_histogram(aes(y = ..density..), bins = 30, 
                   fill = "skyblue", alpha = 0.7, color = "black") +
    geom_density(color = "red", linewidth = 1) +
    labs(title = paste(title, "- Histogram"), x = "Values", y = "Density") +
    theme_minimal()
  
  # Plot 2: Box Plot
  p2 <- ggplot(df, aes(y = values)) +
    geom_boxplot(fill = "lightgreen", alpha = 0.7) +
    labs(title = paste(title, "- Box Plot"), y = "Values") +
    theme_minimal()
  
  # Plot 3: Q-Q Plot
  p3 <- ggplot(df, aes(sample = values)) +
    stat_qq() +
    stat_qq_line(color = "red") +
    labs(title = paste(title, "- Q-Q Plot"), 
         x = "Theoretical Quantiles", y = "Sample Quantiles") +
    theme_minimal()
  
  # Plot 4: Dot Plot
  p4 <- ggplot(df, aes(x = 1:length(values), y = values)) +
    geom_point(color = "blue", size = 2) +
    geom_line(color = "gray", alpha = 0.5) +
    labs(title = paste(title, "- Dot Plot"), x = "Index", y = "Values") +
    theme_minimal()
  
  return(list(histogram = p1, boxplot = p2, qqplot = p3, dotplot = p4))
}

# Fungsi untuk confidence interval
confidence_interval <- function(data, confidence = 0.95) {
  n <- length(data)
  mean_val <- mean(data)
  se <- sd(data) / sqrt(n)
  
  alpha <- 1 - confidence
  t_value <- qt(1 - alpha/2, df = n - 1)
  
  margin_error <- t_value * se
  
  ci <- list(
    mean = mean_val,
    lower = mean_val - margin_error,
    upper = mean_val + margin_error,
    margin_error = margin_error,
    confidence_level = confidence * 100
  )
  
  return(ci)
}

# Fungsi untuk hypothesis testing (one-sample t-test)
one_sample_ttest <- function(data, mu0 = 0, alpha = 0.05, alternative = "two.sided") {
  test_result <- t.test(data, mu = mu0, alternative = alternative, conf.level = 1 - alpha)
  
  result <- list(
    hypothesis = paste("H0: μ =", mu0, "vs H1: μ", 
                      switch(alternative,
                             "two.sided" = "≠",
                             "greater" = ">",
                             "less" = "<"), mu0),
    t_statistic = test_result$statistic,
    df = test_result$parameter,
    p_value = test_result$p.value,
    confidence_interval = test_result$conf.int,
    reject_h0 = test_result$p.value < alpha,
    alternative = alternative,
    alpha = alpha
  )
  
  return(result)
}

# Fungsi untuk korelasi dan regresi
correlation_analysis <- function(x, y) {
  if (length(x) != length(y)) {
    stop("Panjang data x dan y harus sama!")
  }
  
  # Korelasi Pearson
  cor_pearson <- cor(x, y, method = "pearson")
  cor_test <- cor.test(x, y, method = "pearson")
  
  # Regresi Linear
  lm_model <- lm(y ~ x)
  
  result <- list(
    correlation = cor_pearson,
    cor_p_value = cor_test$p.value,
    cor_significant = cor_test$p.value < 0.05,
    regression = summary(lm_model),
    r_squared = summary(lm_model)$r.squared,
    intercept = coef(lm_model)[1],
    slope = coef(lm_model)[2]
  )
  
  return(result)
}

# Fungsi Main Calculator
statistical_calculator <- function() {
  cat("=== KALKULATOR STATISTIK ===\n")
  cat("Pilihan analisis:\n")
  cat("1. Statistik Deskriptif\n")
  cat("2. Uji Normalitas\n")
  cat("3. Confidence Interval\n")
  cat("4. One-Sample T-Test\n")
  cat("5. Analisis Korelasi\n")
  cat("6. Visualisasi Data\n")
  cat("7. Analisis Lengkap\n")
  cat("8. Keluar\n")
  
  choice <- as.numeric(readline("Pilih analisis (1-8): "))
  
  switch(choice,
    "1" = run_descriptive_analysis(),
    "2" = run_normality_analysis(),
    "3" = run_confidence_interval(),
    "4" = run_ttest_analysis(),
    "5" = run_correlation_analysis(),
    "6" = run_visualization(),
    "7" = run_complete_analysis(),
    "8" = {cat("Terima kasih!\n"); return()},
    cat("Pilihan tidak valid!\n")
  )
}

# Fungsi untuk input data
input_data <- function() {
  cat("Masukkan data (pisahkan dengan spasi): ")
  input_str <- readline()
  data <- as.numeric(unlist(strsplit(input_str, " ")))
  data <- data[!is.na(data)]
  
  if (length(data) == 0) {
    stop("Data tidak valid!")
  }
  
  return(data)
}

# Fungsi untuk analisis lengkap
run_complete_analysis <- function(data = NULL, save_results = TRUE) {
  if (is.null(data)) {
    data <- input_data()
  }
  
  cat("\n=== ANALISIS STATISTIK LENGKAP ===\n\n")
  
  # 1. Statistik Deskriptif
  desc_stats <- descriptive_stats(data)
  print_descriptive_stats(desc_stats)
  
  cat("\n")
  
  # 2. Uji Normalitas
  norm_results <- normality_test(data)
  print_normality_test(norm_results)
  
  cat("\n")
  
  # 3. Confidence Interval (95%)
  ci_95 <- confidence_interval(data, 0.95)
  cat("=== CONFIDENCE INTERVAL (95%) ===\n")
  cat(sprintf("Mean: %.4f\n", ci_95$mean))
  cat(sprintf("95%% CI: [%.4f, %.4f]\n", ci_95$lower, ci_95$upper))
  cat(sprintf("Margin of Error: %.4f\n", ci_95$margin_error))
  
  if (save_results) {
    # Save visualizations
    plots <- create_statistical_plots(data, "Statistical Analysis")
    
    # Alternatif jika gridExtra tidak tersedia
    tryCatch({
      png("statistical_analysis.png", width = 1200, height = 900, res = 150)
      grid.arrange(plots$histogram, plots$boxplot, plots$qqplot, plots$dotplot, 
                  ncol = 2, nrow = 2)
      dev.off()
      cat("Grid plot berhasil disimpan ke: statistical_analysis.png\n")
    }, error = function(e) {
      # Save individual plots jika grid.arrange gagal
      ggsave("histogram.png", plots$histogram, width = 8, height = 6, dpi = 150)
      ggsave("boxplot.png", plots$boxplot, width = 8, height = 6, dpi = 150)
      ggsave("qqplot.png", plots$qqplot, width = 8, height = 6, dpi = 150)
      ggsave("dotplot.png", plots$dotplot, width = 8, height = 6, dpi = 150)
      cat("Individual plots disimpan: histogram.png, boxplot.png, qqplot.png, dotplot.png\n")
    })
    
    # Save results to file
    results_text <- capture.output({
      print_descriptive_stats(desc_stats)
      cat("\n")
      print_normality_test(norm_results)
      cat("\n")
      cat("95% Confidence Interval: [", ci_95$lower, ",", ci_95$upper, "]\n")
    })
    
    writeLines(results_text, "statistical_results.txt")
    
    cat("\n=== FILES SAVED ===\n")
    cat("- statistical_analysis.png atau individual plots (visualizations)\n")
    cat("- statistical_results.txt (detailed results)\n")
  }
  
  return(list(
    descriptive = desc_stats,
    normality = norm_results,
    confidence_interval = ci_95,
    data = data
  ))
}

# Sample data untuk demo
demo_statistical_calculator <- function() {
  cat("=== DEMO KALKULATOR STATISTIK ===\n\n")
  
  # Generate sample data
  set.seed(123)
  sample_data <- rnorm(100, mean = 50, sd = 10)
  
  cat("Menggunakan sample data (n=100, normal distribution)\n")
  cat("Data preview:", head(sample_data, 10), "...\n\n")
  
  # Jalankan analisis lengkap
  results <- run_complete_analysis(sample_data, save_results = TRUE)
  
  return(results)
}

# CARA PENGGUNAAN:
cat("=== KALKULATOR STATISTIK READY ===\n")
cat("Fungsi yang tersedia:\n")
cat("1. statistical_calculator() - Interface interaktif\n")
cat("2. descriptive_stats(data) - Statistik deskriptif\n")
cat("3. normality_test(data) - Uji normalitas\n")
cat("4. confidence_interval(data, confidence) - Confidence interval\n")
cat("5. one_sample_ttest(data, mu0) - One-sample t-test\n")
cat("6. correlation_analysis(x, y) - Analisis korelasi\n")
cat("7. run_complete_analysis(data) - Analisis lengkap\n")
cat("8. demo_statistical_calculator() - Demo dengan sample data\n")
cat("\nContoh: hasil <- demo_statistical_calculator()\n")

# Jalankan demo
hasil <- demo_statistical_calculator()
