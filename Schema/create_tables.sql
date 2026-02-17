-- Sales table
CREATE TABLE sales (
    id          INTEGER      PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    quantity    INTEGER      NOT NULL,
    price       DECIMAL(10, 2) NOT NULL,
    sale_date   DATE         NOT NULL
);
