-- ============================================================
-- 01. VALIDAÇÃO DE VOLUMETRIA
-- ============================================================

SELECT
    'orders' AS origem,
    (SELECT COUNT(*) FROM orders) AS origem_registros,
    (SELECT COUNT(*) FROM vw_dim_order) AS view_registros

UNION ALL

SELECT
    'order_items',
    (SELECT COUNT(*) FROM order_items),
    (SELECT COUNT(*) FROM vw_fact_order_items)

UNION ALL

SELECT
    'order_payments',
    (SELECT COUNT(*) FROM order_payments),
    (SELECT COUNT(*) FROM vw_fact_payments)

UNION ALL

SELECT
    'products',
    (SELECT COUNT(*) FROM products),
    (SELECT COUNT(*) FROM vw_dim_product)

UNION ALL

SELECT
    'customers',
    (SELECT COUNT(*) FROM customers),
    (SELECT COUNT(*) FROM vw_dim_customer)

UNION ALL

SELECT
    'sellers',
    (SELECT COUNT(*) FROM sellers),
    (SELECT COUNT(*) FROM vw_dim_seller);

-- ============================================================
-- 02. VALIDAÇÃO DA FATO DE ITENS
-- ============================================================

SELECT
    COUNT(*) AS registros,
    COUNT(DISTINCT (order_id, order_item_id)) AS chaves_distintas
FROM vw_fact_order_items;

-- ============================================================
-- 03. VALIDAÇÃO DE PAGAMENTOS
-- ============================================================

SELECT
    COUNT(*) AS registros,
    COUNT(DISTINCT (order_id, payment_sequential)) AS chaves_distintas
FROM vw_fact_payments;

-- ============================================================
-- 04. VALIDAÇÃO DE REVIEWS
-- ============================================================

SELECT
    COUNT(*) AS pedidos_com_review,
    COUNT(DISTINCT order_id) AS pedidos_distintos
FROM vw_fact_reviews;

-- ============================================================
-- 05. VALIDAÇÃO DE RECEITA
-- ============================================================

SELECT
    ROUND(
        (SELECT SUM(price) FROM order_items),
        2
    ) AS receita_origem,

    ROUND(
        (SELECT SUM(price) FROM vw_fact_order_items),
        2
    ) AS receita_view;

-- ============================================================
-- 06. VALIDAÇÃO DE FRETE
-- ============================================================

SELECT
    ROUND(
        (SELECT SUM(freight_value) FROM order_items),
        2
    ) AS frete_origem,

    ROUND(
        (SELECT SUM(freight_value) FROM vw_fact_order_items),
        2
    ) AS frete_view;

-- ============================================================
-- 07. VALIDAÇÃO FINAL DE PEDIDOS
-- ============================================================

SELECT
    COUNT(*) AS pedidos_origem,
    COUNT(*) FILTER (
        WHERE order_status = 'delivered'
    ) AS pedidos_entregues
FROM vw_dim_order;

