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
