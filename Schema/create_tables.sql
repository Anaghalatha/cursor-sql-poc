-- Sales table
CREATE TABLE sales (
    id          INTEGER      PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    quantity    INTEGER      NOT NULL,
    price       DECIMAL(10, 2) NOT NULL,
    sale_date   DATE         NOT NULL
);

-- Indexes for query performance (work in PostgreSQL, MySQL, SQL Server)
-- For covering index (index-only scan), use INCLUDE (quantity, price) in PostgreSQL/SQL Server,
-- or add (quantity, price) to the key in MySQL.
CREATE INDEX idx_sales_product_name ON sales (product_name);
CREATE INDEX idx_sales_sale_date ON sales (sale_date);
