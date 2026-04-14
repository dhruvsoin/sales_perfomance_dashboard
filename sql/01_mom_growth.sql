USE sales_dashboard;

WITH monthly_sales AS (
    SELECT
        yearmonth,
        ROUND(SUM(sales), 2) AS monthly_revenue
    FROM superstore_cleaned
    GROUP BY yearmonth
),
mom_calc AS (
    SELECT
        yearmonth,
        monthly_revenue,
        LAG(monthly_revenue) OVER (ORDER BY yearmonth) AS prev_month_revenue
    FROM monthly_sales
)
SELECT
    yearmonth,
    monthly_revenue,
    prev_month_revenue,
    ROUND(
        (monthly_revenue - prev_month_revenue) / prev_month_revenue * 100,
        2
    ) AS mom_growth_pct
FROM mom_calc
ORDER BY yearmonth;