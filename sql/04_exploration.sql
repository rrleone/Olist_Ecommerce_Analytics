-- ============================================================
-- 01. EVOLUÇÃO MENSAL DOS PEDIDOS
-- ============================================================

SELECT
    DATE_TRUNC('month', order_purchase_timestamp) AS mes,
    COUNT(DISTINCT order_id) AS pedidos
FROM orders
GROUP BY DATE_TRUNC('month', order_purchase_timestamp)
ORDER BY mes;

-- ============================================================
-- 02. RECEITA MENSAL DE PRODUTOS
-- ============================================================

SELECT
    DATE_TRUNC('month', o.order_purchase_timestamp) AS mes,
    ROUND(SUM(oi.price), 2) AS receita_produtos
FROM orders o
INNER JOIN order_items oi
    ON o.order_id = oi.order_id
GROUP BY DATE_TRUNC('month', o.order_purchase_timestamp)
ORDER BY mes;


-- ============================================================
-- 03. VENDAS MENSAIS
-- Pedidos entregues + Receita de Produtos + Ticket Médio
-- ============================================================

SELECT
    DATE_TRUNC('month', o.order_purchase_timestamp) AS mes,

    COUNT(DISTINCT o.order_id) AS pedidos_entregues,

    ROUND(
        SUM(oi.price),
        2
    ) AS receita_produtos,

    ROUND(
        SUM(oi.price)
        / NULLIF(COUNT(DISTINCT o.order_id), 0),
        2
    ) AS ticket_medio

FROM orders o

INNER JOIN order_items oi
    ON o.order_id = oi.order_id

WHERE o.order_status = 'delivered'

GROUP BY
    DATE_TRUNC('month', o.order_purchase_timestamp)

ORDER BY mes;

-- ============================================================
-- 04. RECEITA POR CATEGORIA
-- ============================================================

SELECT
    COALESCE(
        t.product_category_name_english,
        p.product_category_name
    ) AS categoria,

    COUNT(DISTINCT oi.order_id) AS pedidos,

    COUNT(*) AS itens,

    ROUND(SUM(oi.price), 2) AS receita_produtos

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
-- 05. RECEITA POR ESTADO
-- ============================================================

SELECT
    c.customer_state AS estado,

    COUNT(DISTINCT o.order_id) AS pedidos,

    ROUND(SUM(oi.price), 2) AS receita_produtos

FROM orders o

INNER JOIN customers c
    ON o.customer_id = c.customer_id

INNER JOIN order_items oi
    ON o.order_id = oi.order_id

WHERE o.order_status = 'delivered'

GROUP BY c.customer_state

ORDER BY receita_produtos DESC;

--Clientes ÜNICOS
SELECT
    COUNT(DISTINCT customer_unique_id) AS clientes_unicos
FROM customers;

--Pedidos por cliente real
SELECT
    c.customer_unique_id,

    COUNT(DISTINCT o.order_id) AS pedidos

FROM customers c

INNER JOIN orders o
    ON c.customer_id = o.customer_id

GROUP BY c.customer_unique_id;

--Clientes recorrentes
SELECT
    COUNT(*) AS clientes_recorrentes
FROM (
    SELECT
        c.customer_unique_id
    FROM customers c
    INNER JOIN orders o
        ON c.customer_id = o.customer_id
    GROUP BY c.customer_unique_id
    HAVING COUNT(DISTINCT o.order_id) > 1
) x;

--Logística — tempo de entrega
SELECT
    ROUND(
        AVG(
            EXTRACT(
                EPOCH FROM (
                    order_delivered_customer_date
                    - order_purchase_timestamp
                )
            ) / 86400
        ),
        2
    ) AS dias_medios_entrega

FROM orders

WHERE order_status = 'delivered'
  AND order_delivered_customer_date IS NOT NULL;

 --Pedidos atrasados
SELECT
    COUNT(*) AS pedidos_entregues,

    COUNT(*) FILTER (
        WHERE order_delivered_customer_date
              > order_estimated_delivery_date
    ) AS pedidos_atrasados,

    ROUND(
        COUNT(*) FILTER (
            WHERE order_delivered_customer_date
                  > order_estimated_delivery_date
        ) * 100.0 / COUNT(*),
        2
    ) AS taxa_atraso

FROM orders

WHERE order_status = 'delivered'
  AND order_delivered_customer_date IS NOT NULL
  AND order_estimated_delivery_date IS NOT NULL;

--Avaliação média
SELECT
    ROUND(AVG(review_score), 2) AS nota_media
FROM order_reviews;

--Pagamentos
SELECT
    payment_type AS forma_pagamento,

    COUNT(*) AS quantidade,

    ROUND(
        COUNT(*) * 100.0 /
        SUM(COUNT(*)) OVER(),
        2
    ) AS percentual

FROM order_payments

GROUP BY payment_type

ORDER BY quantidade DESC;

-- ============================================================
-- 06. ANÁLISE DE RECORRÊNCIA DE CLIENTES
-- ============================================================

WITH pedidos_por_cliente AS (

    SELECT
        c.customer_unique_id,
        COUNT(DISTINCT o.order_id) AS quantidade_pedidos

    FROM customers c

    INNER JOIN orders o
        ON c.customer_id = o.customer_id

    GROUP BY c.customer_unique_id
)

SELECT
    COUNT(*) AS clientes_unicos,

    COUNT(*) FILTER (
        WHERE quantidade_pedidos > 1
    ) AS clientes_recorrentes,

    ROUND(
        COUNT(*) FILTER (
            WHERE quantidade_pedidos > 1
        ) * 100.0 / COUNT(*),
        2
    ) AS taxa_recorrencia

FROM pedidos_por_cliente;

-- ============================================================
-- 07. DISTRIBUIÇÃO DE PEDIDOS POR CLIENTE
-- ============================================================

WITH pedidos_por_cliente AS (

    SELECT
        c.customer_unique_id,
        COUNT(DISTINCT o.order_id) AS quantidade_pedidos

    FROM customers c

    INNER JOIN orders o
        ON c.customer_id = o.customer_id

    GROUP BY c.customer_unique_id
)

SELECT
    quantidade_pedidos,
    COUNT(*) AS quantidade_clientes

FROM pedidos_por_cliente

GROUP BY quantidade_pedidos

ORDER BY quantidade_pedidos;

-- ============================================================
-- 08. TEMPO MÉDIO DE ENTREGA
-- ============================================================

SELECT
    ROUND(
        AVG(
            EXTRACT(
                EPOCH FROM (
                    order_delivered_customer_date
                    - order_purchase_timestamp
                )
            ) / 86400
        ),
        2
    ) AS dias_medios_entrega

FROM orders

WHERE order_status = 'delivered'
  AND order_delivered_customer_date IS NOT NULL;

  -- ============================================================
-- 09. TAXA DE ATRASO
-- ============================================================

SELECT
    COUNT(*) AS pedidos_entregues,

    COUNT(*) FILTER (
        WHERE order_delivered_customer_date
              > order_estimated_delivery_date
    ) AS pedidos_atrasados,

    ROUND(
        COUNT(*) FILTER (
            WHERE order_delivered_customer_date
                  > order_estimated_delivery_date
        ) * 100.0 / COUNT(*),
        2
    ) AS taxa_atraso

FROM orders

WHERE order_status = 'delivered'
  AND order_delivered_customer_date IS NOT NULL
  AND order_estimated_delivery_date IS NOT NULL;

  -- ============================================================
-- 10. ATRASO x AVALIAÇÃO
-- ============================================================

WITH reviews_por_pedido AS (

    SELECT
        order_id,
        AVG(review_score) AS nota_media_pedido

    FROM order_reviews

    GROUP BY order_id
),

pedidos_logistica AS (

    SELECT
        o.order_id,

        CASE
            WHEN o.order_delivered_customer_date
                 > o.order_estimated_delivery_date
            THEN 'Atrasado'
            ELSE 'No prazo'
        END AS status_entrega,

        r.nota_media_pedido

    FROM orders o

    LEFT JOIN reviews_por_pedido r
        ON o.order_id = r.order_id

    WHERE o.order_status = 'delivered'
      AND o.order_delivered_customer_date IS NOT NULL
      AND o.order_estimated_delivery_date IS NOT NULL
)

SELECT
    status_entrega,

    COUNT(*) AS pedidos,

    ROUND(
        AVG(nota_media_pedido),
        2
    ) AS nota_media

FROM pedidos_logistica

WHERE nota_media_pedido IS NOT NULL

GROUP BY status_entrega

ORDER BY status_entrega;

-- ============================================================
-- 11. FORMAS DE PAGAMENTO
-- ============================================================

SELECT
    payment_type AS forma_pagamento,

    COUNT(*) AS quantidade,

    ROUND(
        COUNT(*) * 100.0 /
        SUM(COUNT(*)) OVER(),
        2
    ) AS percentual,

    ROUND(
        SUM(payment_value),
        2
    ) AS valor_total

FROM order_payments

GROUP BY payment_type

ORDER BY valor_total DESC;