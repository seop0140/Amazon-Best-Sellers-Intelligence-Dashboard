import pandas as pd
import ast

df = pd.read_csv("Dataset/amazon_dataset_pandas_final.csv", encoding="latin1")


# Set only needed columns for the product csv
products_columns = ["product_id", "name_cleaned", "brandName_cleaned", "product_category", "rating", "reviewCount", "listedPrice", "salePrice",
                  "weight_value", "weight_unit", "weight_converted", "bundle_type"]
df_products = df[products_columns]

# Function for going through the values in the variant column
def safe_parse(x):
    if pd.isna(x) or x == "":
        return []
    try:
        return ast.literal_eval(x)
    except:
        return []

df['variants'] = df['variants'].apply(safe_parse)


variants_rows = []
variant_counter =1
# for loop separating the JSON format list in the variant column
for _, row in df.iterrows():
    colours = []
    sizes = []
    for variant in row['variants']:
        if isinstance(variant, dict):
            colour = variant.get('color', None)
            size = variant.get('size', None)

            variants_rows.append({
                "variant_id": variant_counter,
                "product_id": row['product_id'],
                "colour": colour,
                "size": size
    })
            variant_counter += 1

df_variants = pd.DataFrame(variants_rows)

df_products.to_csv("products_table.csv", index=False)
df_variants.to_csv("variants_table.csv", index=False)



