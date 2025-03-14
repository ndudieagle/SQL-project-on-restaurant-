SELECT * FROM restaurant_db.order_details;
-- What is the date range of the table?
SELECT 
    MIN(order_date) AS earliest_date,
    MAX(order_date) AS latest_date
FROM order_details;
-- how many orders were made within this date range?
SELECT COUNT(DISTINCT order_id) AS total_orders
FROM order_details;

-- 4. How many items were ordered within this date range?
SELECT SUM(item_id) AS total_items_ordered
FROM order_details
WHERE order_date BETWEEN '2023-01-01' AND '2023-10-15';

-- 5. Which orders had the most number of items?
SELECT 
    order_id, 
    SUM(item_id) AS total_items
FROM order_details
GROUP BY order_id
ORDER BY total_items DESC;
-- 6. How many orders had more than 12 items?
SELECT COUNT(*) AS orders_with_more_than_12_items
FROM (
    SELECT order_id
    FROM order_details
    GROUP BY order_id
    HAVING COUNT(*) > 12
) AS subquery;



