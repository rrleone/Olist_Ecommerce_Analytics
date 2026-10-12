-- View definition exported from PostgreSQL pg_views.
-- Database: olist_ecommerce_analytics
-- Schema: public

CREATE OR REPLACE VIEW public.vw_dim_calendar AS
WITH periodo AS (
         SELECT min((orders.order_purchase_timestamp)::date) AS data_inicio,
            max((orders.order_purchase_timestamp)::date) AS data_fim
           FROM orders
        )
 SELECT (calendario.d)::date AS data,
    (EXTRACT(year FROM calendario.d))::integer AS ano,
    (EXTRACT(quarter FROM calendario.d))::integer AS trimestre,
    (EXTRACT(month FROM calendario.d))::integer AS mes_numero,
        CASE (EXTRACT(month FROM calendario.d))::integer
            WHEN 1 THEN 'Janeiro'::text
            WHEN 2 THEN 'Fevereiro'::text
            WHEN 3 THEN 'Março'::text
            WHEN 4 THEN 'Abril'::text
            WHEN 5 THEN 'Maio'::text
            WHEN 6 THEN 'Junho'::text
            WHEN 7 THEN 'Julho'::text
            WHEN 8 THEN 'Agosto'::text
            WHEN 9 THEN 'Setembro'::text
            WHEN 10 THEN 'Outubro'::text
            WHEN 11 THEN 'Novembro'::text
            WHEN 12 THEN 'Dezembro'::text
            ELSE NULL::text
        END AS mes,
    to_char(calendario.d, 'YYYY-MM'::text) AS ano_mes,
        CASE (EXTRACT(dow FROM calendario.d))::integer
            WHEN 0 THEN 'Domingo'::text
            WHEN 1 THEN 'Segunda-feira'::text
            WHEN 2 THEN 'Terça-feira'::text
            WHEN 3 THEN 'Quarta-feira'::text
            WHEN 4 THEN 'Quinta-feira'::text
            WHEN 5 THEN 'Sexta-feira'::text
            WHEN 6 THEN 'Sábado'::text
            ELSE NULL::text
        END AS dia_semana,
    (EXTRACT(dow FROM calendario.d))::integer AS dia_semana_numero,
    (EXTRACT(day FROM calendario.d))::integer AS dia,
    (EXTRACT(week FROM calendario.d))::integer AS semana_ano
   FROM periodo,
    LATERAL generate_series((periodo.data_inicio)::timestamp with time zone, (periodo.data_fim)::timestamp with time zone, '1 day'::interval) calendario(d);
