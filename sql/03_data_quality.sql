
-- ============================================================
-- OLIST E-COMMERCE ANALYTICS
-- 03. DATA QUALITY
-- Objetivo: verificar volumetria, completude, unicidade,
-- integridade referencial, consistencia temporal e valores.
-- Somente consultas de leitura.
-- ============================================================


-- 01. VOLUMETRIA DAS TABELAS
SELECT 'customers' AS tabela, COUNT(*) AS registros FROM public.customers
UNION ALL
SELECT 'geolocation', COUNT(*) FROM public.geolocation
UNION ALL
SELECT 'order_items', COUNT(*) FROM public.order_items
UNION ALL
SELECT 'order_payments', COUNT(*) FROM public.order_payments
UNION ALL
SELECT 'order_reviews', COUNT(*) FROM public.order_reviews
UNION ALL
SELECT 'orders', COUNT(*) FROM public.orders
UNION ALL
SELECT 'product_category_translation', COUNT(*) FROM public.product_category_translation
UNION ALL
SELECT 'products', COUNT(*) FROM public.products
UNION ALL
SELECT 'sellers', COUNT(*) FROM public.sellers
ORDER BY registros DESC;


-- 02. UNICIDADE DOS PEDIDOS
SELECT
    COUNT(*) AS total_registros,
    COUNT(DISTINCT order_id) AS order_ids_distintos,
    COUNT(*) - COUNT(DISTINCT order_id) AS registros_excedentes
FROM public.orders;


-- 03. COMPLETUDE DE CAMPOS ESSENCIAIS
SELECT
    COUNT(*) AS total_pedidos,
    COUNT(customer_id) AS customer_id_preenchidos,
    COUNT(*) - COUNT(customer_id) AS customer_id_nulos,
    COUNT(order_status) AS status_preenchidos,
    COUNT(*) - COUNT(order_status) AS status_nulos,
    COUNT(order_purchase_timestamp) AS datas_compra_preenchidas,
    COUNT(*) - COUNT(order_purchase_timestamp) AS datas_compra_nulas
FROM public.orders;


-- 04. DISTRIBUICAO DOS STATUS DOS PEDIDOS
SELECT
    order_status AS status,
    COUNT(*) AS quantidade,
    ROUND(
        COUNT(*) * 100.0 / NULLIF(SUM(COUNT(*)) OVER (), 0),
        2
    ) AS percentual
FROM public.orders
GROUP BY order_status
ORDER BY quantidade DESC;


-- 05. PEDIDOS SEM CLIENTE CORRESPONDENTE
SELECT COUNT(*) AS pedidos_sem_clientes
FROM public.orders AS o
LEFT JOIN public.customers AS c
    ON o.customer_id = c.customer_id
WHERE c.customer_id IS NULL;


-- 06. PEDIDOS COM E SEM ITENS
SELECT
    COUNT(DISTINCT o.order_id) AS total_pedidos,
    COUNT(DISTINCT o.order_id) FILTER (
        WHERE i.order_id IS NULL
    ) AS pedidos_sem_itens,
    COUNT(DISTINCT o.order_id) FILTER (
        WHERE i.order_id IS NOT NULL
    ) AS pedidos_com_itens
FROM public.orders AS o
LEFT JOIN public.order_items AS i
    ON o.order_id = i.order_id;


-- 07. ITENS SEM PRODUTO CORRESPONDENTE
SELECT COUNT(*) AS itens_sem_produto
FROM public.order_items AS oi
LEFT JOIN public.products AS p
    ON oi.product_id = p.product_id
WHERE p.product_id IS NULL;


-- 08. ITENS SEM VENDEDOR CORRESPONDENTE
SELECT COUNT(*) AS itens_sem_vendedor
FROM public.order_items AS oi
LEFT JOIN public.sellers AS s
    ON oi.seller_id = s.seller_id
WHERE s.seller_id IS NULL;


-- 09. PAGAMENTOS SEM PEDIDO CORRESPONDENTE
SELECT COUNT(*) AS pagamentos_sem_pedido
FROM public.order_payments AS op
LEFT JOIN public.orders AS o
    ON op.order_id = o.order_id
WHERE o.order_id IS NULL;


-- 10. AVALIACOES SEM PEDIDO CORRESPONDENTE
SELECT COUNT(*) AS reviews_sem_pedido
FROM public.order_reviews AS r
LEFT JOIN public.orders AS o
    ON r.order_id = o.order_id
WHERE o.order_id IS NULL;


-- 11. DATAS CRONOLOGICAMENTE INCONSISTENTES
SELECT COUNT(*) AS inconsistencias_datas
FROM public.orders
WHERE order_approved_at < order_purchase_timestamp
   OR order_delivered_carrier_date < order_purchase_timestamp
   OR order_delivered_customer_date < order_purchase_timestamp
   OR order_delivered_customer_date < order_delivered_carrier_date;


-- 12. PRECOS NEGATIVOS
SELECT COUNT(*) AS precos_negativos
FROM public.order_items
WHERE price < 0;


-- 13. FRETES NEGATIVOS
SELECT COUNT(*) AS fretes_negativos
FROM public.order_items
WHERE freight_value < 0;


-- 14. DUPLICIDADE DE REVIEW_ID
SELECT
    COUNT(*) AS ids_duplicados,
    COALESCE(SUM(quantidade - 1), 0) AS registros_excedentes
FROM (
    SELECT review_id, COUNT(*) AS quantidade
    FROM public.order_reviews
    WHERE review_id IS NOT NULL
    GROUP BY review_id
    HAVING COUNT(*) > 1
) AS duplicados;


-- 15. CATEGORIAS SEM TRADUCAO
SELECT DISTINCT
    p.product_category_name
FROM public.products AS p
LEFT JOIN public.product_category_translation AS t
    ON p.product_category_name = t.product_category_name
WHERE p.product_category_name IS NOT NULL
  AND t.product_category_name IS NULL
ORDER BY p.product_category_name;
