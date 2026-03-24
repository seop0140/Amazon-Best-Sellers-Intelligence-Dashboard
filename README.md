# End To End Amazon Best Sellers Intelligence Dashboard
This Dashboard project analyzes the Octaprice Amazon Best Sellers dataset, a collection of over 25,000 products extracted from Amazon's best seller pages across different categories and subcategories. 

## Why I made this Dashboard

I regularly shop on Amazon, just like millions of people around the world. Whether it's something like electronics or everyday household items, I have always noticed how certain products consistently appear in top search results and Top Deals page(Best seller lists). 

As someone who carefully checks product reviews and quality before making a purchase, I became curious about what actually drives those rankings. Some products with thousands of reviews dominate their categories, while others with fewer reviews still manage to rank highly. In some cases, higher-priced products ranked lower, while cheaper products ranked higher. Observing these inconsistencies made me realize that there must be hidden patterns and underlying factors that determine why certain products become best sellers. 

This project aims to analyze product performance and customer engagement using data analytics techniques, with a focus on supporting business decision-making.


To analyze, I came up with 4 main analysis questions:
* Do higher product ratings drive product popularity?
* Which Brands dominate Best-seller rankings across different categories?
* Are best-sellers driven by competitive pricing or brand power?
* Are bundled products more likely to become best sellers?


## Summary of Insights:
**Product ratings have a positive but weak influence on popularity:**
Products with high ratings alone do not guarantee more reviews or sales. During the analysis, average rating and total review count were calculated for each product. A Pearson correlation analysis was also done for more detailed analysis. It showed that between average rating and total review count was r = 0.057(2 d.p) and p-value of <2.2e-16, which indicates a positive weak relationship. While most products with very high reviews have ratings above 4.0, rating alone does not strongly drive product popularity, possibly indicating a social proof effect. Many highly rated products still have relatively few reviews. 

**Brand dominance is strong in certain categories:** Products were grouped by category and brand, and total product counts and review volumse were analyzed to find out which brands are dominant within each category. 
In curated or proprietary categories, Amazon's private labels—Audible, Amazon Music and Amazon Basics dominated, as these were platform-owned brands, other brand competitors could find it difficult for them to stand out within those categories. One Brand frequently dominates niche markets like books, cars, and CDs/vinyl. The brand presence is more dispersed in utility categories including groceries, kitchens and homes. This suggests brand dominance is highly category-dependent, showing that competing in concentrated categories will require a strong brand position/popularity, rather than relying on pricing or volume.

**Pricing and discounts are not the main drivers of popularity:** To answer this question, discount percentage was calculated by (listed price - sale price) / listed price. This was used to examine the relationship between discount levels and review counts of different brands. It showed that Product reviews and the discount percentage have a weak negative correlation, and excessive discounts do not necessarily increase customer engagement. Customer behaviour appears more influenced by brand recognition or brand familirarity than price sensitivity. This indicates that just by applying high discounts will not have an effective growth in branding. Businesses needs to prioritize brand recognition first. 

**Bundled products impact engagement differently than single items:** For this analysis, products were differentiated into different bundle categories, and review counts were compared across these groups. It showed that reviews for multipacks are significantly higher compared to singles or other smaller bundles, this is likely due to their perceived value or frequent usage from customers as products in bulk tend to be cheaper and can be used multiple times when bought once. Single-item products dominated in volume, while smaller bundles(duo, trio, assortments) performed poorly suggesting there are standard purchase preferences among customers and lot of them would choose simplicity, showing high visibiliy inside the best-sellers. 

## General takeaway / Personal statement:
Brand power and social proof have a greater impact on best-seller popularity than the prices or ratings of the products alone. It can be seen that product type and bundle size do affect engagment, with products that are bulk or high-value bundles performing better on average. Market dynamics differ depending on the category, and success in one category does not necessarily imply success in others.  

My personal actionable advice for sellers and brands is to first focus on building customer trust to strengthen brand reputation, as this has a far greater chance on being a best-seller product. To promote long-term customer loyalty, avoid relying on excessive discounts and focus on emphasizing quality of the product and brand recognition. Next, actively promote social proof by looking for real customer reviews, as reviews and high ratings greatly increase the visibility of the product. Additionally, consider offering bulk or multipack products where relevant, as they tend to generate higher average of customer engagement. It is also essential to focus on category-specific strategies, because having dominance in one niche does not guarantee success in another.

## Challenges and Limitations:
### Missing prices and other inconsistent data:
Some products had missing values for both the column **listedPrice** and **salePrice**. Certain fields such as **nodeName** column and **brandName** column contained misplaced, inconsistent values that were incorrectly formatted. 
#### How I resolved it:
By using Excel Power Query, missing listed prices were corrected by extracting from sale price, and all other data was standardized in their correct formats and this was done by creating columns such as **brandName_cleaned** and **nodeName_cleaned**.

### Complex data structure:
In the **variants** column, the data was scraped in a form of nested JSON-like data. To fix this I initially tried expanding this column by taking all the data out of the list, however this resulted in a significant row duplication. 

#### How I resolved it:
To address this, by using Pandas in Python the dataset was restructured. First a unique **product_id** was assigned to each product, and the nested variant data was extracted into a separate table called **variants_table**. Here each variant values in JSON list was stored as an individual record. In the **variants_table**, **product_id** was used as a foreign key to maintain the relationship with **products_table**. This approach transformed the dataset into a relational structure which later helped me with analysis as it reduced redundancy. 

### Approximation for product popularity:
As the dataset did not contain an actual sales data, the popularity of product was approximated using the column **reviewCount** where it contained number of reviews posted for each product.



## Dashboard:
I have created an extensive Power BI dashboard to offer a dynamic view of the Amazon Best Sellers data. This dashboard enables deeper insights into what drives product popularity and customer engagement by analysic key metrics such as total reviews, average price, total products and average rating, providing a data-driven approach to understand the factors that influence best-selling products on Amazon. 

![alt text](Images/dashboard.png)

