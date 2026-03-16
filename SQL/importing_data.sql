
#Products Table import
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/products_table.csv'
INTO TABLE products
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


UPDATE products SET rating = NULL WHERE rating = '' AND product_id IS NOT NULL;
UPDATE products SET reviewCount = NULL WHERE reviewCount = '';
UPDATE products SET listedPrice = NULL WHERE listedPrice = '';
UPDATE products SET salePrice = NULL WHERE salePrice = '';
UPDATE products SET weight_value = NULL WHERE weight_value = '';
UPDATE products SET weight_converted = NULL WHERE weight_converted = '';



ALTER TABLE products MODIFY COLUMN rating FLOAT;
ALTER TABLE products MODIFY COLUMN reviewCount INT;
ALTER TABLE products MODIFY COLUMN listedPrice FLOAT;
ALTER TABLE products MODIFY COLUMN salePrice FLOAT;
ALTER TABLE products MODIFY COLUMN weight_value FLOAT;
ALTER TABLE products MODIFY COLUMN weight_converted INT;

#Variants Table import
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/variants_table_cleaned.csv'
INTO TABLE variants
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
