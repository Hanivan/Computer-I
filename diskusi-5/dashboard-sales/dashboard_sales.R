# DASHBOARD SALES - Program R untuk Analisis Penjualan

# Install dan load library yang diperlukan
if (!require(ggplot2)) install.packages("ggplot2")
if (!require(dplyr)) install.packages("dplyr")
if (!require(lubridate)) install.packages("lubridate")
if (!require(gridExtra)) install.packages("gridExtra")
if (!require(scales)) install.packages("scales")

library(ggplot2)
library(dplyr)
library(lubridate)
library(gridExtra)
library(scales)

# Fungsi Generate Data Penjualan Sample
generate_sales_data <- function(n_months = 12, n_products = 5, seed = 123) {
  set.seed(seed)
  
  # Daftar produk
  products <- paste("Product", LETTERS[1:n_products])
  
  # Generate data untuk setiap bulan
  dates <- seq(from = as.Date("2024-01-01"), 
               by = "month", 
               length.out = n_months)
  
  sales_data <- data.frame()
  
  for (i in 1:length(dates)) {
    month_data <- data.frame(
      Date = dates[i],
      Month = month(dates[i], label = TRUE),
      Year = year(dates[i]),
      Product = products,
      Units_Sold = sample(50:500, n_products, replace = TRUE),
      Price_Per_Unit = sample(10:100, n_products, replace = TRUE),
      stringsAsFactors = FALSE
    )
    
    # Tambahkan seasonal trend
    seasonal_factor <- ifelse(month(dates[i]) %in% c(11, 12), 1.5, 1.0)
    month_data$Units_Sold <- round(month_data$Units_Sold * seasonal_factor)
    
    sales_data <- rbind(sales_data, month_data)
  }
  
  # Hitung total sales
  sales_data$Total_Sales <- sales_data$Units_Sold * sales_data$Price_Per_Unit
  sales_data$Month_Year <- paste(sales_data$Month, sales_data$Year)
  
  return(sales_data)
}

# Fungsi untuk analisis sales summary
sales_summary <- function(sales_data) {
  summary_stats <- sales_data %>%
    summarise(
      Total_Revenue = sum(Total_Sales),
      Total_Units = sum(Units_Sold),
      Avg_Price = mean(Price_Per_Unit),
      Avg_Monthly_Revenue = mean(Total_Sales),
      Best_Month = Month_Year[which.max(Total_Sales)],
      Worst_Month = Month_Year[which.min(Total_Sales)],
      .groups = 'drop'
    )
  
  return(summary_stats)
}

# Fungsi untuk analisis per produk
product_analysis <- function(sales_data) {
  product_stats <- sales_data %>%
    group_by(Product) %>%
    summarise(
      Total_Revenue = sum(Total_Sales),
      Total_Units = sum(Units_Sold),
      Avg_Price = mean(Price_Per_Unit),
      Revenue_Share = Total_Revenue / sum(sales_data$Total_Sales) * 100,
      .groups = 'drop'
    ) %>%
    arrange(desc(Total_Revenue))
  
  return(product_stats)
}

# Fungsi untuk analisis per bulan
monthly_analysis <- function(sales_data) {
  monthly_stats <- sales_data %>%
    group_by(Month_Year, Date) %>%
    summarise(
      Monthly_Revenue = sum(Total_Sales),
      Monthly_Units = sum(Units_Sold),
      Avg_Price = mean(Price_Per_Unit),
      .groups = 'drop'
    ) %>%
    arrange(Date)
  
  return(monthly_stats)
}

# Plot 1: Revenue Trend Over Time
create_revenue_trend <- function(sales_data) {
  monthly_data <- monthly_analysis(sales_data)
  
  p1 <- ggplot(monthly_data, aes(x = Date, y = Monthly_Revenue)) +
    geom_line(color = "blue", size = 1.2) +
    geom_point(color = "red", size = 2) +
    scale_y_continuous(labels = dollar_format()) +
    labs(title = "Revenue Trend Over Time",
         x = "Month",
         y = "Revenue ($)") +
    theme_minimal() +
    theme(axis.text.x = element_text(angle = 45, hjust = 1))
  
  return(p1)
}

# Plot 2: Product Performance
create_product_performance <- function(sales_data) {
  product_data <- product_analysis(sales_data)
  
  p2 <- ggplot(product_data, aes(x = reorder(Product, Total_Revenue), 
                                y = Total_Revenue, fill = Product)) +
    geom_col(alpha = 0.8) +
    coord_flip() +
    scale_y_continuous(labels = dollar_format()) +
    labs(title = "Product Performance by Revenue",
         x = "Product",
         y = "Total Revenue ($)") +
    theme_minimal() +
    theme(legend.position = "none")
  
  return(p2)
}

# Plot 3: Monthly Units Sold
create_units_chart <- function(sales_data) {
  monthly_data <- monthly_analysis(sales_data)
  
  p3 <- ggplot(monthly_data, aes(x = Date, y = Monthly_Units)) +
    geom_col(fill = "steelblue", alpha = 0.7) +
    labs(title = "Units Sold by Month",
         x = "Month",
         y = "Units Sold") +
    theme_minimal() +
    theme(axis.text.x = element_text(angle = 45, hjust = 1))
  
  return(p3)
}

# Plot 4: Product Mix (Pie Chart)
create_product_mix <- function(sales_data) {
  product_data <- product_analysis(sales_data)
  
  p4 <- ggplot(product_data, aes(x = "", y = Revenue_Share, fill = Product)) +
    geom_col() +
    coord_polar("y", start = 0) +
    labs(title = "Revenue Share by Product",
         fill = "Product") +
    theme_void() +
    theme(legend.position = "right")
  
  return(p4)
}

# Fungsi untuk membuat dashboard lengkap
create_sales_dashboard <- function(sales_data, save_file = "sales_dashboard.png") {
  # Buat semua plot
  p1 <- create_revenue_trend(sales_data)
  p2 <- create_product_performance(sales_data)
  p3 <- create_units_chart(sales_data)
  p4 <- create_product_mix(sales_data)
  
  # Arrange dalam grid
  dashboard <- grid.arrange(p1, p2, p3, p4, 
                           ncol = 2, nrow = 2,
                           top = "SALES DASHBOARD - 2024")
  
  # Save dashboard
  ggsave(save_file, dashboard, width = 16, height = 12, dpi = 300)
  cat("Dashboard disimpan ke:", save_file, "\n")
  
  return(dashboard)
}

# Fungsi untuk export laporan
export_sales_report <- function(sales_data, filename = "sales_report.txt") {
  # Analisis data
  summary_stats <- sales_summary(sales_data)
  product_stats <- product_analysis(sales_data)
  monthly_stats <- monthly_analysis(sales_data)
  
  # Buat laporan
  report <- paste(
    "SALES PERFORMANCE REPORT",
    paste(rep("=", 50), collapse = ""),
    paste("Generated on:", Sys.Date()),
    "",
    "OVERALL SUMMARY:",
    paste("Total Revenue: $", format(summary_stats$Total_Revenue, big.mark = ",")),
    paste("Total Units Sold:", format(summary_stats$Total_Units, big.mark = ",")),
    paste("Average Price per Unit: $", round(summary_stats$Avg_Price, 2)),
    paste("Average Monthly Revenue: $", format(round(summary_stats$Avg_Monthly_Revenue), big.mark = ",")),
    "",
    "TOP PERFORMING PRODUCTS:",
    sep = "\n"
  )
  
  # Tambahkan top 3 produk
  for (i in 1:min(3, nrow(product_stats))) {
    product_info <- paste(
      sprintf("%d. %s - Revenue: $%s (%.1f%% share)", 
              i, 
              product_stats$Product[i],
              format(product_stats$Total_Revenue[i], big.mark = ","),
              product_stats$Revenue_Share[i])
    )
    report <- paste(report, product_info, sep = "\n")
  }
  
  # Tambahkan trend analysis
  trend_info <- paste(
    "",
    "MONTHLY PERFORMANCE:",
    paste("Best Month:", summary_stats$Best_Month),
    paste("Worst Month:", summary_stats$Worst_Month),
    sep = "\n"
  )
  
  report <- paste(report, trend_info, sep = "\n")
  
  # Save laporan
  writeLines(report, filename)
  cat("Laporan disimpan ke:", filename, "\n")
}

# Fungsi untuk export data ke CSV
export_sales_data <- function(sales_data, summary_data, product_data, 
                             monthly_data, prefix = "sales") {
  
  write.csv(sales_data, paste0(prefix, "_raw_data.csv"), row.names = FALSE)
  write.csv(summary_data, paste0(prefix, "_summary.csv"), row.names = FALSE)
  write.csv(product_data, paste0(prefix, "_by_product.csv"), row.names = FALSE)
  write.csv(monthly_data, paste0(prefix, "_by_month.csv"), row.names = FALSE)
  
  cat("Data CSV berhasil diekspor:\n")
  cat("- sales_raw_data.csv\n")
  cat("- sales_summary.csv\n")
  cat("- sales_by_product.csv\n")
  cat("- sales_by_month.csv\n")
}

# Main Function untuk menjalankan semua analisis
run_sales_dashboard <- function(months = 12, products = 5, save_files = TRUE) {
  cat("=== SALES DASHBOARD ANALYSIS ===\n\n")
  
  # Generate data
  cat("Generating sales data...\n")
  sales_data <- generate_sales_data(months, products)
  
  # Analisis
  cat("Performing analysis...\n")
  summary_stats <- sales_summary(sales_data)
  product_stats <- product_analysis(sales_data)
  monthly_stats <- monthly_analysis(sales_data)
  
  # Tampilkan ringkasan
  cat("\n=== RINGKASAN PENJUALAN ===\n")
  print(summary_stats)
  
  cat("\n=== TOP PRODUCTS ===\n")
  print(head(product_stats, 3))
  
  if (save_files) {
    # Buat dashboard
    cat("\nCreating dashboard...\n")
    create_sales_dashboard(sales_data)
    
    # Export reports
    cat("Exporting reports...\n")
    export_sales_report(sales_data)
    export_sales_data(sales_data, summary_stats, product_stats, monthly_stats)
    
    cat("\n=== FILES GENERATED ===\n")
    cat("- sales_dashboard.png (visual dashboard)\n")
    cat("- sales_report.txt (text report)\n")
    cat("- sales_raw_data.csv (raw data)\n")
    cat("- sales_summary.csv (summary stats)\n")
    cat("- sales_by_product.csv (product analysis)\n")
    cat("- sales_by_month.csv (monthly analysis)\n")
  }
  
  return(list(
    raw_data = sales_data,
    summary = summary_stats,
    by_product = product_stats,
    by_month = monthly_stats
  ))
}

# CARA PENGGUNAAN:
cat("=== SALES DASHBOARD READY ===\n")
cat("Fungsi yang tersedia:\n")
cat("1. run_sales_dashboard() - Jalankan analisis lengkap\n")
cat("2. generate_sales_data(months, products) - Generate sample data\n")
cat("3. create_sales_dashboard(data) - Buat dashboard visual\n")
cat("4. export_sales_report(data) - Export laporan text\n")
cat("5. sales_summary(data) - Analisis ringkasan\n")
cat("6. product_analysis(data) - Analisis per produk\n")
cat("7. monthly_analysis(data) - Analisis per bulan\n")
cat("\nContoh: hasil <- run_sales_dashboard(months=12, products=5)\n")

# Jalankan demo
hasil <- run_sales_dashboard()