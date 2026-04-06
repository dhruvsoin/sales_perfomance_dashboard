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
├── sql/                                     # Coming soon
│   ├── 01_monthly_revenue.sql
│   ├── 02_mom_growth.sql
│   ├── 03_regional_performance.sql
│   ├── 04_top10_products.sql
│   └── 05_loss_analysis.sql
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
| SQL (T-SQL) | KPI queries & business logic |
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

## 📓 Notebook

The full EDA lives in Google Colab:  
🔗 [Open in Colab](https://colab.research.google.com/drive/1fBohZ6rqAoURoLoiWtS0u_oVMI7qhS-v)

A copy is saved locally at `notebooks/Supermart_EDA.ipynb`.

---

## 🚧 Coming Soon

- ✅ Data cleaning (Python)
- ⬜ SQL KPI queries
- ⬜ Power BI dashboard & screenshots

---

## 📄 License

MIT License
