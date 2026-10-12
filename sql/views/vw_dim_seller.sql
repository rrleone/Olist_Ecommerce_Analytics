-- View definition exported from PostgreSQL pg_views.
-- Database: olist_ecommerce_analytics
-- Schema: public

CREATE OR REPLACE VIEW public.vw_dim_seller AS
SELECT seller_id,
    seller_zip_code_prefix,
    seller_city,
    seller_state
   FROM sellers;
