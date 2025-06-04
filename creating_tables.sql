CREATE DATABASE IF NOT EXISTS gymglamour_shop

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

