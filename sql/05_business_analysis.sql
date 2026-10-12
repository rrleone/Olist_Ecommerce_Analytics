-- ============================================================
-- 01. EVOLUÇÃO COMERCIAL MENSAL
-- ============================================================

WITH vendas_mensais AS (

    SELECT
        DATE_TRUNC('month', o.order_purchase_timestamp) AS mes,

        COUNT(DISTINCT o.order_id) AS pedidos,

        SUM(oi.price) AS receita_produtos

    FROM orders o

    INNER JOIN order_items oi
        ON o.order_id = oi.order_id

    WHERE o.order_status = 'delivered'

    GROUP BY
        DATE_TRUNC('month', o.order_purchase_timestamp)
),

vendas_com_anterior AS (

    SELECT
        mes,
        pedidos,
        ROUND(receita_produtos, 2) AS receita_produtos,

        LAG(receita_produtos) OVER (
            ORDER BY mes
        ) AS receita_mes_anterior

    FROM vendas_mensais
)

SELECT
    mes,
    pedidos,
    receita_produtos,

    ROUND(
        (
            receita_produtos - receita_mes_anterior
        ) * 100.0
        / NULLIF(receita_mes_anterior, 0),
        2
    ) AS crescimento_receita_pct

FROM vendas_com_anterior

ORDER BY mes;

-- ============================================================
-- 02. EVOLUÇÃO COMERCIAL + TICKET MÉDIO
-- ============================================================

WITH vendas_mensais AS (

    SELECT
        DATE_TRUNC('month', o.order_purchase_timestamp) AS mes,

        COUNT(DISTINCT o.order_id) AS pedidos,

        SUM(oi.price) AS receita_produtos

    FROM orders o

    INNER JOIN order_items oi
        ON o.order_id = oi.order_id

    WHERE o.order_status = 'delivered'

    GROUP BY
        DATE_TRUNC('month', o.order_purchase_timestamp)
),

vendas_com_anterior AS (

    SELECT
        mes,
        pedidos,
        receita_produtos,

        LAG(receita_produtos) OVER (
            ORDER BY mes
        ) AS receita_mes_anterior

    FROM vendas_mensais
)

SELECT
    mes,
    pedidos,

    ROUND(
        receita_produtos,
        2
    ) AS receita_produtos,

    ROUND(
        receita_produtos
        / NULLIF(pedidos, 0),
        2
    ) AS ticket_medio,

    ROUND(
        (
            receita_produtos - receita_mes_anterior
        ) * 100.0
        / NULLIF(receita_mes_anterior, 0),
        2
    ) AS crescimento_receita_pct

FROM vendas_com_anterior

ORDER BY mes;

-- ============================================================
-- 03. DESEMPENHO COMERCIAL POR CATEGORIA
-- ============================================================

SELECT
    COALESCE(
        t.product_category_name_english,
        p.product_category_name
    ) AS categoria,

    COUNT(DISTINCT oi.order_id) AS pedidos,

    COUNT(*) AS itens,

    ROUND(
        SUM(oi.price),
        2
    ) AS receita_produtos,

    ROUND(
        SUM(oi.price)
        / NULLIF(COUNT(DISTINCT oi.order_id), 0),
        2
    ) AS receita_media_por_pedido,

    ROUND(
        SUM(oi.price) * 100.0
        / SUM(SUM(oi.price)) OVER(),
        2
    ) AS participacao_receita_pct

FROM order_items oi

INNER JOIN orders o
    ON oi.order_id = o.order_id

INNER JOIN products p
    ON oi.product_id = p.product_id

LEFT JOIN product_category_translation t
    ON p.product_category_name = t.product_category_name

WHERE o.order_status = 'delivered'

GROUP BY
    COALESCE(
        t.product_category_name_english,
        p.product_category_name
    )

ORDER BY receita_produtos DESC;

-- ============================================================
-- 04. DESEMPENHO COMERCIAL POR ESTADO
-- ============================================================

SELECT
    c.customer_state AS estado,

    COUNT(DISTINCT o.order_id) AS pedidos,

    ROUND(
        SUM(oi.price),
        2
    ) AS receita_produtos,

    ROUND(
        SUM(oi.price)
        / NULLIF(COUNT(DISTINCT o.order_id), 0),
        2
    ) AS ticket_medio,

    ROUND(
        SUM(oi.price) * 100.0
        / SUM(SUM(oi.price)) OVER(),
        2
    ) AS participacao_receita_pct

FROM orders o

INNER JOIN customers c
    ON o.customer_id = c.customer_id

INNER JOIN order_items oi
    ON o.order_id = oi.order_id

WHERE o.order_status = 'delivered'

GROUP BY c.customer_state

ORDER BY receita_produtos DESC;

-- ============================================================
-- 05. RECEITA DE CLIENTES RECORRENTES
-- ============================================================

WITH clientes_pedidos AS (

    SELECT
        c.customer_unique_id,
        COUNT(DISTINCT o.order_id) AS quantidade_pedidos

    FROM customers c

    INNER JOIN orders o
        ON c.customer_id = o.customer_id

    GROUP BY c.customer_unique_id
),

pedidos_classificados AS (

    SELECT
        c.customer_unique_id,
        c.customer_id,
        o.order_id,

        CASE
            WHEN cp.quantidade_pedidos > 1
                THEN 'Recorrente'
            ELSE 'Compra única'
        END AS perfil_cliente

    FROM customers c

    INNER JOIN orders o
        ON c.customer_id = o.customer_id

    INNER JOIN clientes_pedidos cp
        ON c.customer_unique_id = cp.customer_unique_id

    WHERE o.order_status = 'delivered'
)

SELECT
    pc.perfil_cliente,

    COUNT(DISTINCT pc.order_id) AS pedidos,

    ROUND(
        SUM(oi.price),
        2
    ) AS receita_produtos,

    ROUND(
        SUM(oi.price) * 100.0
        / SUM(SUM(oi.price)) OVER(),
        2
    ) AS participacao_receita_pct

FROM pedidos_classificados pc

INNER JOIN order_items oi
    ON pc.order_id = oi.order_id

GROUP BY pc.perfil_cliente

ORDER BY receita_produtos DESC;

-- ============================================================
-- 06. LOGÍSTICA POR ESTADO
-- ============================================================

SELECT
    c.customer_state AS estado,

    COUNT(*) AS pedidos_entregues,

    ROUND(
        AVG(
            EXTRACT(
                EPOCH FROM (
                    o.order_delivered_customer_date
                    - o.order_purchase_timestamp
                )
            ) / 86400
        ),
        2
    ) AS dias_medios_entrega,

    COUNT(*) FILTER (
        WHERE o.order_delivered_customer_date
              > o.order_estimated_delivery_date
    ) AS pedidos_atrasados,

    ROUND(
        COUNT(*) FILTER (
            WHERE o.order_delivered_customer_date
                  > o.order_estimated_delivery_date
        ) * 100.0 / COUNT(*),
        2
    ) AS taxa_atraso

FROM orders o

INNER JOIN customers c
    ON o.customer_id = c.customer_id

WHERE o.order_status = 'delivered'
  AND o.order_delivered_customer_date IS NOT NULL
  AND o.order_estimated_delivery_date IS NOT NULL

GROUP BY c.customer_state

ORDER BY taxa_atraso DESC;


-- ============================================================
-- 07. ATRASO x SATISFAÇÃO POR ESTADO
-- ============================================================

WITH reviews_por_pedido AS (

    SELECT
        order_id,
        AVG(review_score) AS nota_media_pedido
    FROM order_reviews
    GROUP BY order_id
),

base AS (

    SELECT
        o.order_id,
        c.customer_state AS estado,

        CASE
            WHEN o.order_delivered_customer_date
                 > o.order_estimated_delivery_date
            THEN 'Atrasado'
            ELSE 'No prazo'
        END AS status_entrega,

        r.nota_media_pedido

    FROM orders o

    INNER JOIN customers c
        ON o.customer_id = c.customer_id

    LEFT JOIN reviews_por_pedido r
        ON o.order_id = r.order_id

    WHERE o.order_status = 'delivered'
      AND o.order_delivered_customer_date IS NOT NULL
      AND o.order_estimated_delivery_date IS NOT NULL
      AND r.nota_media_pedido IS NOT NULL
)

SELECT
    estado,
    status_entrega,

    COUNT(*) AS pedidos,

    ROUND(
        AVG(nota_media_pedido),
        2
    ) AS nota_media

FROM base

GROUP BY
    estado,
    status_entrega

ORDER BY
    estado,
    status_entrega;

    