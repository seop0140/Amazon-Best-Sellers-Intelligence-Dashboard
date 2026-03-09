# Data Schema
| Column Name | Description | Type |
|-------------|-------------|------|
| additionalProperties | A collection of product-specific details, including MPAA rating, dimensions, media format, run time, release date, actors, dubbed languages, studio, ASIN, country of origin, and best sellers rank. | string |
| brandName | The brand or manufacturer name of the product. Useful for filtering and identifying products from specific brands. | string |
| breadcrumbs | A hierarchical list of categories that the product belongs to, often used for navigation and filtering. | string |
| color | The color or color combination of the product. Useful for filtering and product selection based on visual appeal. | string |
| currency | The currency code for the product's price, typically USD. | string |
| current_depth | The current depth of the item within a hierarchical category structure. | integer |
| description | A concise textual description of the product. | string |
| descriptionRaw | The raw HTML or markup version of the product description. | string |
| features | A list of key product features often presented as bullet points describing characteristics or benefits. | string |
| gtin | The Global Trade Item Number used to uniquely identify the product in commerce. | string |
| imageUrls | A list of URLs pointing to images of the product. | string |
| inStock | Indicates whether the product is currently available in stock. | string |
| listedPrice | The listed price of the product. | float |
| material | The primary material from which the product is made. | string |
| mpn | The manufacturer part number used for product identification. | string |
| name | The name or title of the product including brand, model, and attributes. | string |
| new_path | The category path representing the product’s location in the hierarchy. | string |
| nodeName | The name of the product category indicating the top-level grouping. | string |
| rating | The average product rating based on user reviews. | float |
| reviewCount | The total number of user reviews submitted for the product. | float |
| salePrice | The current sale price of the product. | float |
| scrapedDate | The date and time when the product data was scraped (ISO 8601 format). | string |
| size | The dimensions and weight of the product formatted as a string. | string |
| sku | The unique Stock Keeping Unit identifier for the product. | string |
| style | The style or design variation of the product. | string |
| url | The URL of the product page on Amazon. | string |
| variants | A list of product variants with attributes such as size. | string |
| weight_rawUnit | The original unit of weight measurement from the product page. | string |
| weight_unit | The standardized unit of weight measurement. | string |
| weight_value | The numerical value of the product’s weight. | float |

# Data Cleaning Process log

### Removing Unnecessary Columns
In the beginning of the data cleaning process, I have decided to drop the columns that is not meaningful for analysis such as:
* **URL & imageURL**: URL of product page/image is not needed
* **scrapedDate**: Date when the data is scraped is not needed
* **description & descriptionRaw**: Description of products are not needed
These were done using Power Query Editor in Excel, I decided to keep the other columns for now to see if they can be used to do further analysis.

### Removing null values, misplaced values on listedPrice and SalePrice
If there are null values on both listed price and sales price, my analysis cannot be answered. While examining the columns I also found out there were misplaced values inside salePrice column which was meant to be in other columns. Thankfully, these misplaced values existed in their correct columns, it was just an error during the data scraping. By using Python(Pandas), missing/wrong values listedPrice column were filled using the corresponding salePrice values, if they had one. Rows with both prices missing were removed to maintain pricing integrity for analysis.

### Converting Weight unit, value


### Dealing with Errors in reviewCount and rating