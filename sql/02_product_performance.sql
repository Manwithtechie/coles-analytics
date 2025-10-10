/*
=========================================
SQL Module: Product & Category Performance
Project: Coles Retail Analytics
Week: 2 | Day: 2
Author: Manvith
Description:
  This module analyzes product- and
  category-level performance metrics.
  Key KPIs include:
    - Top products by revenue
    - Category contribution
    - Profitability by category
=========================================
*/


-- 1. Top 10 Products by Revenue
-- Identifies high-performing products that drive most revenue.
SELECT 
    p.name AS product_name,
    p.brand,
    p.category,
    SUM(ti.quantity * ti.price) AS total_revenue,
    SUM(ti.quantity) AS total_units
FROM transaction_items ti
JOIN products p ON p.product_id = ti.product_id
GROUP BY p.product_id
ORDER BY total_revenue DESC
LIMIT 10;



-- 2. Revenue by Category
-- Calculates total revenue and product diversity per category.
SELECT 
    p.category,
    SUM(ti.quantity * ti.price) AS category_revenue,
    COUNT(DISTINCT ti.product_id) AS num_products
FROM transaction_items ti
JOIN products p ON p.product_id = ti.product_id
GROUP BY p.category
ORDER BY category_revenue DESC;



-- 3. Profitability by Category
-- Requires `cost` field in products table.
-- Computes total profit and margin per category.
SELECT 
    p.category,
    SUM(ti.quantity * (ti.price - p.cost)) AS profit,
    SUM(ti.quantity * ti.price) AS revenue,
    ROUND(SUM(ti.quantity * (ti.price - p.cost)) / 
          SUM(ti.quantity * ti.price) * 100, 2) AS profit_margin
FROM transaction_items ti
JOIN products p ON p.product_id = ti.product_id
GROUP BY p.category
ORDER BY profit DESC;



-- 4️. Category Contribution (%)
-- Measures each category’s share of total revenue.
WITH category_totals AS (
    SELECT 
        p.category,
        SUM(ti.quantity * ti.price) AS category_revenue
    FROM transaction_items ti
    JOIN products p ON p.product_id = ti.product_id
    GROUP BY p.category
)
SELECT 
    category,
    category_revenue,
    ROUND(category_revenue * 100.0 / SUM(category_revenue) OVER (), 2) AS percent_contribution
FROM category_totals
ORDER BY category_revenue DESC;



-- 5️. Price Statistics by Category
-- Provides average and median price to identify pricing trends.
SELECT 
    category,
    ROUND(AVG(base_price), 2) AS avg_price,
    ROUND(MIN(base_price), 2) AS min_price,
    ROUND(MAX(base_price), 2) AS max_price
FROM products
GROUP BY category
ORDER BY avg_price DESC;