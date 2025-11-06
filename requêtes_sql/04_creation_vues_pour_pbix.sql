-- 3. CREATION DES VUES POUR ANALYSE POWER BI
--3.1.Vue globale des ventes vw_sales_overview
CREATE VIEW vw_sales_overview AS
SELECT 
    o.order_id,
    c.first_name + ' ' + c.last_name AS client,
    r.region_name,
    pr.product_name,
    pr.category,
    o.quantity,
    p.amount,
    p.payment_method,
    p.payment_status,
    o.order_date
FROM fact_orders AS o
JOIN dim_customers AS c ON o.customer_id = c.customer_id
JOIN dim_products AS pr ON o.product_id = pr.product_id
JOIN dim_regions AS r ON c.region_id = r.region_id
LEFT JOIN dim_payments AS p ON o.order_id = p.order_id;

--3.2. Vue du total des ventes par produit vw_sales_by_product
CREATE VIEW vw_sales_by_product AS
SELECT 
    pr.product_name,
    SUM(o.quantity) AS total_quantity,
    SUM(p.amount) AS total_amount
FROM fact_orders AS o
JOIN dim_products AS pr ON o.product_id = pr.product_id
LEFT JOIN dim_payments AS p ON o.order_id = p.order_id
WHERE p.payment_status = 'Réussi'
GROUP BY pr.product_name;

--3.3. Vue du total des commandes par région vw_orders_by_region
CREATE VIEW vw_orders_by_region AS
SELECT 
    r.region_name,
    COUNT(o.order_id) AS nb_commandes,
    SUM(p.amount) AS total_amount
FROM fact_orders AS o
JOIN dim_customers AS c ON o.customer_id = c.customer_id
JOIN dim_regions AS r ON c.region_id = r.region_id
LEFT JOIN dim_payments AS p ON o.order_id = p.order_id
WHERE p.payment_status = 'Réussi'
GROUP BY r.region_name;

--3.4. Vue du taux de réussite des paiements vw_payment_success_rate
CREATE VIEW vw_payment_success_rate AS
SELECT
    payment_status,
    COUNT(*) AS nb_paiements,
    ROUND(100.0 * COUNT(*) / (SELECT COUNT(*) FROM dim_payments), 2) AS pourcentage
FROM dim_payments
GROUP BY payment_status;

-- 3.5. Vérification de création des vues
SELECT name FROM sys.views;

