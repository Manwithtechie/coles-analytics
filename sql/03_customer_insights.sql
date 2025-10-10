/*
=========================================
SQL Module: Customer Behavior Analysis
Project: Coles Retail Analytics
Week: 2 | Day: 3
Author: Manvith
Description:
  This module analyzes customer purchasing
  behavior using transactions and items data.
  Key KPIs include:
    - Customer counts
    - Basket size
    - Frequency & spend
    - RFM (Recency, Frequency, Monetary)
=========================================
*/


-- 1️. Total number of unique customers
SELECT 
    COUNT(DISTINCT customer_id) AS total_customers
FROM transactions;



-- 2️. Average Basket Size
-- Measures the average number of items per transaction.
SELECT 
    ROUND(AVG(item_count), 2) AS avg_items_per_transaction
FROM (
    SELECT 
        transaction_id, 
        COUNT(*) AS item_count
    FROM transaction_items
    GROUP BY transaction_id
);



-- 3️. Customer Spend & Frequency
-- Shows total spend and number of transactions per customer.
SELECT 
    t.customer_id,
    COUNT(DISTINCT t.transaction_id) AS num_transactions,
    SUM(t.total_amount) AS total_spent
FROM transactions t
GROUP BY t.customer_id
ORDER BY total_spent DESC;



-- 4️. Recency, Frequency, Monetary (RFM) Snapshot
-- Calculates the last purchase date, total transactions,
-- and monetary value per customer.
SELECT
    customer_id,
    MAX(ts) AS last_purchase,
    COUNT(DISTINCT transaction_id) AS frequency,
    SUM(total_amount) AS monetary
FROM transactions
GROUP BY customer_id;



-- 5️. Top 10 Customers by Lifetime Value
-- Quick leaderboard of the highest-spending customers.
SELECT 
    customer_id,
    SUM(total_amount) AS lifetime_value
FROM transactions
GROUP BY customer_id
ORDER BY lifetime_value DESC
LIMIT 10;