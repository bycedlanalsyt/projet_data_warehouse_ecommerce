-- 1. CREATION DU SCHEMA & DES TABLES DE DIMENSIONS
-- 1.1 CREATION DU SCHEMA
CREATE DATABASE DataWarehouse_Ecommerce;
GO

USE DataWarehouse_Ecommerce;
GO

--1.2. CREATION DES TABLES DE DIMENSIONS
-- 1.3 Table dim_customers
CREATE TABLE dim_customers (
    customer_id INT PRIMARY KEY,
    first_name NVARCHAR(100),
    last_name NVARCHAR(100),
    email NVARCHAR(150),
    region_id INT,
    FOREIGN KEY (region_id) REFERENCES dim_regions(region_id)
);

-- 1.4 Table dim_date
CREATE TABLE dim_date (
    date_id INT PRIMARY KEY,
    full_date DATE,
    year INT,
    month INT,
    day INT
);

-- 1.5 Table dim_payments
CREATE TABLE dim_payments (
    payment_id INT PRIMARY KEY,
    payment_method NVARCHAR(50),
    payment_date DATE
);

-- 1.6 Table dim_products
CREATE TABLE dim_products (
    product_id INT PRIMARY KEY,
    product_name NVARCHAR(150),
    category NVARCHAR(100),
    price DECIMAL(10,2)
);

-- 1.7 Table dim_regions
CREATE TABLE dim_regions (
    region_id INT PRIMARY KEY,
    region_name NVARCHAR(100)
);