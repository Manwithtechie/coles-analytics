import pandas as pd
import json

def load_products(path="data/raw/products.csv"):
    return pd.read_csv(path)

def load_transactions(path="data/raw/transactions.json"):
    with open(path) as f:
        transactions=json.load(f)
    return transactions