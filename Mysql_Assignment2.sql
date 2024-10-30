/*Create a database called “Sales” and create a new table named “Orders” in the Sales database with columns: 
(Order_Id, Customer_name, Product_Category, Ordered_item, Contact_No). 
Use constraints: Primary Key Unique Not Null 
1. Add a new column named “order_quantity” to the orders table. 
2. Rename the orders table to the sales_orders table. 
3. Insert 10 rows into the sales_orders table. 
4. Retrieve customer_name and Ordered_Item from the sales_orders table. 
5. Use the update command to change the name of the product for any row. 
6. Delete the sales_orders table from the database.
*/

CREATE DATABASE Sales;
USE Sales;
CREATE TABLE Orders (
    Order_Id INT PRIMARY KEY,               -- Primary Key
    Customer_name VARCHAR(50) NOT NULL,     -- Not Null
    Product_Category VARCHAR(30) NOT NULL,  -- Not Null
    Ordered_item VARCHAR(50) NOT NULL,      -- Not Null
    Contact_No VARCHAR(15) UNIQUE NOT NULL  -- Unique and Not Null
);
SELECT * FROM Orders;
ALTER TABLE Orders ADD order_quantity INT;

ALTER TABLE Orders RENAME TO sales_orders;

INSERT INTO sales_orders (Order_Id, Customer_name, Product_Category, Ordered_item, Contact_No, order_quantity)
VALUES
(1, 'Aman Sharma', 'Electronics', 'Smartphone', '9876543210', 2),
(2, 'Neha Gupta', 'Clothing', 'T-shirt', '8765432109', 5),
(3, 'Raj Patel', 'Home Appliances', 'Blender', '7654321098', 1),
(4, 'Simran Kaur', 'Books', 'Novel', '6543210987', 3),
(5, 'Priya Singh', 'Groceries', 'Rice Bag', '5432109876', 10),
(6, 'Vikas Rao', 'Furniture', 'Chair', '4321098765', 4),
(7, 'Pooja Nair', 'Toys', 'Action Figure', '3210987654', 2),
(8, 'Anil Kumar', 'Footwear', 'Running Shoes', '2109876543', 1),
(9, 'Kiran Joshi', 'Electronics', 'Laptop', '1098765432', 1),
(10, 'Rahul Mehta', 'Stationery', 'Notebook', '0198765432', 7);

SELECT * FROM sales_orders;

SELECT Customer_name, Ordered_item FROM sales_orders;

UPDATE sales_orders 
SET Ordered_item = 'Tablet'
WHERE  Order_Id = 1;

DROP TABLE sales_orders;


