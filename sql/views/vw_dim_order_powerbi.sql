SELECT
    COUNT(*) AS total_itens,
    COUNT(DISTINCT order_id) AS total_pedidos,
    MIN(order_purchase_timestamp) AS primeira_compra,
    MAX(order_purchase_timestamp) AS ultima_compra,
    SUM(price) AS faturamento_total
FROM public.vw_fact_order_items;