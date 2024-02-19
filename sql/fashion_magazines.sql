SELECT 
    customers.name AS customer_name,
    SUM(orders.subscription_length * subscriptions.price) AS total_amount_due
FROM 
    orders
JOIN 
    customers ON orders.customer_id = customers.id
JOIN 
    subscriptions ON orders.subscription_id = subscriptions.id
WHERE 
    orders.order_status = 'unpaid'
    AND subscriptions.description = 'Fashion Magazine'
GROUP BY 
    customers.name;