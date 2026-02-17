# cursor-sql-poc

SQL schema and reporting queries for a sales analytics proof-of-concept. Uses a single `sales` table and standard SQL suitable for PostgreSQL, MySQL, or SQL Server (with minor syntax notes where needed).

---

## Project structure

```
cursor-sql-poc/
├── Schema/
│   └── create_tables.sql    # Table definitions (sales)
├── Queries/
│   ├── revenue_report.sql   # Monthly revenue aggregation
│   └── top_products.sql     # Top 5 products by revenue
├── doc/
│   └── data_dictionary.md   # Data dictionary and column definitions
└── README.md                # This file
```

| Folder / file | Purpose |
|---------------|--------|
| **Schema/** | DDL for creating and evolving the database. |
| **Queries/** | Reporting and analytics SQL; run against the created schema. |
| **doc/** | Documentation (data dictionary, conventions). |

---

## Schema summary

The **sales** table holds one row per transaction line:

| Column | Type | Description |
|--------|------|-------------|
| `id` | INTEGER | Primary key. |
| `product_name` | VARCHAR(255) | Product sold. |
| `quantity` | INTEGER | Units sold. |
| `price` | DECIMAL(10,2) | Unit price. |
| `sale_date` | DATE | Sale date. |

Revenue for a row is `quantity * price`. See **Schema/create_tables.sql** for full DDL and **doc/data_dictionary.md** for detailed definitions and recommended indexes.

---

## Queries

### revenue_report.sql

**Purpose:** Total revenue by calendar month.

- **Output:** `year`, `month`, `total_revenue` (sum of `quantity * price` per month).
- **Use case:** Monthly revenue trends and period-over-period comparison.

Uses `EXTRACT(YEAR/MONTH FROM sale_date)`. On SQL Server (pre-2022), use `YEAR(sale_date)` and `MONTH(sale_date)` instead.

---

### top_products.sql

**Purpose:** Top 5 products by total revenue (all time).

- **Output:** `product_name`, `total_revenue`.
- **Use case:** Best-selling products by revenue.

Includes comments for indexes to improve performance on large datasets. On SQL Server, use `SELECT TOP 5` instead of `LIMIT 5`.

---

## Getting started

1. **Create the schema**  
   Run **Schema/create_tables.sql** in your database.

2. **(Optional) Add indexes**  
   See **doc/data_dictionary.md** for recommended indexes (e.g. on `product_name`, `sale_date`).

3. **Run reports**  
   Execute the scripts in **Queries/** as needed. Adjust date filters or limits in the SQL if required.

---

## Documentation

- **doc/data_dictionary.md** — Column definitions, data types, keys, and derived metrics for the schema.
