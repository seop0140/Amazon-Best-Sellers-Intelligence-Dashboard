CREATE DATABASE amazon_analysis;
USE amazon_analysis;


CREATE TABLE products (
    product_id INT PRIMARY KEY,
    name_cleaned TEXT,
    brandName_cleaned TEXT,
    product_category TEXT,
    rating TEXT,
    reviewCount TEXT,
    listedPrice TEXT,
    salePrice TEXT,
    weight_value TEXT,
    weight_unit TEXT,
    weight_converted TEXT,
    bundle_type TEXT
);


CREATE TABLE variants (
    variant_id INT PRIMARY KEY,
    product_id INT,
    colour TEXT,
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);