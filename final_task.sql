SELECT 
	customerid, 
	firstname, 
	lastname, 
	customeremail, 
	customerphone, 
	customeraddress, 
	customercity, 
	customerstate, 
	customerzip
FROM final_task.customers;


SELECT 
	orderid, 
	"Date", 
	customerid, 
	prodnumber, 
	quantity
FROM final_task.orders;


SELECT 
	categoryid, 
	categoryname, 
	categoryabbreviation
FROM final_task.productcategory;


SELECT 
	prodnumber, 
	prodname, 
	category, 
	price
FROM final_task.products;

-----------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------

-- Membuat tabel master_table dengan syntax join
CREATE TABLE final_task.master_table AS
SELECT 
    o."Date" AS order_date, 
    pc.categoryname AS category_name,
    p.prodname AS product_name,
    p.price AS product_price,
    o.quantity AS order_qty,
    o.quantity * p.price AS total_sales,
    c.customeremail AS cust_email,
    c.customercity AS cust_city
FROM
    final_task.customers c
JOIN
    final_task.orders o ON c.customerid = o.customerid
JOIN
    final_task.products p ON o.prodnumber = p.prodnumber
JOIN
    final_task.productcategory pc ON p.category = pc.categoryid
ORDER BY
    o."Date";

   
--------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
  
--Merubah data table untuk mengurutkan dari yang paling awal sampai akhir, data perlu diubah karena filter
-- tidak dapat dijalankan sebelum values kolom order date dirubah menjadi "date"
UPDATE final_task.master_table
SET order_date = TO_DATE(order_date, 'MM/DD/YYYY');


SELECT * FROM final_task.master_table
ORDER BY
   order_date;
    
---------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------

