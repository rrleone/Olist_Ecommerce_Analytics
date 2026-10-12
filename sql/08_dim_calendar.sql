-- ============================================================
-- 08. DIMENSÃO CALENDÁRIO
-- ============================================================

CREATE OR REPLACE VIEW vw_dim_calendar AS

WITH periodo AS (

    SELECT
        MIN(order_purchase_timestamp::date) AS data_inicio,
        MAX(order_purchase_timestamp::date) AS data_fim

    FROM orders
)

SELECT
    d::date AS data,

    EXTRACT(YEAR FROM d)::int AS ano,

    EXTRACT(QUARTER FROM d)::int AS trimestre,

    EXTRACT(MONTH FROM d)::int AS mes_numero,

    CASE EXTRACT(MONTH FROM d)::int
        WHEN 1 THEN 'Janeiro'
        WHEN 2 THEN 'Fevereiro'
        WHEN 3 THEN 'Março'
        WHEN 4 THEN 'Abril'
        WHEN 5 THEN 'Maio'
        WHEN 6 THEN 'Junho'
        WHEN 7 THEN 'Julho'
        WHEN 8 THEN 'Agosto'
        WHEN 9 THEN 'Setembro'
        WHEN 10 THEN 'Outubro'
        WHEN 11 THEN 'Novembro'
        WHEN 12 THEN 'Dezembro'
    END AS mes,

    TO_CHAR(d, 'YYYY-MM') AS ano_mes,

    CASE EXTRACT(DOW FROM d)::int
        WHEN 0 THEN 'Domingo'
        WHEN 1 THEN 'Segunda-feira'
        WHEN 2 THEN 'Terça-feira'
        WHEN 3 THEN 'Quarta-feira'
        WHEN 4 THEN 'Quinta-feira'
        WHEN 5 THEN 'Sexta-feira'
        WHEN 6 THEN 'Sábado'
    END AS dia_semana,

    EXTRACT(DOW FROM d)::int AS dia_semana_numero,

    EXTRACT(DAY FROM d)::int AS dia,

    EXTRACT(WEEK FROM d)::int AS semana_ano

FROM periodo,

LATERAL generate_series(
    periodo.data_inicio,
    periodo.data_fim,
    INTERVAL '1 day'
) AS calendario(d);