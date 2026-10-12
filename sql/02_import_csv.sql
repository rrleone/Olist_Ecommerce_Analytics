-- ============================================================
-- OLIST E-COMMERCE ANALYTICS
-- 02. IMPORTACAO DOS CSVs
--
-- PRE-REQUISITOS:
-- 1. Criar as tabelas com 01_create_tables.sql.
-- 2. Executar este script no cliente psql.
-- 3. Estar no diretorio raiz do projeto para resolver data/raw/.
--
-- ATENCAO:
-- Carga inicial. Nao executar novamente sobre tabelas
-- ja carregadas sem preparar a limpeza/reinicializacao.
-- O comando \copy e especifico do cliente psql.
-- ============================================================

-- ============================================================
-- 02. IMPORTAÇÃO DOS CSVs
-- Projeto: Olist E-Commerce Analytics
-- ============================================================

\copy customers FROM 'data/raw/olist_customers_dataset.csv' WITH (FORMAT csv, HEADER true);

\copy geolocation FROM 'data/raw/olist_geolocation_dataset.csv' WITH (FORMAT csv, HEADER true);

\copy sellers FROM 'data/raw/olist_sellers_dataset.csv' WITH (FORMAT csv, HEADER true);

\copy product_category_translation FROM 'data/raw/product_category_name_translation.csv' WITH (FORMAT csv, HEADER true);

\copy products FROM 'data/raw/olist_products_dataset.csv' WITH (FORMAT csv, HEADER true);

\copy orders FROM 'data/raw/olist_orders_dataset.csv' WITH (FORMAT csv, HEADER true);

\copy order_items FROM 'data/raw/olist_order_items_dataset.csv' WITH (FORMAT csv, HEADER true);

\copy order_payments FROM 'data/raw/olist_order_payments_dataset.csv' WITH (FORMAT csv, HEADER true);

\copy order_reviews FROM 'data/raw/olist_order_reviews_dataset.csv' WITH (FORMAT csv, HEADER true);

-- ============================================================
-- CONFERÊNCIA DA CARGA
-- ============================================================

SELECT 'customers' AS tabela, COUNT(*) AS registros
FROM customers

UNION ALL

SELECT 'geolocation', COUNT(*)
FROM geolocation

UNION ALL

SELECT 'sellers', COUNT(*)
FROM sellers

UNION ALL

SELECT 'product_category_translation', COUNT(*)
FROM product_category_translation

UNION ALL

SELECT 'products', COUNT(*)
FROM products

UNION ALL

SELECT 'orders', COUNT(*)
FROM orders

UNION ALL

SELECT 'order_items', COUNT(*)
FROM order_items

UNION ALL

SELECT 'order_payments', COUNT(*)
FROM order_payments

UNION ALL

SELECT 'order_reviews', COUNT(*)
FROM order_reviews

ORDER BY registros DESC;



