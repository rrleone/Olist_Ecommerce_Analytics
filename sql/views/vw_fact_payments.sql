-- View definition exported from PostgreSQL pg_views.
-- Database: olist_ecommerce_analytics
-- Schema: public

CREATE OR REPLACE VIEW public.vw_fact_payments AS
SELECT order_id,
    payment_sequential,
    payment_type,
    payment_installments,
    payment_value
   FROM order_payments;
