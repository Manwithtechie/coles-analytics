import random, csv, uuid
from datetime import datetime, timedelta

NUM_STORES = 10
NUM_PRODUCTS = 500
NUM_CUSTOMERS = 2000
NUM_TX = 20000

def gen_products(n):
    categories = ['Dairy','Bakery','Produce','Meat','Pantry','Frozen','Beverages']
    products = []
    for i in range(1, n+1):
        products.append({
            'product_id': i,
            'barcode': str(100000000000 + i),
            'name': f'Product {i}',
            'brand': f'Brand {random.randint(1,50)}',
            'category': random.choice(categories),
            'pack_size': f'{random.choice([200,300,400,500,1000])}g',
            'base_price': round(random.uniform(1.5, 25.0), 2),
            'cost': round(random.uniform(0.5, 15.0), 2)
        })
    return products

def gen_transactions(products, num_tx):
    txs = []
    start = datetime.now() - timedelta(days=360)
    for tx_id in range(1, num_tx+1):
        ts = start + timedelta(minutes=random.randint(0, 360*24*60))
        store_id = random.randint(1, NUM_STORES)
        customer_id = random.randint(1, NUM_CUSTOMERS)
        num_items = random.choices([1,2,3,4,5,6], weights=[10,20,25,20,15,10])[0]
        items = []
        total = 0.0
        for _ in range(num_items):
            p = random.choice(products)
            qty = random.choices([1,2,3], weights=[80,15,5])[0]
            price = p['base_price'] * (0.95 if random.random() < 0.08 else 1.0) # occasional discount
            items.append((p['product_id'], qty, round(price,2)))
            total += price*qty
        txs.append({'transaction_id': tx_id, 'store_id': store_id, 'customer_id': customer_id, 'ts': ts.isoformat(), 'total': round(total,2), 'items': items})
    return txs

if __name__ == '__main__':
    products = gen_products(NUM_PRODUCTS)
    txs = gen_transactions(products, NUM_TX)
    # write CSVs
    with open('data/raw/products.csv','w',newline='') as f:
        w = csv.DictWriter(f, fieldnames=products[0].keys())
        w.writeheader()
        w.writerows(products)
    with open('data/raw/transactions.csv','w',newline='') as f:
        w.write = f.write
        import json
        with open('data/raw/transactions.json','w') as jf:
            json.dump(txs, jf)
    print('Generated synthetic data')