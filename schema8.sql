--1. Stored Procedure: CheckStockStatus
-- This is usually preloaded, but just in case:
CREATE EXTENSION IF NOT EXISTS plpgsql;

CREATE OR REPLACE PROCEDURE CheckStockStatus(input_product_id INT)
LANGUAGE plpgsql
AS $$
DECLARE
    available_quantity INT;
BEGIN
    -- Get the quantity available
    SELECT QuantityAvailable INTO available_quantity
    FROM Inventory
    WHERE ProductID = input_product_id;

    -- Conditional logic
    IF available_quantity > 0 THEN
        RAISE NOTICE 'In Stock (Qty: %)', available_quantity;
    ELSE
        RAISE NOTICE 'Out of Stock';
    END IF;
END;
$$;

CALL CheckStockStatus(1);


--2.1 Function: CalculateTotalPrice
CREATE OR REPLACE FUNCTION CalculateTotalPrice(unit_price NUMERIC, qty INT)
RETURNS NUMERIC AS $$
BEGIN
    RETURN unit_price * qty;
END;
$$ LANGUAGE plpgsql;

SELECT CalculateTotalPrice(599.99, 3) AS TotalAmount;

--2.2 Rewriting Stored Procedure: CheckStockWithThreshold for PostgreSQL
CREATE OR REPLACE PROCEDURE CheckStockWithThreshold(input_product_id INT, threshold INT)
LANGUAGE plpgsql
AS $$
DECLARE
    available_quantity INT;
BEGIN
    -- Check if the product exists
    SELECT QuantityAvailable INTO available_quantity
    FROM Inventory
    WHERE ProductID = input_product_id;

    -- If not found, raise error message
    IF available_quantity IS NULL THEN
        RAISE NOTICE 'Product not found';
    ELSIF available_quantity > threshold THEN
        RAISE NOTICE 'Enough Stock';
    ELSIF available_quantity = threshold THEN
        RAISE NOTICE 'Stock at threshold';
    ELSE
        RAISE NOTICE 'Low Stock';
    END IF;
END;
$$;

CALL CheckStockWithThreshold(1, 20);


--3. Create Procedure: CheckStockWithThreshold
CREATE OR REPLACE PROCEDURE CheckStockWithThreshold(input_product_id INT, threshold INT)
LANGUAGE plpgsql
AS $$
DECLARE
    available_quantity INT;
BEGIN
    -- Try to get the available quantity
    SELECT QuantityAvailable INTO available_quantity
    FROM Inventory
    WHERE ProductID = input_product_id;

    -- Conditional logic
    IF available_quantity IS NULL THEN
        RAISE NOTICE 'Product not found';
    ELSIF available_quantity > threshold THEN
        RAISE NOTICE 'Enough Stock';
    ELSIF available_quantity = threshold THEN
        RAISE NOTICE 'Stock at threshold';
    ELSE
        RAISE NOTICE 'Low Stock';
    END IF;
END;
$$;

CALL CheckStockWithThreshold(1, 20);



--4. Function with Parameters & Conditional Logic
CREATE OR REPLACE FUNCTION SafeTotalPrice(
    unit_price NUMERIC,
    qty INT
)
RETURNS NUMERIC AS $$
DECLARE
    result NUMERIC;
BEGIN
    -- Conditional logic
    IF qty = 0 THEN
        result := 0.00;
    ELSIF qty > 0 AND unit_price > 0 THEN
        result := unit_price * qty;
    ELSE
        result := NULL; -- Invalid case
    END IF;

    RETURN result;
END;
$$ LANGUAGE plpgsql;

SELECT SafeTotalPrice(200.00, 2) AS Total;
SELECT SafeTotalPrice(100.00, 0) AS Total;
SELECT SafeTotalPrice(-100.00, 5) AS Total;





