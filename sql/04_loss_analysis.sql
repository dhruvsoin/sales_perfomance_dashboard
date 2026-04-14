USE sales_dashboard;

WITH subcat_summary AS (
    SELECT
        `sub-category`          AS sub_category,
        category,
        ROUND(SUM(sales), 2)    AS revenue,
        ROUND(SUM(profit), 2)   AS profit
    FROM superstore_cleaned
    GROUP BY `sub-category`, category
),
total_loss AS (
    SELECT ABS(SUM(profit)) AS loss_pool
    FROM superstore_cleaned
    WHERE profit < 0
)
SELECT
    s.sub_category,
    s.category,
    s.revenue,
    s.profit,
    ROUND(ABS(s.profit) / t.loss_pool * 100, 2) AS pct_of_total_loss
FROM subcat_summary s
CROSS JOIN total_loss t
WHERE s.profit < 0
ORDER BY s.profit ASC;