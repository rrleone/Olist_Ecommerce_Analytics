-- ============================================================
-- OLIST E-COMMERCE ANALYTICS
-- 01. CRIACAO DA ESTRUTURA DO BANCO
--
-- ATENCAO: SCRIPT DE RECRIACAO DE ESTRUTURA.
-- Os comandos DROP TABLE ... CASCADE podem remover tabelas
-- existentes e objetos dependentes.
--
-- Execute somente em ambiente de desenvolvimento descartavel
-- ou apos confirmar que existe backup e autorizacao para
-- recriar a estrutura.
--
-- Este script nao deve ser executado no banco de producao.
-- ============================================================

-- Limpa tudo antes, caso precise recriar do zero

DROP TABLE IF EXISTS order_reviews CASCADE;
DROP TABLE IF EXISTS order_payments CASCADE;
DROP TABLE IF EXISTS order_items CASCADE;
DROP TABLE IF EXISTS orders CASCADE;
DROP TABLE IF EXISTS products CASCADE;
DROP TABLE IF EXISTS sellers CASCADE;
DROP TABLE IF EXISTS customers CASCADE;
DROP TABLE IF EXISTS geolocation CASCADE;
DROP TABLE IF EXISTS product_category_translation CASCADE;


-- ============================================================
-- 1. customers
-- ============================================================

CREATE TABLE customers (
    customer_id              VARCHAR(32) PRIMARY KEY,
    customer_unique_id       VARCHAR(32) NOT NULL,
    customer_zip_code_prefix VARCHAR(10),
    customer_city            VARCHAR(100),
    customer_state           VARCHAR(2)
);
-- ------------------------------------------------------------
-- 2. geolocation (sem PK única - CEP se repete)
-- ------------------------------------------------------------
CREATE TABLE geolocation (
    geolocation_zip_code_prefix VARCHAR(10),
    geolocation_lat             NUMERIC(11,8),
    geolocation_lng             NUMERIC(11,8),
    geolocation_city            VARCHAR(100),
    geolocation_state           VARCHAR(2)
);

-- ------------------------------------------------------------
-- 3. sellers
-- ------------------------------------------------------------
CREATE TABLE sellers (
    seller_id             VARCHAR(32) PRIMARY KEY,
    seller_zip_code_prefix VARCHAR(10),
    seller_city            VARCHAR(100),
    seller_state            VARCHAR(2)
);

-- ------------------------------------------------------------
-- 4. product_category_translation
-- ------------------------------------------------------------
CREATE TABLE product_category_translation (
    product_category_name          VARCHAR(100) PRIMARY KEY,
    product_category_name_english  VARCHAR(100)
);

-- ------------------------------------------------------------
-- 5. products
-- ------------------------------------------------------------
CREATE TABLE products (
    product_id                  VARCHAR(32) PRIMARY KEY,
    product_category_name       VARCHAR(100),
    product_name_lenght         INTEGER,
    product_description_lenght  INTEGER,
    product_photos_qty          INTEGER,
    product_weight_g            INTEGER,
    product_length_cm           INTEGER,
    product_height_cm           INTEGER,
    product_width_cm            INTEGER,
    CONSTRAINT fk_products_category
        FOREIGN KEY (product_category_name)
        REFERENCES product_category_translation (product_category_name)
);

-- ------------------------------------------------------------
-- 6. orders (tabela fato central)
-- ------------------------------------------------------------
CREATE TABLE orders (
    order_id                       VARCHAR(32) PRIMARY KEY,
    customer_id                    VARCHAR(32) NOT NULL,
    order_status                   VARCHAR(20),
    order_purchase_timestamp       TIMESTAMP,
    order_approved_at              TIMESTAMP,
    order_delivered_carrier_date   TIMESTAMP,
    order_delivered_customer_date  TIMESTAMP,
    order_estimated_delivery_date  TIMESTAMP,
    CONSTRAINT fk_orders_customer
        FOREIGN KEY (customer_id)
        REFERENCES customers (customer_id)
);

-- ------------------------------------------------------------
-- 7. order_items
-- ------------------------------------------------------------
CREATE TABLE order_items (
    order_id            VARCHAR(32) NOT NULL,
    order_item_id        INTEGER NOT NULL,
    product_id            VARCHAR(32) NOT NULL,
    seller_id            VARCHAR(32) NOT NULL,
    shipping_limit_date  TIMESTAMP,
    price                NUMERIC(10,2),
    freight_value        NUMERIC(10,2),
    PRIMARY KEY (order_id, order_item_id),
    CONSTRAINT fk_items_order   FOREIGN KEY (order_id)   REFERENCES orders (order_id),
    CONSTRAINT fk_items_product FOREIGN KEY (product_id) REFERENCES products (product_id),
    CONSTRAINT fk_items_seller  FOREIGN KEY (seller_id)  REFERENCES sellers (seller_id)
);

-- ------------------------------------------------------------
-- 8. order_payments
-- ------------------------------------------------------------
CREATE TABLE order_payments (
    order_id             VARCHAR(32) NOT NULL,
    payment_sequential   INTEGER NOT NULL,
    payment_type         VARCHAR(20),
    payment_installments INTEGER,
    payment_value        NUMERIC(10,2),
    PRIMARY KEY (order_id, payment_sequential),
    CONSTRAINT fk_payments_order FOREIGN KEY (order_id) REFERENCES orders (order_id)
);

-- ------------------------------------------------------------
-- 9. order_reviews
-- ------------------------------------------------------------
CREATE TABLE order_reviews (
    review_id                 VARCHAR(32),
    order_id                  VARCHAR(32) NOT NULL,
    review_score               INTEGER,
    review_comment_title       VARCHAR(200),
    review_comment_message     TEXT,
    review_creation_date       TIMESTAMP,
    review_answer_timestamp    TIMESTAMP,
    CONSTRAINT fk_reviews_order FOREIGN KEY (order_id) REFERENCES orders (order_id)
);

-- ------------------------------------------------------------
-- Índices úteis para as análises que faremos
-- ------------------------------------------------------------
CREATE INDEX idx_orders_purchase_ts   ON orders (order_purchase_timestamp);
CREATE INDEX idx_orders_status        ON orders (order_status);
CREATE INDEX idx_items_product        ON order_items (product_id);
CREATE INDEX idx_items_seller         ON order_items (seller_id);
CREATE INDEX idx_reviews_score        ON order_reviews (review_score);
CREATE INDEX idx_customers_state      ON customers (customer_state);
