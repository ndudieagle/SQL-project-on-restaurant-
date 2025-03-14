-- Combine the menu_items and order_details tables into a single table.
SELECT * FROM menu_items;
SELECT * FROM order_details 

SELECT
 *
FROM order_details od LEFT JOIN menu_items mi 
ON od.item_id = mi.menu_item_id;


-- What were the least and most ordered items? What categories were they in?
SELECT item_name, category, COUNT(order_id) AS order_
FROM order_details od LEFT JOIN menu_items mi 
ON od.item_id = mi.menu_item_id
group by item_id,category;

-- What were the top 5 orders that spent the most money?
SELECT 
    od.order_id, 
    SUM(mi.price) AS total_spent
FROM 
    order_details od 
LEFT JOIN 
    menu_items mi 

ON 
    od.item_id = mi.menu_item_id
GROUP BY 
    od.order_id
ORDER BY 
    total_spent DESC
LIMIT 5;

    
  
-- View the details of the highest spend order. What insights can you gather from the |

SELECT 
    od.order_id, 
    mi.item_name, 
    mi.category, 
    mi.price
FROM 
    order_details od 
LEFT JOIN 
    menu_items mi 
ON 
    od.item_id = mi.menu_item_id
WHERE 
    od.order_id = (
        SELECT 
            od.order_id
        FROM 
            order_details od 
        LEFT JOIN 
            menu_items mi 
        ON 
            od.item_id = mi.menu_item_id
        GROUP BY 
            od.order_id
        ORDER BY 
            SUM(mi.price) DESC
        LIMIT 1
    );



-- View the details of the top 5 highest spend orders. What insights can you gather from it
WITH top_orders AS (
    SELECT 
        od.order_id, 
        SUM(mi.price) AS total_spent
    FROM 
        order_details od
    JOIN 
        menu_items mi 
    ON 
        od.item_id = mi.menu_item_id
    GROUP BY 
        od.order_id
    ORDER BY 
        total_spent DESC
    LIMIT 5
)
SELECT 
    od.order_id, 
    mi.item_name, 
    mi.category, 
    mi.price,
    top_orders.total_spent
FROM 
    order_details od
JOIN 
    menu_items mi 
ON 
    od.item_id = mi.menu_item_id
JOIN 
    top_orders 
ON 
    od.order_id = top_orders.order_id
ORDER BY 
    top_orders.total_spent DESC, 
    od.order_id;
    
    -- most expensive order in the data set 
    SELECT 
    od.order_id, 
    SUM(mi.price) AS total_spent
FROM 
    order_details od
JOIN 
    menu_items mi 
ON 
    od.item_id = mi.menu_item_id
GROUP BY 
    od.order_id
ORDER BY 
    total_spent DESC
LIMIT 1;