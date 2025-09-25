import sqlite3
import pandas as pd
from ingest import load_products, load_transactions
from transform import flatten_transactions

# Lets make a connection to the SQLite database
conn=sqlite3.connect("data/analytics.db")

# Products
products=load_products()
products.to_sql("products",conn,if_exists="replace",index=False)

# Transactions (flattened)
txs=load_transactions()
tx_items=flatten_transactions(txs)
tx_items[["transaction_id","store_id","customer_id","ts","total_amount"]].drop_duplicates().to_sql("transactions",conn,if_exists="replace",index=False)
tx_items[["transaction_id","product_id","quantity","price"]].to_sql("transaction_items",conn,if_exists="replace",index=False)

conn.close()
print("ETL process completed successfully.")