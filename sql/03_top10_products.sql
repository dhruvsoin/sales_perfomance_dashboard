USE sales_dashboard;

WITH product_sales AS (
    SELECT
        `product name`,
        category,
        `sub-category`,
        ROUND(SUM(sales), 2)   AS revenue,
        ROUND(SUM(profit), 2)  AS profit,
        SUM(quantity)          AS units_sold
    FROM superstore_cleaned
    GROUP BY `product name`, category, `sub-category`
),
ranked_products AS (
    SELECT
        *,
        RANK() OVER (ORDER BY revenue DESC) AS revenue_rank
    FROM product_sales
)
SELECT *
FROM ranked_products
WHERE revenue_rank <= 10
ORDER BY revenue_rank;