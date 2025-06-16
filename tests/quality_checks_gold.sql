/* 
===================================================================================
Quality Checks for Gold Layer Views
===================================================================================
Script Purpose :
   This script performs quality checks to validate the integrity, consistency,
   and accuracy of the Gold Layer. These checks ensure:
  - Uniqueness of surrogate keys in dimension tables.
  - Referential Integrity between fact and dimension tables.
  - Validation of relationships in the data model for analytical purposes.

Usage Notes :
  - Run these checks after data loading Silver Layer.
  - Investigate and resolve any discrepancies found during the checks.
===================================================================================
*/

--**gold.dim_customers**
-- Ensure all **customer_key** values are unique.
-- Verify **gender** column correctly applies fallback values using `COALESCE()`.
-- Validate that the **birthdate** column holds correct date values in `YYYY-MM-DD` format.

-- Check uniqueness of customer_key in dim_customers
  SELECT customer_key, COUNT(*)
  FROM gold.dim_customers
  GROUP BY customer_key
  HAVING COUNT(*) > 1;

-- Validate gender fallback logic
  SELECT gender, COUNT(*) 
  FROM gold.dim_customers
  GROUP BY gender;



--**gold.dim_products**
-- Check that **product_key** is sequential and unique across records.
-- Confirm that **category_id** has valid references and no orphaned data.
-- Ensure `prd_end_dt IS NULL` correctly filters out historical data.

-- Ensure all products have valid category mappings
  SELECT product_key, category_id
  FROM gold.dim_products
  WHERE category_id IS NULL;


**gold.fact_sales**
-- Verify **sales_amount** and **quantity** contain valid numerical values.
-- Check that **order_number** remains unique per transaction.
-- Validate proper **foreign key relationships** between fact tables and dimensions.

-- Validate the uniqueness of order_number in fact_sales
  SELECT order_number, COUNT(*)
  FROM gold.fact_sales
  GROUP BY order_number
  HAVING COUNT(*) > 1;

-- Check sales_amount for negative or unrealistic values
  SELECT *
  FROM gold.fact_sales
  WHERE sales_amount < 0 OR quantity <= 0;
-----------------------------------------------------------------------------------
===================================================================================
--End of Quality Checks
===================================================================================
