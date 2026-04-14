USE sales_dashboard;

SELECT
    region,
    ROUND(SUM(sales), 2)                          AS total_revenue,
    ROUND(SUM(profit), 2)                         AS total_profit,
    COUNT(DISTINCT `order id`)                    AS unique_orders,
    ROUND(SUM(profit) / SUM(sales) * 100, 2)      AS profit_margin_pct,
    SUM(IsLoss)                                   AS loss_orders
FROM superstore_cleaned
GROUP BY region
ORDER BY total_revenue DESC;