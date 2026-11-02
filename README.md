# 🛒 Olist E-Commerce Analytics

<div align="center">

### E-Commerce · Sales · Customer Behavior · Logistics

<p>
  <img src="https://img.shields.io/badge/PostgreSQL-4169E1?style=for-the-badge&logo=postgresql&logoColor=white"/>
  <img src="https://img.shields.io/badge/SQL-4479A1?style=for-the-badge&logo=postgresql&logoColor=white"/>
  <img src="https://img.shields.io/badge/Power%20BI-F2C811?style=for-the-badge&logo=powerbi&logoColor=black"/>
  <img src="https://img.shields.io/badge/DAX-2C3E50?style=for-the-badge&logoColor=white"/>
</p>

**Transformando dados do e-commerce brasileiro em insights comerciais e operacionais.**

</div>

---

## 🎯 Problema de negócio

A análise busca compreender o desempenho do e-commerce da Olist, conectando informações de vendas, pedidos, pagamentos, produtos, clientes, vendedores, logística e avaliações.

O objetivo é transformar dados transacionais em informações que apoiem decisões comerciais e operacionais, permitindo acompanhar indicadores de faturamento, volume de pedidos, ticket médio, comportamento temporal das vendas, desempenho logístico e experiência do cliente.

---

## 📦 Sobre os dados

- **Fonte:** Brazilian E-Commerce Public Dataset by Olist — Kaggle
- **Segmento:** E-commerce
- **Tipo de análise:** Business Intelligence e Analytics
- **Unidade de análise:** pedidos, itens de pedido e entidades relacionadas
- **Banco de dados:** PostgreSQL
- **Visualização:** Power BI

### Principais entidades analisadas

- Pedidos e status dos pedidos
- Itens de pedido
- Produtos e categorias
- Clientes e localização
- Vendedores
- Pagamentos
- Entregas e fretes
- Avaliações dos clientes
- Calendário e evolução temporal

---

## 🛠️ Tecnologias e ferramentas

| Tecnologia | Aplicação |
|---|---|
| **PostgreSQL** | Armazenamento e gerenciamento dos dados |
| **SQL** | Exploração, transformação, validação e análise |
| **Views SQL** | Organização das estruturas analíticas |
| **Power BI** | Modelagem e visualização dos indicadores |
| **DAX** | Desenvolvimento de medidas e KPIs |
| **CSV** | Formato dos dados de entrada |

---

## 🔄 Metodologia

O projeto foi desenvolvido seguindo um fluxo de trabalho de ponta a ponta:

**Dados → Qualidade → SQL → Análise → Modelagem → Dashboard → Insights**

### 1. Data Profiling

- Compreensão da estrutura dos arquivos.
- Identificação das entidades e granularidade.
- Análise dos tipos de dados.
- Exploração inicial das informações.

### 2. Data Quality

- Verificação da integridade dos dados.
- Identificação de inconsistências.
- Validação de relacionamentos.
- Conferência de duplicidades e valores ausentes.

### 3. Data Loading

- Organização dos arquivos CSV.
- Criação das tabelas no PostgreSQL.
- Importação dos dados.
- Verificação da carga.

### 4. SQL Exploration

- Consultas exploratórias.
- Análise de pedidos e itens.
- Investigação de pagamentos.
- Exploração de clientes, produtos e vendedores.

### 5. Business Analysis

- Análise de faturamento.
- Volume e evolução dos pedidos.
- Ticket médio.
- Desempenho de produtos e categorias.
- Análise logística.
- Avaliações e experiência do cliente.

### 6. Analytical Views

Criação de views SQL para organizar os dados e facilitar o consumo analítico no Power BI.

### 7. Power BI Data Modeling

- Organização do modelo analítico.
- Relacionamentos entre entidades.
- Calendário.
- Medidas DAX.
- Indicadores de negócio.

### 8. Dashboard Development

Construção de páginas executivas e analíticas para acompanhamento dos indicadores.

### 9. Business Insights

Interpretação dos resultados e identificação de oportunidades comerciais e operacionais.

---

## 📊 Indicadores e validações

Durante a validação da view `vw_fact_order_items`, foram registrados os seguintes resultados:

| Indicador | Resultado |
|---|---:|
| Linhas de itens | 112.650 |
| Pedidos distintos | 98.666 |
| Soma da coluna `price` | R$ 13.591.643,70 |
| Data máxima de compra | 03/09/2018 |

> Os números correspondem à versão dos dados analisada durante o desenvolvimento e devem ser interpretados considerando a granularidade e os filtros aplicados.

---

## 📈 Dashboard Power BI

O relatório está organizado em quatro páginas.

### 01 — Visão Geral

Visão executiva dos principais indicadores de desempenho do e-commerce.

![Olist — Visão Geral](images/01%20-%20Vis%C3%A3o%20Geral.png)

### 02 — Vendas

Análise do desempenho comercial, faturamento, pedidos e evolução temporal.

![Olist — Vendas](images/02%20-%20Vendas.png)

### 03 — Análises

Exploração de informações comerciais, logísticas e operacionais.

![Olist — Análises](images/03%20-%20An%C3%A1lises.png)

### 04 — Insights

Síntese dos principais aprendizados e oportunidades identificadas na análise.

![Olist — Insights](images/04%20-%20Insights.png)

---

## 💡 Insights e oportunidades de negócio

A integração dos dados permite explorar diferentes dimensões do e-commerce:

- Evolução do faturamento e volume de pedidos.
- Comportamento das vendas ao longo do tempo.
- Desempenho de produtos e categorias.
- Distribuição geográfica dos clientes.
- Relação entre frete, entrega e experiência do cliente.
- Avaliações e possíveis pontos de atenção na operação.

Os indicadores devem ser interpretados considerando a granularidade dos dados e os filtros utilizados. Padrões e associações identificados não representam necessariamente relações de causalidade.

---

## 📁 Estrutura do repositório

```text
Olist_Ecommerce_Analytics/
│
├── data/
│   ├── raw/
│   └── processed/
│
├── docs/
│   ├── dicionario_dados.md
│   └── metodologia.md
│
├── images/
│   ├── 01 - Visão Geral.png
│   ├── 02 - Vendas.png
│   ├── 03 - Análises.png
│   └── 04 - Insights.png
│
├── powerbi/
│   ├── Projeto_Olist.pbix
│   └── README.md
│
├── sql/
│   ├── 01_create_tables.sql
│   ├── 02_import_csv.sql
│   ├── 03_data_quality.sql
│   ├── 04_exploration.sql
│   ├
