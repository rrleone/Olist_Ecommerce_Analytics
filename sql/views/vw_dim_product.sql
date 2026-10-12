-- View definition exported from PostgreSQL pg_views.
-- Database: olist_ecommerce_analytics
-- Schema: public

CREATE OR REPLACE VIEW public.vw_dim_product AS
SELECT p.product_id,
    p.product_category_name,
    COALESCE(t.product_category_name_english, p.product_category_name) AS categoria_ingles
   FROM (products p
     LEFT JOIN product_category_translation t ON (((p.product_category_name)::text = (t.product_category_name)::text)));
