# Online_Retail_Analytics_-Project
*Database schema for an e-commerce store, including table creation scripts and sample data.*

Welcome to my first data project, where I showcase the skills I have independently developed over the past few months.
The main objective of this project was to design and build a relational database from scratch for a sample online store using MySQL. The entire structure was designed according to the principles of Third Normal Form (3NF) to ensure data integrity and consistency.

## ERD Diagram https://github.com/szmitadrianna/Online_Retail_Analytics_-Project/blob/main/diagram.png

The product data (names, categories, store name) was inspired by publicly available information from a real-life example — Gym Glamour — and was used solely for educational and demonstrative purposes. All other data, such as product prices, stock levels, customer information, and sales records, is entirely fictional and manually created for the purpose of this project.
No private data has been used. Every table, record, and query has been carefully crafted to reflect a realistic e-commerce environment and to demonstrate my ability to work with relational databases, SQL, and data modeling.

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

* products – product information i.e. id, name, unit_price, id_category, size)
* customers – customer data i.e. name, surname, email, phone number, customer type (registered, guest), registration_date
* customer addresses – address id, customer id, address type (billing, delivery), street, city, postal code, country
* orders – order data (order id, customer id, order date, order status
* order_details – id, order_id, product_id, quantity, unit_price_net, vat_rate, unit_price_gross, payment_method, id_user
* users - id, username, user_role, email_address, password_hash, full_name, phone_number, registration_date, is_active
* categories - id, category_name, category_description, created_date, is_active

CREATE TABLE IF NOT EXISTS categories (
id_category INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
category_name VARCHAR(50) NOT NULL,
category_description TEXT,
created_date DATE NOT NULL,
is_active BOOLEAN);

CREATE TABLE IF NOT EXISTS products (
id_product INT PRIMARY KEY AUTO_INCREMENT,
product_name VARCHAR(60) NOT NULL,
unit_price DECIMAL(10,2) NOT NULL,
id_category INT,
product_size ENUM('S', 'M', 'L')
);

CREATE TABLE IF NOT EXISTS customers (
id_customer INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(100) NOT NULL,
email_address VARCHAR(150) NOT NULL,
phone_number VARCHAR(15) NOT NULL,
customer_type ENUM('registered', 'guest') NOT NULL,
registration_date DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL
);

CREATE TABLE IF NOT EXISTS customer_address (
id_address INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
id_customer INT NOT NULL,
address_type ENUM('billing', 'shipping'),
street VARCHAR(100) NOT NULL,
street_number VARCHAR(10) NOT NULL,
house_number VARCHAR(4),
city VARCHAR(90) NOT NULL,
country VARCHAR(100) NOT NULL,
FOREIGN KEY (id_customer) REFERENCES customers(id_customer)
);

CREATE TABLE IF NOT EXISTS orders (
id_order INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
id_customer INT NOT NULL,
id_address INT NOT NULL,
date_of_order DATETIME DEFAULT current_timestamp NOT NULL,
status_order ENUM('pending','processing','shipped','delivered','canceled'),
FOREIGN KEY (id_customer) REFERENCES customers(id_customer),
FOREIGN KEY (id_address) REFERENCES customer_address(id_address)
);

CREATE TABLE IF NOT EXISTS users (
id_user INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
username VARCHAR(80) NOT NULL,
user_role ENUM('admin','csr','wh'),
email_address VARCHAR(100) NOT NULL,
password_hash VARCHAR(20) NOT NULL,
full_name VARCHAR(100) NOT NULL,
phone_number VARCHAR(20) NOT NULL,
registration_date DATETIME DEFAULT CURRENT_TIMESTAMP,
is_active BOOLEAN);

CREATE TABLE IF NOT EXISTS order_details (
id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
id_order INT NOT NULL,
id_product INT NOT NULL,
quantity INT NOT NULL,
unit_price_nett DECIMAL(10,2) NOT NULL,
vat_rate DECIMAL(5,2) NOT NULL,
unit_price_gross DECIMAL(10,2) NOT NULL,
payment_method ENUM('cc','dc','bt','c','ap'),
id_user INT,
FOREIGN KEY (id_order) REFERENCES orders(id_order),
FOREIGN KEY (id_product) REFERENCES products(id_product),
FOREIGN KEY (id_user) REFERENCES users(id_user));

ploading creating_tables.sql…]()

