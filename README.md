# E-commerce sales data analysis project
*Database schema for an e-commerce store, including table creation scripts and sample data.*

Welcome to my first data project, where I showcase the skills I have independently developed over the past few months.
The main objective of this project was to design and build a relational database from scratch for a sample online store using MySQL. The entire structure was designed according to the principles of Third Normal Form (3NF) to ensure data integrity and consistency.

The product data (names, categories, store name) was inspired by publicly available information from a real-life example — Gym Glamour — and was used solely for educational and demonstrative purposes. All other data, such as product prices, stock levels, customer information, and sales records, is entirely fictional and manually created for the purpose of this project.
No private data has been used. Every table, record, and query has been carefully crafted to reflect a realistic e-commerce environment and to demonstrate my ability to work with relational databases, SQL, and data modeling. The main objective of this project was to design and build a relational database from scratch for a sample online store using MySQL. The entire structure was designed according to the principles of Third Normal Form (3NF) to ensure data integrity and consistency.

Every table, record, and query has been carefully crafted to reflect a realistic e-commerce environment and to demonstrate my ability to work with relational databases, SQL, and data modeling.

## Project scope

* Designed the database structure in accordance with Third Normal Form (3NF)
* Created a complete relational database schema from scratch
* Built tables and defined relationships using MySQL Workbench
* Manually added sample data to simulate a realistic online store environment
* Developed a set of analytical SQL queries for business insights and reporting
* Developed reports and data visualizations in PowerBI

## Tool Selection: MySQL Workbench

For this project, I chose to work with MySQL Workbench over other database management tools such as SQL Server Management Studio (SSMS). The reason was only the fact that for me is ease-to-use and I was able to create ERD diagram directly from the schema without creating tables.

### Database Structure

* products – product information i.e. id, name, SKU unit_price, id_category, size)
* customers – customer data i.e. name, surname, email, phone number, customer type (registered, guest), registration_date
* customer addresses – address id, customer id, address type (billing, delivery), street, city, postal code, country
* orders – order data (order id, customer id, order date, order status
* order_details – id, order_id, product_id, quantity, unit_price_net, vat_rate, unit_price_gross, payment_method, id_user
* users - id, username, user_role, email_address, password_hash, full_name, phone_number, registration_date, is_active
* categories - id, category_name, category_description, created_date, is_active

### Password Handling
In the table *users*, user passwords are stored as secure hashes rather than plain text.For the purpose of this portfolio project, sample password hashes have been generated manually.
[https://github.com/szmitadrianna/Online_Retail_Analytics_-Project/blob/main/password_hash.sql]

# SQL queries
* Total Revenue for a Year (in this case for 2024)
* Monthly Revenue
* Number of Orders per Customer
* Average Order Value (AOV)
* Revenue per Country
* Top Spending Customers
* Number of Orders per Month
* Most frequently chosen payment method
* Best Seller by number of products sold

### Loading MySQL Data into Power BI and Transforming Data Types
First, I downloaded and installed the official MySQL Connector/ODBC driver, which allows Power BI to communicate with MySQL.I connected Power BI to my MySQL database created in MySQL Workbench by selecting „MySQL database” as the data source in Power BI. I entered the server details (localhost and database name), provided my MySQL credentials, and successfully loaded the necessary tables.
Before loading the data into the Power BI model, I used Power Query Editor to clean and transform the data. One key step was setting the correct data types:
* I changed the date field to the Date type, which allows for time-based filtering and analysis.
* I also ensured the SKU (product code) column was set to Text, since it may contain letters, numbers, and symbols.

Once the data types were properly assigned and validated, I loaded the cleaned data into Power BI and started building visualizations and insights.

### Creating Dasboards in PowerBi – step by step

* Designed the layout to include key performance indicators (KPIs) at the top: Total Revenue, Number of Orders, Average Order Value, and Historical CLV.
* Added interactive filters for category and country to customize the view and date range slider.
* I created specific DAX measures to calculate the key metrics displayed on the dashboard:Total Revenue, Average Order Value, Customer Lifetime Value (CLV).

Created visualizations:
* Bar charts for total revenue by month and bestsellers by number of products sold.
* donut chart to show the sum of quantity by payment method.
* Tree map to display total revenue per country.
* Bar chart for sum of quantity per month.

## Project Summary
What I Learned

* Writing SQL queries for data extraction, aggregation, and reporting.
* Troubleshooting database issues23.
* Using Power BI to import data, transform data types, and build comprehensive dashboards with DAX measures (e.g., Total Revenue, Average Order Value, Customer Lifetime Value).
* Designing clear dashboards with interactive filters, KPI cards and visualizations.
  
+ I documented my work and shared all scripts and code in a dedicated GitHub repository.
