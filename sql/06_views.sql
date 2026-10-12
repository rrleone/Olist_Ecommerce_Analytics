
-- ============================================================
-- OLIST E-COMMERCE ANALYTICS
-- 06. CRIACAO DAS VIEWS ANALITICAS
-- Schema: public
-- ============================================================

-- 01. DIMENSAO DE PEDIDOS
CREATE OR REPLACE VIEW public.vw_dim_order AS
SELECT
    order_id,
    customer_id,
    order_status,
    order_purchase_timestamp,
    order_approved_at,
    order_delivered_carrier_date,
    order_delivered_customer_date,
    order_estimated_delivery_date,
    order_purchase_timestamp::date AS order_purchase_date
FROM public.orders;


-- 02. FATO DE ITENS
CREATE OR REPLACE VIEW public.vw_fact_order_items AS
SELECT
    oi.order_id,
    oi.order_item_id,
    o.customer_id,
    oi.product_id,
    oi.seller_id,
    o.order_status,
    o.order_purchase_timestamp,
    oi.price,
    oi.freight_value,
    oi.price + oi.freight_value AS valor_com_frete
FROM public.order_items AS oi
INNER JOIN public.orders AS o
    ON oi.order_id = o.order_id;


-- 03. FATO DE PAGAMENTOS
CREATE OR REPLACE VIEW public.vw_fact_payments AS
SELECT
    order_id,
    payment_sequential,
    payment_type,
    payment_installments,
    payment_value
FROM public.order_payments;


-- 04. FATO DE AVALIACOES
-- Uma linha por pedido
CREATE OR REPLACE VIEW public.vw_fact_reviews AS
SELECT
    order_id,
    ROUND(AVG(review_score), 2) AS review_score,
    COUNT(*) AS quantidade_reviews
FROM public.order_reviews
GROUP BY order_id;


-- 05. DIMENSAO DE PRODUTOS
CREATE OR REPLACE VIEW public.vw_dim_product AS
SELECT
    p.product_id,
    p.product_category_name,
    COALESCE(
        t.product_category_name_english,
        p.product_category_name
    ) AS categoria_ingles
FROM public.products AS p
LEFT JOIN public.product_category_translation AS t
    ON p.product_category_name = t.product_category_name;


-- 06. DIMENSAO DE CLIENTES
CREATE OR REPLACE VIEW public.vw_dim_customer AS
SELECT
    customer_id,
    customer_unique_id,
    customer_zip_code_prefix,
    customer_city,
    customer_state
FROM public.customers;


-- 07. DIMENSAO DE VENDEDORES
CREATE OR REPLACE VIEW public.vw_dim_seller AS
SELECT
    seller_id,
    seller_zip_code_prefix,
    seller_city,
    seller_state
FROM public.sellers;


-- 08. DIMENSAO DE CATEGORIAS
CREATE OR REPLACE VIEW public.vw_dim_category AS
SELECT DISTINCT
    p.product_category_name,
    COALESCE(
        t.product_category_name_english,
        p.product_category_name
    ) AS categoria_ingles
FROM public.products AS p
LEFT JOIN public.product_category_translation AS t
    ON p.product_category_name = t.product_category_name
WHERE p.product_category_name IS NOT NULL;
