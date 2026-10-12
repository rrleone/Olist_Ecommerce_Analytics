-- View definition exported from PostgreSQL pg_views.
-- Database: olist_ecommerce_analytics
-- Schema: public

CREATE OR REPLACE VIEW public.vw_dim_customer AS
SELECT customer_id,
    customer_unique_id,
    customer_zip_code_prefix,
    customer_city,
    customer_state
   FROM customers;
