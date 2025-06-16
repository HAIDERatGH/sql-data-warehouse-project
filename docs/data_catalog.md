### Data Dictionary for Gold Layer

Overview 
The Gold Layer represents business-level data optimized for analytical and reporting use cases. It consists of dimension tables and fact tables structured around specific business metrics.
-------------------------------------------------------------------------------------------------------------------------------

### 1. gold.dim_customers 
Purpose : Stores customer details with demographic and geographic enrichments.
Columns : 

______________________________________________________________________________________________
| Column Name     | Data Type     | Description                                              |
|-----------------|---------------|----------------------------------------------------------|
| customer_key    | INT           | Surrogate key uniquely identifying each customer record. |
| customer_id     | INT           | Unique numerical identifier assigned to each customer.   |
| customer_number | NVARCHAR(50)  | Alphanumeric identifier representing the customer.       |
| first_name      | NVARCHAR(50)  | Customer's first name.                                   |
| last_name       | NVARCHAR(50)  | Customer's last name or family name.                     |
| country         | NVARCHAR(50)  | Country of residence (e.g., 'Australia').                |
| marital_status  | NVARCHAR(50)  | Customer's marital status (e.g., 'Married', 'Single').   |
| gender          | NVARCHAR(50)  | Customer's gender (e.g., 'Male', 'Female', 'N/A').       |
| birthdate       | DATE          | Date of birth in YYYY-MM-DD format.                      |
| create_date     | DATE          | Timestamp when the customer record was created.          |
----------------------------------------------------------------------------------------------



#### 2. gold.dim_products 
Purpose : Provides structured information on products and their attributes.
Columns :

_________________________________________________________________________________________________________
| Column Name           | Data Type     | Description                                                   |
|-----------------------|---------------|---------------------------------------------------------------|
| product_key           | INT           | Surrogate key uniquely identifying each product record.       |
| product_id            | INT           | Unique product identifier for internal tracking.              |
| product_number        | NVARCHAR(50)  | Structured alphanumeric code for categorization or inventory. |
| product_name          | NVARCHAR(50)  | Product name with key details (type, color, size).            |
| category_id           | NVARCHAR(50)  | Unique identifier for the product's category.                 |
| category              | NVARCHAR(50)  | Broad classification (e.g., Bikes, Components).               |
| subcategory           | NVARCHAR(50)  | Detailed classification within the category.                  |
| maintenance_required  | NVARCHAR(50)  | Indicates if the product requires maintenance ('Yes' / 'No'). |
| cost                  | INT           | Base price of the product in monetary units.                  |
| product_line          | NVARCHAR(50)  | The specific product line or series (e.g., Road, Mountain).   |
| start_date            | DATE          | Product availability start date.                              |
---------------------------------------------------------------------------------------------------------



#### 3. gold.fact_sales
Purpose : Stores transactional sales data for analytical purposes.
Columns :

____________________________________________________________________________________________
| Column Name     | Data Type     | Description                                            |
|-----------------|---------------|--------------------------------------------------------|
| order_number    | NVARCHAR(50)  | Unique alphanumeric identifier for each sales order.   |
| product_key     | INT           | Surrogate key linking to the product dimension table.  |
| customer_key    | INT           | Surrogate key linking to the customer dimension table. |
| order_date      | DATE          | Date when the order was placed.                        |
| shipping_date   | DATE          | Date when the order was shipped to the customer.       |
| due_date        | DATE          | Date when the order payment was due.                   |
| sales_amount    | INT           | Total monetary value of the sale per line item.        |
| quantity        | INT           | Number of units of the product ordered.                |
| price           | INT           | Price per unit of the product.                         |
--------------------------------------------------------------------------------------------



