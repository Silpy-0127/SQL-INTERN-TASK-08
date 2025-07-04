# SQL-INTERN-TASK-08: Stored Procedures & Functions

## Summary
Created reusable SQL logic using:
- Stored Procedure: `CheckStockWithThreshold`
- Function: `SafeTotalPrice(unit_price, qty)`
- Implemented input validation and conditional checks in **PostgreSQL 14+**

---

##  Procedure: `CheckStockWithThreshold`

### Purpose:
Checks if a product’s stock meets a given threshold.

### Logic:
- If stock > threshold → `Enough Stock`  
- If stock = threshold → `Stock at threshold`  
- If stock < threshold → `Low Stock`  
- If no product → `Product not found`

## Task Objective
Learn to modularize SQL logic using stored procedures and functions with parameters and conditional logic.

## Database
Used `LocalMarketDB`, which includes:
- Sellers, Customers, Categories
- Products, Inventory, Orders
- OrderItems, Payments

## What I Did
- Created 2 procedures:
  - `CheckStockStatus(product_id)`
  - `CheckStockWithThreshold(product_id, threshold)`
- Created 2 functions:
  - `CalculateTotalPrice(price, qty)`
  - `SafeTotalPrice(price, qty)` with input validation

## 🛠 Tools Used
- PostgreSQL 14
- pgAdmin 4

##  How to Use
```sql
CALL CheckStockStatus(1);
CALL CheckStockWithThreshold(1, 20);

SELECT CalculateTotalPrice(599.99, 3);
SELECT SafeTotalPrice(100.00, 0);
