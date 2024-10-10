# BI_Analyst_Bank_Muamalat_x_Rakamin_Academy_2
Berisi mengenai query yang telah berhasil dijalankan selama proses internship termasuk study cases harian dan final task 


| Table           | Column               | Data Type | Explanation                                                                 |
|-----------------|----------------------|-----------|------------------------------------------------------------------------------|
| customers       | CustomerID           | INT64     | Unique values representing customers, not for numeric calculations.           |
|                 | FirstName            | STRING    | -                                                                            |
|                 | LastName             | STRING    | -                                                                            |
|                 | CustomerEmail        | STRING    | -                                                                            |
|                 | CustomerPhone        | STRING    | -                                                                            |
|                 | CustomerAddress      | STRING    | -                                                                            |
|                 | CustomerCity         | STRING    | -                                                                            |
|                 | CustomerState        | STRING    | -                                                                            |
|                 | CustomerZip          | INT64     | Categorical, representing postal codes.                                       |
| products        | ProdNumber           | STRING    | -                                                                            |
|                 | ProdName             | STRING    | -                                                                            |
|                 | Category             | INT64     | -                                                                            |
|                 | Price                | FLOAT64   | -                                                                            |
| product_category| CategoryID           | INT64     | Unique identifiers for product categories.                                    |
|                 | CategoryName         | STRING    | -                                                                            |
|                 | CategoryAbbreviation | STRING    | -                                                                            |
| orders          | OrderID              | INT64     | Unique values for orders.                                                    |
|                 | Date                 | STRING    | Needs to be converted to date format.                                         |
|                 | CustomerID           | INT64     | Unique identifiers for customers.                                            |
|                 | ProdNumber           | STRING    | -                                                                            |
|                 | Quantity             | INT64     | Number of items in the order.                                                |
| master_table    | order_date           | DATE      | -                                                                            |
|                 | category_name        | STRING    | -                                                                            |
|                 | product_name         | STRING    | -                                                                            |
|                 | product_price        | REAL      | -                                                                            |
|                 | order_qty            | INT64     | -                                                                            |
|                 | total_sales          | REAL      | -                                                                            |
|                 | cust_email           | STRING    | -                                                                            |
|                 | cust_city            | STRING    | -                                                                            |
|                 | cust_state           | STRING    | -                                                                            |


| Table           | Column             | Description                              |
|-----------------|--------------------|------------------------------------------|
| **customers**    | CustomerID         | Unique customer ID                       |
|                 | FirstName          | Customer's first name                    |
|                 | LastName           | Customer's last name                     |
|                 | CustomerEmail      | Customer's email address                 |
|                 | CustomerPhone      | Customer's phone number                  |
|                 | CustomerAddress    | Customer's full address                  |
|                 | CustomerCity       | Customer's city of residence             |
|                 | CustomerState      | Customer's state of residence            |
|                 | CustomerZip        | Customer's zip code                      |
| **products**     | ProdNumber         | Unique product ID                        |
|                 | ProdName           | Product name                             |
|                 | Category           | Product category                         |
|                 | Price              | Product price                            |
| **product_category** | CategoryID      | Unique category ID                       |
|                 | CategoryName       | Product category name                    |
|                 | CategoryAbbrev     | Product category abbreviation            |
| **orders**       | OrderID           | Unique order ID                          |
|                 | Date               | Order date                               |
|                 | CustomerID         | Customer ID related to the order         |
|                 | ProdNumber         | Product ID related to the order          |
|                 | Quantity           | Quantity of product in the order         |
| **master_table** | order_date         | Order date                               |
|                 | category_name      | Product category name                    |
|                 | product_name       | Product name                             |
|                 | product_price      | Product price                            |
|                 | order_qty          | Quantity of product ordered              |
|                 | total_sales        | Total sales                              |
|                 | cust_email         | Customer email                           |
|                 | cust_city          | Customer city                            |
|                 | cust_state         | Customer state                           |

---

| Step by Step                 | Table/Column       | Result                                                                                     | Action                                                                                               | Reason                                                                                                                                                   |
|------------------------------|--------------------|--------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------|
| Check column & table names    | All Table & columns| Table and column names are inconsistent, for example, mixing uppercase and lowercase letters and naming with concatenated letters, such as 'OrderID', 'CustomerCity' | Rename tables and columns to be consistent with lowercase letters and separated by underscores (_), for example, OrderID > order_id           | This is an optional option to facilitate code creation and improve readability.                                                                           |
| Check NULL values             | All Table & columns| There are no NULL values                                                                    | -                                                                                                    | -                                                                                                                                                        |
| Check duplicate values        | All Table          | There are no duplicate values                                                               | -                                                                                                    | -                                                                                                                                                        |
| Change data types             | order_date column  | The `order_date` column is detected to have an incorrect data type, which is a string.      | Change the data type of the order_date column to date                                                 | Changing the order_date column from string to date is necessary to ensure the accuracy of date processing, allowing for more precise calculations and facilitating time analysis. |
| Create master table           | master_table       | -                                                                                          | Create the Master Table                                                                              | Facilitating better analysis with a more organized data structure.                                                                                        |