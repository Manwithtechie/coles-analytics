import pandas as pd

def flatten_transactions(transactions):
    rows=[]
    for tx in transactions:
        for pid,qty,price in tx["items"]:
            rows.append({
                "transaction_id":tx["transaction_id"],
                "store_id":tx["store_id"],
                "customer_id":tx["customer_id"],
                "ts":tx["ts"],
                "total_amount":tx["total"],
                "product_id":pid,
                "quantity":qty,
                "price":price
            })
    return pd.DataFrame(rows)