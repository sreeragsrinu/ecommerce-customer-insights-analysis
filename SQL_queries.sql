-- Total Revenue
SELECT SUM(payment_value) AS total_revenue
FROM order_payments;

-- Total Orders
SELECT COUNT(DISTINCT order_id) AS total_orders
FROM orders;

-- Average Order Value
SELECT 
SUM(payment_value) / COUNT(DISTINCT order_id) AS avg_order_value
FROM order_payments;

-- Monthly Orders Trend
SELECT 
DATE_FORMAT(order_purchase_timestamp,'%Y-%m') AS month,
COUNT(order_id) AS total_orders
FROM orders
GROUP BY month
ORDER BY month;

-- Top 10 Products by Revenue
SELECT
product_id,
SUM(price) AS revenue
FROM order_items
GROUP BY product_id
ORDER BY revenue DESC
LIMIT 10;

-- Top 10 Sellers
SELECT
seller_id,
SUM(price) AS revenue
FROM order_items
GROUP BY seller_id
ORDER BY revenue DESC
LIMIT 10;

-- Order Status Distribution
SELECT
order_status,
COUNT(*) AS total_orders
FROM orders
GROUP BY order_status;