-- Top 5 products by total revenue (quantity * price)
-- Optimized for large datasets: add index so GROUP BY can use it.
--
-- Recommended index (choose one for your database):
--   PostgreSQL: CREATE INDEX idx_sales_product_name ON sales (product_name) INCLUDE (quantity, price);
--   MySQL:      CREATE INDEX idx_sales_product_name ON sales (product_name, quantity, price);
--   SQL Server: CREATE INDEX idx_sales_product_name ON sales (product_name) INCLUDE (quantity, price);
--
SELECT
    product_name,
    SUM(quantity * price) AS total_revenue
FROM sales
GROUP BY product_name
ORDER BY total_revenue DESC
LIMIT 5;
