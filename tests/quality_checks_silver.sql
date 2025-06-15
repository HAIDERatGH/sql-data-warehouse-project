/*
==========================================================================================
 Quality Checks
==========================================================================================

Purpose of the Script : 
   The script silver.load_silver is designed to extract, cleanse, and standardize data from the Bronze layer tables into the Silver layer of the data warehouse. The goal is to ensure that the data is consistent, structured, and ready for analytical processing. Key transformations include:
   Removing duplicates based on the latest records.
   Trimming and standardizing text fields (e.g., names, gender, marital status).
   Correcting and formatting date values.
   Handling missing or invalid entries to maintain data integrity.
   Refining product identifiers for compatibility across systems.
   Validating numeric fields, such as sales and pricing, to ensure correctness.

Usage Notes
Execution: Run the script using SQL Server Management Studio (SSMS) or within an ETL workflow.
Batch Process: The script executes in a batch, ensuring all Silver tables are refreshed in a structured manner.
Error Handling: If any errors occur, they are captured using TRY...CATCH, with messages printed for debugging.
Performance Monitoring: The script logs execution durations at different stages for performance tracking.
Data Integrity Checks: Ensure source tables in the Bronze layer are properly populated before running the script.
Post-execution Validation: Use test queries (provided earlier) to verify the correctness of data transformations.
==========================================================================================

*/


/*Test Queries for silver.crm_cust_info*/

-- Check for duplicate customer IDs
SELECT cst_id, COUNT(*) 
FROM silver.crm_cust_info 
GROUP BY cst_id 
HAVING COUNT(*) > 1;

-- Validate marital status standardization
SELECT DISTINCT cst_marital_status 
FROM silver.crm_cust_info;

-- Check for missing values
SELECT * 
FROM silver.crm_cust_info 
WHERE cst_firstname IS NULL OR cst_lastname IS NULL;




/*Test Queries for silver.crm_prd_info*/ 

-- Validate that category ID formatting is correct
SELECT cat_id 
FROM silver.crm_prd_info 
WHERE cat_id LIKE '%-%';

-- Check for null or negative product costs
SELECT * 
FROM silver.crm_prd_info 
WHERE prd_cost IS NULL OR prd_cost < 0;

-- Validate product line standardization
SELECT DISTINCT prd_line 
FROM silver.crm_prd_info;




/*Test Queries for silver.crm_sales_details*/

-- Check for invalid or missing order dates
SELECT * 
FROM silver.crm_sales_details 
WHERE sls_order_dt IS NULL;

-- Validate sales calculations
SELECT * 
FROM silver.crm_sales_details 
WHERE sls_sales != sls_quantity * ABS(sls_price);

-- Check for negative or zero quantities
SELECT * 
FROM silver.crm_sales_details 
WHERE sls_quantity <= 0;




/*Test Queries for silver.erp_cust_az12*/

-- Validate customer ID formatting
SELECT cid 
FROM silver.erp_cust_az12 
WHERE cid LIKE 'NAS%';

-- Check for invalid birth dates
SELECT * 
FROM silver.erp_cust_az12 
WHERE bdate > GETDATE();

-- Verify gender standardization
SELECT DISTINCT gen 
FROM silver.erp_cust_az12;




/*Test Queries for silver.erp_loc_a101*/

-- Validate country name formatting
SELECT DISTINCT cntry 
FROM silver.erp_loc_a101;




/*Test Queries for silver.erp_px_cat_g1v2*/

-- Check for duplicate product categories
SELECT cat, COUNT(*) 
FROM silver.erp_px_cat_g1v2 
GROUP BY cat 
HAVING COUNT(*) > 1;


