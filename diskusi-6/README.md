# Computer Programming I - Discussion 6
## Data Analysis with R Scripts

This repository contains a collection of R scripts for data analysis tasks, including matrix operations and sales data analytics. All scripts are designed to work with specific data files and provide comprehensive analytical insights.

## 📁 Project Structure

```
diskusi-6/
├── data2.txt           # Matrix data input file (4x10 numerical values)
├── penjualan.csv       # Sales data input file (7 products)
├── soal1.R            # Basic matrix import and conversion
├── soal2.R            # Sales data analysis and profit ranking
├── soal3-a.R          # Advanced matrix analysis
├── soal3-b.R          # Advanced sales business analytics
├── soal3-c.R          # Combined data analysis dashboard
└── README.md          # This documentation file
```

## 🎯 What Each File Does

### Data Files

#### 📄 `data2.txt` - Numerical Matrix Dataset
**What it contains**: Raw numerical data arranged in a 4×10 matrix format
**Purpose**: Serves as input for matrix operations and statistical analysis
**Structure**: 4 rows × 10 columns of integer values ranging from 29 to 94
**Usage**: Used by `soal1.R`, `soal3-a.R`, and `soal3-c.R` for matrix computations

#### 📄 `penjualan.csv` - Sales Transaction Dataset  
**What it contains**: Sales data for 7 different products with quantities and prices
**Purpose**: Business data for revenue analysis and product performance evaluation
**Structure**: CSV format with 4 columns (No, Nama.Barang, Jml.Unit, Harga)
**Usage**: Used by `soal2.R`, `soal3-b.R`, and `soal3-c.R` for business analytics

### R Script Files

#### 🔧 `soal1.R` - Matrix Data Import and Basic Analysis
**What it does**:
- Imports numerical data from `data2.txt` using `scan()` function
- Converts raw data into a properly formatted 4×10 matrix structure
- Adds descriptive row and column names for better readability
- Performs basic statistical calculations (min, max, mean)
- Implements error handling for file operations and data validation

**Key Operations**:
- File existence validation
- Data length verification against expected matrix dimensions
- Matrix creation with `matrix()` function using row-wise arrangement
- Basic descriptive statistics computation

**Output**: Formatted matrix display with basic statistical summary

---

#### 📊 `soal2.R` - Sales Data Analysis and Business Intelligence
**What it does**:
- Reads sales data from `penjualan.csv` using `read.csv()`
- Calculates total revenue for each product (Quantity × Price)
- Creates product rankings based on total sales performance
- Categorizes products by price levels (Mahal/Sedang/Murah)
- Computes percentage contribution of each product to total revenue

**Key Operations**:
- Revenue calculation: `Total_Penjualan = Jml.Unit × Harga`
- Price categorization using conditional logic (`ifelse()`)
- Product ranking using `rank()` function with descending order
- Percentage calculation for revenue contribution analysis
- Top performer identification and analysis

**Business Logic**:
- Products ≥ Rp 2000 = "Mahal" (Expensive)
- Products Rp 1000-1999 = "Sedang" (Medium)
- Products < Rp 1000 = "Murah" (Cheap)

**Output**: Sales rankings, category analysis, and revenue contribution breakdown

---

#### 🔍 `soal3-a.R` - Advanced Matrix Statistical Analysis
**What it does**:
- Performs comprehensive statistical analysis on matrix data
- Calculates descriptive statistics for the entire matrix
- Displays matrix with enhanced formatting and proper labeling
- Computes key statistical measures (mean, standard deviation, min/max)
- Provides dimensional analysis of the matrix structure

**Key Operations**:
- Matrix importation with error handling using `tryCatch()`
- Statistical computation using base R functions (`mean()`, `sd()`, `min()`, `max()`)
- Matrix dimension analysis and data type identification
- Formatted output with professional presentation

**Statistical Measures**:
- Central tendency (mean)
- Variability (standard deviation)
- Range (minimum and maximum values)
- Data structure information

**Output**: Clean matrix display with comprehensive statistical summary

---

#### 💼 `soal3-b.R` - Advanced Business Analytics and Strategic Insights
**What it does**:
- Performs sophisticated business analysis on sales data
- Creates advanced price categorization (Premium/Standard/Budget)
- Generates revenue rankings and performance metrics
- Provides strategic business insights and recommendations
- Calculates detailed revenue share and contribution analysis

**Key Operations**:
- Advanced revenue calculation with multiple categorization methods
- Top performer identification with percentage contribution
- Price category analysis using both fixed thresholds and quantile-based methods
- Business performance ranking and competitive analysis
- Strategic recommendation generation based on data patterns

**Business Intelligence Features**:
- Premium products: ≥ Rp 2000
- Standard products: Rp 1000-1999  
- Budget products: < Rp 1000
- Revenue concentration analysis
- Market share calculations

**Output**: Executive summary with strategic recommendations and detailed analytics

---

#### 📈 `soal3-c.R` - Integrated Analytics Dashboard
**What it does**:
- Combines analysis from both matrix and sales datasets
- Creates a unified analytical dashboard
- Performs comparative analysis between different data types
- Generates executive-level insights and recommendations
- Provides integrated business intelligence reporting

**Key Operations**:
- Dual dataset importation and preparation
- Cross-dataset statistical comparison
- Integrated reporting with consistent formatting
- Combined insights generation from multiple data sources
- Executive dashboard creation with KPIs

**Integration Features**:
- Matrix data: Statistical analysis and pattern identification
- Sales data: Business performance and revenue analysis
- Comparative analysis: Cross-dataset insights
- Executive summary: High-level business intelligence

**Output**: Comprehensive dashboard combining both analytical perspectives

## 📊 Data Files

### data2.txt
Contains numerical matrix data in a 4x10 format:
```
75 90 35 51 50 56 35 80 70 80
68 29 58 66 89 81 86 70 94 67
35 47 67 87 37 30 66 58 59 55
67 76 80 78 60 90 69 80 76 87
```

### penjualan.csv
Contains sales data for 7 products with columns:
- `No`: Product number
- `Nama.Barang`: Product name
- `Jml.Unit`: Quantity sold
- `Harga`: Unit price

| No  | Nama.Barang | Jml.Unit | Harga |
| --- | ----------- | -------- | ----- |
| 1   | Buku        | 100      | 5000  |
| 2   | Penggaris   | 20       | 2500  |
| 3   | Pulpen      | 100      | 1000  |
| 4   | Penghapus   | 100      | 1000  |
| 5   | Sampul Buku | 200      | 500   |
| 6   | Amplop      | 200      | 500   |
| 7   | Pensil      | 100      | 1000  |

## 🔧 R Scripts Documentation

### 1. soal1.R - Basic Matrix Import and Conversion

**Purpose**: Import numerical data from text file and convert to matrix format

**Input**: `data2.txt` (numerical matrix data)

**Functions**:
- `import_data_to_matrix()`: Safely imports and converts data to matrix
- `main()`: Main execution function

**Output**:
```
Successfully created 4 x 10 matrix

================================================== 
IMPORTED MATRIX DATA
================================================== 
      Col_1 Col_2 Col_3 Col_4 Col_5 Col_6 Col_7 Col_8 Col_9 Col_10
Row_1    75    90    35    51    50    56    35    80    70     80
Row_2    68    29    58    66    89    81    86    70    94     67
Row_3    35    47    67    87    37    30    66    58    59     55
Row_4    67    76    80    78    60    90    69    80    76     87

Basic Statistics:
- Min value: 29 
- Max value: 94 
- Mean value: 65.85
```

**Usage**:
```bash
Rscript soal1.R
```

---

### 2. soal2.R - Sales Data Analysis and Profit Ranking

**Purpose**: Analyze sales data and create profit-based rankings

**Input**: `penjualan.csv` (sales data)

**Features**:
- Sales revenue calculation
- Product ranking by total sales
- Price category analysis (Mahal/Sedang/Murah)
- Revenue contribution analysis

**Output**:
```
=== ANALISIS PROFIT DAN RANKING ===

TOP 3 PRODUK TERLARIS:
1. Buku - Rp 5e+05
2. Pulpen - Rp 1e+05
3. Penghapus - Rp 1e+05

ANALISIS PER KATEGORI HARGA:
  Kategori_Harga Jml.Unit Total_Penjualan
1          Mahal      120          550000
2          Murah      400          200000
3         Sedang      300          300000

KONTRIBUSI SETIAP PRODUK:
  Nama.Barang Total_Penjualan Persentase Ranking
1        Buku           5e+05      47.62       1
2   Penggaris           5e+04       4.76       7
3      Pulpen           1e+05       9.52       2
4   Penghapus           1e+05       9.52       2
5 Sampul Buku           1e+05       9.52       2
6      Amplop           1e+05       9.52       2
7      Pensil           1e+05       9.52       2
```

**Usage**:
```bash
Rscript soal2.R
```

---

### 3. soal3-a.R - Advanced Matrix Analysis

**Purpose**: Simplified matrix analysis with essential statistics

**Input**: `data2.txt` (matrix data)

**Functions**:
- `import_matrix_data()`: Import and prepare matrix
- `display_matrix_analysis()`: Display matrix with key statistics

**Output**:
```
MATRIX ANALYSIS
      Col_01 Col_02 Col_03 Col_04 Col_05 Col_06 Col_07 Col_08 Col_09 Col_10
Row_1     75     90     35     51     50     56     35     80     70     80
Row_2     68     29     58     66     89     81     86     70     94     67
Row_3     35     47     67     87     37     30     66     58     59     55
Row_4     67     76     80     78     60     90     69     80     76     87

Dimensions: 4x10
Mean: 65.85
Min: 29, Max: 94
SD: 18.18
```

**Usage**:
```bash
Rscript soal3-a.R
```

---

### 4. soal3-b.R - Advanced Sales Business Analytics

**Purpose**: Comprehensive business analysis with advanced sales metrics

**Input**: `penjualan.csv` (sales data)

**Features**:
- Revenue calculation and ranking
- Price categorization (Premium/Standard/Budget)
- Business performance analysis
- Top performer identification

**Output**:
```
TOP 3 PRODUCTS BY REVENUE:
1. Buku - Rp 5e+05 (47.6%)
2. Pulpen - Rp 1e+05 (9.5%)
3. Penghapus - Rp 1e+05 (9.5%)

CATEGORY SUMMARY:
  Price_Category Total_Revenue
1         Budget        200000
2        Premium        550000
3       Standard        300000

PRODUCT DETAILS:
  Nama.Barang Total_Revenue Revenue_Share
1        Buku         5e+05         47.62
3      Pulpen         1e+05          9.52
4   Penghapus         1e+05          9.52
5 Sampul Buku         1e+05          9.52
6      Amplop         1e+05          9.52
7      Pensil         1e+05          9.52
2   Penggaris         5e+04          4.76
```

**Usage**:
```bash
Rscript soal3-b.R
```

---

### 5. soal3-c.R - Combined Data Analysis Dashboard

**Purpose**: Integrated analysis dashboard combining both matrix and sales datasets

**Input**: Both `data2.txt` and `penjualan.csv`

**Features**:
- Combined matrix and sales analysis
- Comparative analytics
- Executive dashboard view
- Integrated business insights

**Output**:
```
====================================================================== 
COMBINED DATA ANALYSIS
 ====================================================================== 

MATRIX ANALYSIS
--------------------------------------------------
      Col_01 Col_02 Col_03 Col_04 Col_05 Col_06 Col_07 Col_08 Col_09 Col_10
Row_1     75     90     35     51     50     56     35     80     70     80
Row_2     68     29     58     66     89     81     86     70     94     67
Row_3     35     47     67     87     37     30     66     58     59     55
Row_4     67     76     80     78     60     90     69     80     76     87

Dimensions: 4x10
Mean: 65.85
Min: 29, Max: 94
SD: 18.18

SALES ANALYSIS
--------------------------------------------------

TOP 3 PRODUCTS BY REVENUE:
1. Buku - Rp 5e+05 (47.6%)
2. Pulpen - Rp 1e+05 (9.5%)
3. Penghapus - Rp 1e+05 (9.5%)

CATEGORY SUMMARY:
  Price_Category Total_Revenue
1         Budget        200000
2        Premium        550000
3       Standard        300000
```

**Usage**:
```bash
Rscript soal3-c.R
```

## 🚀 Running All Scripts

To run all scripts sequentially:

```bash
# Run individual scripts
Rscript soal1.R
Rscript soal2.R
Rscript soal3-a.R
Rscript soal3-b.R
Rscript soal3-c.R

# Or run all at once
for script in soal1.R soal2.R soal3-a.R soal3-b.R soal3-c.R; do
    echo "=== Running $script ==="
    Rscript $script
    echo ""
done
```

## 📋 Requirements

- **R Environment**: Version 3.6+ recommended
- **Required Packages**: Base R (no additional packages required)
- **Input Files**: `data2.txt` and `penjualan.csv` must be in the same directory

## 🔍 Key Insights from Analysis

### Matrix Data (data2.txt)
- **Dimensions**: 4×10 matrix (40 total elements)
- **Statistics**: Mean = 65.85, Min = 29, Max = 94, SD = 18.18
- **Variability**: Moderate (CV ≈ 27.6%)

### Sales Data (penjualan.csv)
- **Total Revenue**: Rp 1,050,000
- **Top Performer**: Buku (47.6% of total revenue)
- **Price Categories**: 2 Premium, 3 Standard, 2 Budget products
- **Revenue Concentration**: Top 3 products account for 66.7% of total revenue

## 👨‍💻 Author

Computer Programming I - Discussion 6

## 📝 Notes

- All scripts include error handling and data validation
- Output formatting designed for readability
- Scripts can be run independently or as part of a workflow
- Modular design allows for easy maintenance and extension 