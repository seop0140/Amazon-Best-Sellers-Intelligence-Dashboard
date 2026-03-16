import pandas as pd

df = pd.read_csv("Dataset/amazon_dataset.csv", encoding="latin1")


#Function to check if the row contains numeric values or not
def is_number(x):
    try:
        float(x)
        return True
    except:
        return False

#Print weird values in listedPrice or salePrice for easy visual
weird_rows = df[~df['listedPrice'].apply(is_number) | ~df['salePrice'].apply(is_number)]
print("Weird rows in price columns:")
print(weird_rows[['listedPrice', 'salePrice', 'name']])

#Convert numeric strings to float, invalid entries become NaN
df['listedPrice'] = pd.to_numeric(df['listedPrice'], errors='coerce')
df['salePrice'] = pd.to_numeric(df['salePrice'], errors='coerce')

#Fill missing values in listedPrice with corresponding salePrice values
df['listedPrice'] = df['listedPrice'].fillna(df['salePrice'])

#Keep rows that now have at least one valid price
df_clean = df[df['listedPrice'].notnull()]

df_clean = df_clean.reset_index(drop=True)

df_clean['product_id'] = range(1, len(df) + 1)
#Checking how many rows were dropped
print(f"Cleaned dataset has {len(df_clean)} rows")

df_clean.to_csv("amazon_dataset_pandas.csv", index=False, encoding="utf-8")