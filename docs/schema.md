# Database Schema (Week 1)

**products**
- product_id (PK)
- barcode
- name
- brand
- category
- pack_size
- base_price
- cost

**transactions**
- transaction_id (PK)
- store_id
- customer_id
- ts
- total_amount

**transaction_items**
- item_id (PK)
- transaction_id (FK)
- product_id (FK)
- quantity
- price