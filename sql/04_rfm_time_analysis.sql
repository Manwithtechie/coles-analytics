/*
=========================================
SQL Module: RFM Segmentation & Time Analysis
Project: Coles Retail Analytics
Week: 2 | Day: 4
Author: Manvith
Description:
  This module performs RFM (Recency, Frequency,
  Monetary) analysis on customers and evaluates
  time-based sales patterns by day of week and hour.
=========================================
*/

-- 1️⃣ RFM Base Data
-- Extracts the latest purchase, total transactions,
-- and monetary value per customer.
SELECT
    customer_id,
    MAX(ts) AS last_purchase,
    COUNT(DISTINCT transaction_id) AS frequency,
    SUM(total_amount) AS monetary
FROM transactions
GROUP BY customer_id;



-- 2️⃣ Recency (Days Since Last Purchase)
-- Computes days since last transaction relative to the most recent purchase date.
-- Note: This calculation is performed in Python for dynamic date reference,
-- but can be approximated here using SQL.
SELECT
    customer_id,
    JULIANDAY((SELECT MAX(ts) FROM transactions)) - JULIANDAY(MAX(ts)) AS recency_days
FROM transactions
GROUP BY customer_id;



-- 3️⃣ Frequency & Monetary Overview
-- Summarizes total transaction count and total spend per customer.
SELECT
    customer_id,
    COUNT(DISTINCT transaction_id) AS frequency,
    SUM(total_amount) AS monetary
FROM transactions
GROUP BY customer_id
ORDER BY monetary DESC;



-- 4️⃣ RFM Snapshot Combined View
-- Combines recency, frequency, and monetary in one query for export.
SELECT
    customer_id,
    MAX(ts) AS last_purchase,
    JULIANDAY((SELECT MAX(ts) FROM transactions)) - JULIANDAY(MAX(ts)) AS recency_days,
    COUNT(DISTINCT transaction_id) AS frequency,
    SUM(total_amount) AS monetary
FROM transactions
GROUP BY customer_id
ORDER BY monetary DESC;



-- 5️⃣ Sales by Day of Week
-- Aggregates total revenue by day (0=Sunday ... 6=Saturday).
SELECT 
    STRFTIME('%w', ts) AS day_of_week,
    SUM(total_amount) AS revenue
FROM transactions
GROUP BY day_of_week
ORDER BY day_of_week;



-- 6️⃣ Sales by Hour of Day
-- Analyzes hourly revenue distribution across all transactions.
SELECT 
    STRFTIME('%H', ts) AS hour,
    SUM(total_amount) AS revenue
FROM transactions
GROUP BY hour
ORDER BY hour;



-- 7️⃣ Weekly Revenue Summary
-- Optional: total revenue per calendar week for trend visualization.
SELECT 
    STRFTIME('%W', ts) AS week_number,
    SUM(total_amount) AS weekly_revenue
FROM transactions
GROUP BY week_number
ORDER BY week_number;