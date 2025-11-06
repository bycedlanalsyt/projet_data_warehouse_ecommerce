-- 5. VERIFIER QUE LES TOUTES TABLES SONT BIEN RELIEES
SELECT 
    o.order_id,
    c.first_name + ' ' + c.last_name AS client,
    p.payment_method,
    p.payment_status,
    pr.product_name,
    o.quantity,
    p.amount,
    o.order_date,
    r.region_name
FROM fact_orders AS o
JOIN dim_customers AS c ON o.customer_id = c.customer_id
JOIN dim_products AS pr ON o.product_id = pr.product_id
JOIN dim_regions AS r ON c.region_id = r.region_id
LEFT JOIN dim_payments AS p ON o.order_id = p.order_id;
