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

```sql
CALL CheckStockWithThreshold(1, 20);

---

## Function: 'SafeTotalPrice(unit_price, qty)'
### Purpose:
Safely calculates the total price.

### Logic:
Returns NULL for negative values

Returns 0.00 if qty is zero

Otherwise: unit_price * qty

SELECT SafeTotalPrice(200.00, 2);   -- 400.00
SELECT SafeTotalPrice(100.00, 0);   -- 0.00
SELECT SafeTotalPrice(-50.00, 5);   -- NULL
---

## Files
File	Description
task8_procedures.sql	SQL code for procedures & functions
README.md	Task summary

 ## Tools
1)PostgreSQL 14+

2)pgAdmin 4

---

##Run
1)Open pgAdmin or PostgreSQL CLI

2)Run task8_procedures.sql

3)Use CALL and SELECT queries to test the logic
