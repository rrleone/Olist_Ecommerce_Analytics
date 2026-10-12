# 🗂️ Dicionário de dados — Olist E-Commerce Analytics

Este documento resume o propósito geral dos arquivos de origem. Para nomes, tipos e regras exatos, consulte os CSVs e os scripts SQL do projeto.

## 📦 Arquivos de origem

| Arquivo | Conteúdo geral |
|---|---|
| `olist_customers_dataset.csv` | Clientes e identificadores associados à localização. |
| `olist_geolocation_dataset.csv` | Códigos postais e coordenadas geográficas. |
| `olist_order_items_dataset.csv` | Itens dos pedidos, produtos, vendedores, preço e frete. |
| `olist_order_payments_dataset.csv` | Pagamentos associados aos pedidos. |
| `olist_order_reviews_dataset.csv` | Avaliações relacionadas aos pedidos. |
| `olist_orders_dataset.csv` | Pedidos, status e datas do ciclo do pedido. |
| `olist_products_dataset.csv` | Produtos e atributos de classificação. |
| `olist_sellers_dataset.csv` | Vendedores e informações de localização. |
| `product_category_name_translation.csv` | Traduções de nomes de categorias. |

---

## 🧱 Views do PostgreSQL

O arquivo `olist_views_export.csv` contém definições SQL exportadas das views do schema `public`. As definições individuais também ficam em `sql/views/`.

| View | Finalidade geral |
|---|---|
| `vw_dim_calendar` | Dimensão calendário para análises temporais. |
| `vw_dim_category` | Dimensão de categorias de produtos. |
| `vw_dim_customer` | Dimensão de clientes. |
| `vw_dim_order` | Dimensão de pedidos. |
| `vw_dim_order_powerbi` | Dados de pedidos preparados para consumo no Power BI. |
| `vw_dim_product` | Dimensão de produtos. |
| `vw_dim_seller` | Dimensão de vendedores. |
| `vw_fact_order_items` | Fato de itens dos pedidos. |
| `vw_fact_payments` | Fato de pagamentos. |
| `vw_fact_reviews` | Fato de avaliações. |

As descrições das views são resumos baseados nos nomes. Consulte o SQL correspondente para confirmar colunas, tipos, chaves, junções e regras de transformação.
