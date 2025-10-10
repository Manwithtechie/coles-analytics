-- SQLite
SELECT product_id, barcode, name, brand, category, pack_size, base_price, cost
FROM products;

-- Top 5 products by revenue
SELECT p.name, SUM(ti.quantity*ti.price) as revenue
FROM transaction_items ti
JOIN products p ON ti.product_id = p.product_id
GROUP BY p.product_id
ORDER BY revenue DESC
LIMIT 5;

-- Top 5 categories by revenue
SELECT p.category, SUM(ti.quantity*ti.price) as revenue
FROM transaction_items ti
JOIN products p ON ti.product_id = p.product_id
GROUP BY p.category
ORDER BY revenue DESC
LIMIT 5;

-- Average basket size
SELECT ROUND(AVG(basket_size),2) as avg_basket_size
FROM (
    SELECT COUNT(*) as basket_size
    FROM transaction_items
    GROUP BY transaction_id
);