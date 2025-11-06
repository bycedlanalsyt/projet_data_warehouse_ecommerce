-- 3. CREATION DE LA TABLE DE FAITS

-- Créer la table de faits fact_orders
CREATE TABLE fact_orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    payment_id INT,
    quantity INT,
    amount DECIMAL(10,2),
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES dim_customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES dim_products(product_id),
    FOREIGN KEY (payment_id) REFERENCES dim_payments(payment_id)
);

-- Vérification
SELECT * FROM fact_orders;