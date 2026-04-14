# 📊 Sales Performance Dashboard

An end-to-end data analytics project built on the **Sample Superstore** dataset.  
Covers data cleaning in Python, SQL-based KPI queries, and an interactive Power BI dashboard.

---

## 📁 Project Structure

```
sales-performance-dashboard/
│
├── README.md
│
├── data/
│   ├── raw/
│   │   └── Sample - Superstore.csv          # Original dataset
│   └── processed/
│       └── superstore_cleaned.csv           # Cleaned output
│
├── notebooks/
│   └── Supermart_EDA.ipynb                  # Colab notebook (EDA)
│
├── python/
│   └── supermart_eda.py                     # Cleaning script (exported from Colab)
│
├── sql/
│   ├── 01_mom_growth.sql                    # Month-over-month revenue growth
│   ├── 02_regional_performance.sql          # Revenue, profit & loss by region
│   ├── 03_top10_products.sql                # Top 10 products by revenue (ranked)
│   ├── 04_loss_analysis.sql                 # Loss-making sub-categories breakdown
│   └── 05_discount_impact.sql              # Discount vs. profit impact analysis
│
├── powerbi/                                 # Coming soon
│   ├── SalesPerformanceDashboard.pbix
│   └── screenshots/
│       ├── overview.png
│       ├── regional.png
│       └── loss-analysis.png
│
└── assets/
    └── dashboard-preview.png
```

---

## 🔧 Tech Stack

| Tool | Purpose |
|------|---------|
| Python · pandas · numpy | Data cleaning & EDA |
| Google Colab | Notebook environment |
| SQL (MySQL) | KPI queries & business logic |
| Power BI | Interactive dashboard |

---

## 🧹 Data Cleaning Steps (`python/supermart_eda.py`)

The cleaning script (exported from Colab) performs:

1. **Load** — reads `Sample - Superstore.csv` with `latin1` encoding
2. **Normalise columns** — strips whitespace, lowercases all column names
3. **Parse dates** — converts `order date` and `ship date` to `datetime`
4. **Derive features**:
   - `year`, `month`, `yearmonth` — time-series slicing
   - `ship_days` — fulfilment time
   - `profit_margin` — profit ÷ sales
   - `IsLoss` — `1` if profit < 0
   - `HighDiscount` — `1` if discount ≥ 50%
5. **Standardise strings** — strips whitespace, title-cases categorical columns
6. **Export** — saves `superstore_cleaned.csv`

---

## 🗃️ SQL KPI Queries (`sql/`)

All queries run against the `sales_dashboard` database on the `superstore_cleaned` table.

### 01 · Month-over-Month Revenue Growth (`01_mom_growth.sql`)

Uses two CTEs + `LAG()` window function to calculate the percentage change in monthly revenue compared to the previous month.

**Key columns returned:**

| Column | Description |
|--------|-------------|
| `yearmonth` | Period (YYYYMM) |
| `monthly_revenue` | Total revenue for the month |
| `prev_month_revenue` | Previous month's revenue |
| `mom_growth_pct` | % change vs prior month |

---

### 02 · Regional Performance (`02_regional_performance.sql`)

Aggregates sales and profit by `region`, surfacing which regions are most profitable and where losses are concentrated.

**Key columns returned:**

| Column | Description |
|--------|-------------|
| `region` | Sales region |
| `total_revenue` | Sum of sales |
| `total_profit` | Sum of profit |
| `unique_orders` | Count of distinct order IDs |
| `profit_margin_pct` | Profit ÷ Sales × 100 |
| `loss_orders` | Number of loss-making order rows |

---

### 03 · Top 10 Products by Revenue (`03_top10_products.sql`)

Uses `RANK()` window function over product-level aggregates to surface the top 10 revenue-generating products.

**Key columns returned:**

| Column | Description |
|--------|-------------|
| `product name` | Product name |
| `category` / `sub-category` | Product classification |
| `revenue` | Total sales |
| `profit` | Total profit |
| `units_sold` | Total quantity sold |
| `revenue_rank` | Rank by revenue (1 = highest) |

---

### 04 · Loss Analysis by Sub-Category (`04_loss_analysis.sql`)

Identifies which sub-categories are loss-making and calculates each one's share of the total loss pool using a `CROSS JOIN` CTE pattern.

**Key columns returned:**

| Column | Description |
|--------|-------------|
| `sub_category` | Product sub-category |
| `category` | Parent category |
| `revenue` | Total sales |
| `profit` | Total profit (negative = loss) |
| `pct_of_total_loss` | % contribution to total losses |

---

### 05 · Discount Impact Analysis (`05_discount_impact.sql`)

Groups rows by `HighDiscount` and `IsLoss` flags to quantify the relationship between heavy discounting and profitability.

**Key columns returned:**

| Column | Description |
|--------|-------------|
| `HighDiscount` | 1 if discount ≥ 50% |
| `IsLoss` | 1 if profit < 0 |
| `row_count` | Number of order rows in group |
| `avg_sales` | Average sales value |
| `avg_profit` | Average profit |
| `avg_discount_pct` | Average discount % |

---

## 📓 Notebook

The full EDA lives in Google Colab:  
🔗 [Open in Colab](https://colab.research.google.com/drive/1fBohZ6rqAoURoLoiWtS0u_oVMI7qhS-v)

A copy is saved locally at `notebooks/Supermart_EDA.ipynb`.

---

## ✅ Progress

- ✅ Data cleaning (Python)
- ✅ SQL KPI queries
- ⬜ Power BI dashboard & screenshots