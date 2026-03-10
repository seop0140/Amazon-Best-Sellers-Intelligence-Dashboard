import pandas as pd
import ast

df = pd.read_csv("amazon_dataset_pandas.csv", encoding="latin1")

# Assign product_id to each of products
df['product_id'] = range(1, len(df) + 1)

# Set only needed columns for the product csv
products_columns = ["product_id", "name", "brandName", "nodeName", "rating", "reviewCount", "listedPrice", "salePrice",
                 "features", "weight_value", "weight_unit", "weight_converted"]
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

# for loop separating the JSON format list in the variant column
for _, row in df.iterrows():
    colours = []
    sizes = []
    for variant in row['variants']:
        if isinstance(variant, dict):
            if 'color' in variant:
                colours.append(variant['color'])
            if 'size' in variant:
                sizes.append(variant['size'])
    variants_rows.append({
        "product_id": row['product_id'],
        "colours": colours if colours else None,
        "sizes": sizes if sizes else None
    })

df_variants = pd.DataFrame(variants_rows)

df_products.to_csv("products_table.csv", index=False)
df_variants.to_csv("variants_table.csv", index=False)



