-- Total monthly revenue (revenue = quantity * price per sale)
-- Optimized for large datasets: index on sale_date enables efficient range scan.
--
-- Recommended index (see Schema/create_tables.sql):
--   CREATE INDEX idx_sales_sale_date ON sales (sale_date) INCLUDE (quantity, price);
--
SELECT
    EXTRACT(YEAR FROM sale_date)  AS year,
    EXTRACT(MONTH FROM sale_date) AS month,
    SUM(quantity * price)         AS total_revenue
FROM sales
GROUP BY EXTRACT(YEAR FROM sale_date), EXTRACT(MONTH FROM sale_date)
ORDER BY year, month;
