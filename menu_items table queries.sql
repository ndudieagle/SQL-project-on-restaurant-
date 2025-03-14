use restaurant_db
-- 1 View the menu_items table.
 SELECT * FROM menu_items;

-- 2. Find the number of items on the menu.
SELECT COUNT(*) AS total_items FROM menu_items;

-- 3. What are the least and most expensive items on the menu?
SELECT *  FROM menu_items 
ORDER BY price asc
LIMIT 1;

SELECT * FROM menu_items 
ORDER BY price DESC 
LIMIT 1;  -- Most expensive

-- 4. How many Italian dishes are on the menu?
SELECT COUNT(*) 
FROM menu_items 
WHERE category = 'Italian';


-- 5 What are the least and most expensive Italian dishes on the menu?
SELECT *
FROM menu_items
WHERE category = 'Italian'
ORDER BY category, price DESC;
-- 6 How many dishes are in each category?
SELECT category, COUNT(*) AS dish_count
FROM menu_items
GROUP BY category
ORDER BY dish_count DESC;

-- 7 What is the average dish price within each category?|
SELECT category, AVG(price) AS average_price
FROM menu_items
GROUP BY category
ORDER BY average_price DESC;