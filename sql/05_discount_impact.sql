USE sales_dashboard;

SELECT
    HighDiscount,
    IsLoss,
    COUNT(*)                   AS row_count,
    ROUND(AVG(sales), 2)       AS avg_sales,
    ROUND(AVG(profit), 2)      AS avg_profit,
    ROUND(AVG(discount)*100, 1) AS avg_discount_pct
FROM superstore_cleaned
GROUP BY HighDiscount, IsLoss
ORDER BY HighDiscount DESC, IsLoss DESC;