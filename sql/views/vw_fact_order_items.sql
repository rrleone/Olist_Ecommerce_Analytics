-- View definition exported from PostgreSQL pg_views.
-- Database: olist_ecommerce_analytics
-- Schema: public

CREATE OR REPLACE VIEW public.vw_fact_order_items AS
SELECT oi.order_id,
    oi.order_item_id,
    o.customer_id,
    oi.product_id,
    oi.seller_id,
    o.order_status,
    o.order_purchase_timestamp,
    oi.price,
    oi.freight_value,
    (oi.price + oi.freight_value) AS valor_com_frete
   FROM (order_items oi
     JOIN orders o ON (((oi.order_id)::text = (o.order_id)::text)));
