-- Total monthly revenue (revenue = quantity * price per sale)
SELECT
    EXTRACT(YEAR FROM sale_date)  AS year,
    EXTRACT(MONTH FROM sale_date) AS month,
    SUM(quantity * price)         AS total_revenue
FROM sales
GROUP BY EXTRACT(YEAR FROM sale_date), EXTRACT(MONTH FROM sale_date)
ORDER BY year, month;
