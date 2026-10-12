-- View definition exported from PostgreSQL pg_views.
-- Database: olist_ecommerce_analytics
-- Schema: public

CREATE OR REPLACE VIEW public.vw_fact_reviews AS
SELECT order_id,
    round(avg(review_score), 2) AS review_score,
    count(*) AS quantidade_reviews
   FROM order_reviews
  GROUP BY order_id;
