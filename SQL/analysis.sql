-- Q1 Do higher product ratings actually drive sales popularity?
SELECT 
    ROUND(rating, 1) AS rating,
    COUNT(product_id) AS product_count,
    SUM(reviewCount) AS total_reviews,
    ROUND(AVG(reviewCount), 0) AS avg_reviews,
    MAX(reviewCount) AS max_reviews
FROM products
WHERE rating IS NOT NULL
GROUP BY rating
ORDER BY rating DESC;



-- Q2 Which Brands dominate Best-seller rankings across different categories?
-- Top 10 brand ordered by total product count 
SELECT 
    brandName_cleaned AS brand_name,
    COUNT(product_id) AS product_count,
    SUM(reviewCount) AS total_reviews,
    ROUND(AVG(rating), 1) AS avg_rating
FROM products
GROUP BY brandName_cleaned
ORDER BY product_count DESC
LIMIT 10;

-- Brands with total reviews and average rating 
SELECT 
    brandName_cleaned,
    COUNT(product_id) AS product_count,
    SUM(reviewCount) AS total_reviews,
    ROUND(AVG(rating), 1) AS average_rating
FROM products
WHERE brandName_cleaned NOT IN ('.us', 'Unknown Brand')
GROUP BY brandName_cleaned 
ORDER BY product_count DESC;


-- Showing total number of reviews within the category
SELECT
	product_category,
    SUM(reviewCount) AS total_reviews
    FROM products
    group by product_category
	order by total_reviews DESC;




-- Q3 Are best-sellers driven by competitive pricing or brand power?
SELECT 
    name_cleaned,
    brandName_cleaned,
    salePrice,
    listedPrice,
    reviewCount,
    rating,
    (listedPrice - salePrice) / listedPrice AS discount_percentage
FROM products
WHERE salePrice IS NOT NULL
AND listedPrice IS NOT NULL;

SELECT 
    brandName_cleaned,
    ROUND(AVG(listedPrice), 2) AS avg_listed_price,
    ROUND(AVG(salePrice), 2) AS avg_sale_price,
    ROUND(AVG((listedPrice - salePrice) / listedPrice), 2) AS avg_discount_percentage,
    SUM(reviewCount) AS total_reviews
FROM products
WHERE brandName_cleaned != '.us' AND brandName_cleaned != 'Unknown Brand'
GROUP BY brandName_cleaned
ORDER BY avg_discount_percentage DESC;

-- Q4 Are bundled products more likely to become best sellers?
SELECT 
    bundle_type,
    COUNT(product_id) AS product_count,
    AVG(reviewCount) AS avrage_reviews,
    AVG(rating) AS average_rating,
    AVG(listedPrice) AS average_listed_price
FROM products
GROUP BY bundle_type;


-- Showing bundle types of products with reviews more than 500.
SELECT 
    bundle_type,
    COUNT(product_id) AS high_review_products
FROM products
WHERE reviewCount > 500
GROUP BY bundle_type;









