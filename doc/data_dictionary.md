# Data Dictionary

**Schema:** cursor-sql-poc  
**Version:** 1.0  
**Last updated:** February 2025  

---

## 1. Overview

This document describes the structure, data types, and business meaning of tables and columns in the sales schema.

| Table   | Description                    |
|---------|--------------------------------|
| [sales](#2-sales) | Transaction-level sales records |

---

## 2. sales

Stores individual sales transactions. Each row represents one sale of a product (one or more units) on a given date.

| Column       | Data type     | Nullable | Key  | Description |
|-------------|---------------|----------|------|-------------|
| id          | INTEGER       | No       | PK  | Unique identifier for the sale record. |
| product_name| VARCHAR(255)  | No       | —   | Name of the product sold. |
| quantity    | INTEGER       | No       | —   | Number of units sold in this transaction. Must be ≥ 1. |
| price       | DECIMAL(10,2) | No       | —   | Unit price at time of sale. Stored with 2 decimal places. |
| sale_date   | DATE          | No       | —   | Date on which the sale occurred (no time component). |

### 2.1 Derived / computed concepts

- **Line revenue** = `quantity * price` (revenue for this sale line).
- **Total revenue** (reporting) = `SUM(quantity * price)` over the desired scope (e.g. by product, by month).

### 2.2 Indexes (recommended for performance)

| Index name               | Columns                          | Purpose |
|--------------------------|-----------------------------------|---------|
| idx_sales_product_name   | (product_name) INCLUDE (quantity, price) | Aggregations and reports by product. |
| idx_sales_sale_date      | (sale_date)                      | Time-based and monthly revenue reports. |

---

## 3. Revision history

| Version | Date       | Author | Changes     |
|---------|------------|--------|-------------|
| 1.0     | Feb 2025   | —      | Initial release. |
