-- get Full Name of customers from Singapore who have purchased more than 5 products in 2023.
SELECT first_name, last_name
FROM customers
WHERE id in (
    SELECT customer_id
    FROM orders
    WHERE DATE(order_date) BETWEEN "2023-01-01" AND "2023-12-31" -- get order in 2023
    AND id in (
        SELECT order_id
        FROM order_items
        GROUP BY order_id HAVING COUNT(*) >= 5
    )
)
