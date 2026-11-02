# 🛒 Olist E-Commerce Analytics

<div align="center">

### End-to-End Data Analytics & Business Intelligence

**E-Commerce · Sales Performance · Customer Behavior · Logistics · Business Insights**

<p>
  <img src="https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white"/>
  <img src="https://img.shields.io/badge/PostgreSQL-4169E1?style=for-the-badge&logo=postgresql&logoColor=white"/>
  <img src="https://img.shields.io/badge/SQL-4479A1?style=for-the-badge&logo=postgresql&logoColor=white"/>
  <img src="https://img.shields.io/badge/Power%20BI-F2C811?style=for-the-badge&logo=powerbi&logoColor=black"/>
  <img src="https://img.shields.io/badge/DAX-2C3E50?style=for-the-badge&logoColor=white"/>
</p>

**Transformando dados transacionais em inteligência comercial, operacional e estratégica.**

</div>

---

## 📌 Visão executiva

O **Olist E-Commerce Analytics** é um projeto de Análise de Dados e Business Intelligence desenvolvido a partir do Brazilian E-Commerce Public Dataset by Olist.

O projeto integra diferentes entidades do ecossistema de e-commerce para construir uma visão analítica de vendas, clientes, produtos, pagamentos, vendedores, logística e avaliações.

A iniciativa percorre um fluxo de trabalho de ponta a ponta — desde a exploração e preparação dos dados até a construção de estruturas analíticas em PostgreSQL, modelagem no Power BI e desenvolvimento de indicadores para apoiar decisões de negócio.

Mais do que apresentar gráficos, o projeto busca demonstrar como dados estruturados, regras de negócio e análise crítica podem transformar informações operacionais em conhecimento relevante para a gestão.

<div align="center">

**DATA ENGINEERING · DATA ANALYTICS · BUSINESS INTELLIGENCE**

Dados → Qualidade → SQL → Modelagem → Indicadores → Insights

</div>

---

## 🎯 Problema de negócio

Um e-commerce opera com informações distribuídas entre pedidos, clientes, produtos, pagamentos, vendedores, entregas e avaliações.

A análise isolada dessas informações limita a compreensão do desempenho global da operação.

O projeto busca responder questões como:

- Como evoluem o faturamento e o volume de pedidos?
- Quais produtos e categorias apresentam maior participação comercial?
- Como se comportam as vendas ao longo do tempo?
- Como os pedidos e pagamentos se distribuem?
- Quais aspectos da operação logística merecem atenção?
- Como os prazos de entrega se relacionam com a experiência do cliente?
- Quais informações podem apoiar decisões comerciais e operacionais?

O objetivo é organizar essas informações em uma estrutura analítica consistente e transformar os dados em indicadores, análises e insights.

---

## 🗂️ Sobre os dados

- **Fonte:** [Brazilian E-Commerce Public Dataset by Olist — Kaggle](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce)
- **Segmento:** E-commerce
- **Tipo de projeto:** Data Analytics & Business Intelligence
- **Origem:** Dados públicos
- **Armazenamento analítico:** PostgreSQL
- **Análise e visualização:** Power BI

### Entidades do dataset

| Entidade | Conteúdo |
|---|---|
| Orders | Pedidos e status |
| Order Items | Itens, preços e fretes |
| Customers | Clientes e localização |
| Products | Produtos e categorias |
| Sellers | Vendedores |
| Payments | Pagamentos e formas de pagamento |
| Reviews | Avaliações dos clientes |
| Geolocation | Informações geográficas |

---

## 🏗️ Arquitetura analítica

O projeto organiza o processamento e a análise em etapas integradas.

<div align="center">

**Dataset Olist**

↓  

**Preparação e Data Quality**

↓

**PostgreSQL — Tabelas e SQL**

↓

**Views Analíticas**

↓

**Power BI — Modelagem e DAX**

↓

**Dashboard Executivo e Analítico**

↓

**Insights para decisões de negócio**

</div>

A arquitetura separa a preparação dos dados, a camada de consultas e estruturas analíticas e a camada de visualização, facilitando a organização, validação e manutenção do projeto.

---

## 🛠️ Tecnologias e ferramentas

| Tecnologia | Aplicação no projeto |
|---|---|
| **Python** | Preparação e análise de dados |
| **PostgreSQL** | Banco de dados analítico |
| **SQL** | Criação de tabelas, exploração, validação e análise |
| **SQL Views** | Organização de estruturas analíticas reutilizáveis |
| **Power BI** | Modelagem, visualização e análise de indicadores |
| **DAX** | Medidas, KPIs e cálculos analíticos |

---

## 🔄 Metodologia de desenvolvimento

### 01 — Data Profiling

- Compreensão da estrutura dos arquivos.
- Identificação das entidades.
- Análise da granularidade.
- Exploração inicial dos dados.

### 02 — Data Quality

- Verificação da consistência dos dados.
- Análise de valores ausentes e duplicidades.
- Validação de relacionamentos.
- Conferência da integridade das informações.

### 03 — Data Loading

- Organização dos arquivos de entrada.
- Criação das tabelas no PostgreSQL.
- Importação dos dados.
- Validação da carga.

### 04 — SQL Exploration

- Consultas exploratórias.
- Análise de pedidos e itens.
- Investigação de pagamentos.
- Exploração de clientes, produtos e vendedores.

### 05 — Business Analysis

- Análise de faturamento e pedidos.
- Comportamento temporal das vendas.
- Análise de produtos e categorias.
- Exploração de logística e entregas.
- Avaliações e experiência do cliente.

### 06 — Analytical Views

Desenvolvimento de views SQL para organizar os dados e disponibilizar estruturas analíticas para o Power BI.

### 07 — Power BI Modeling

- Organização do modelo de dados.
- Relacionamentos.
- Dimensão calendário.
- Medidas DAX.
- Indicadores de negócio.

### 08 — Dashboard Development

Construção de páginas executivas e analíticas para facilitar a interpretação dos resultados.

### 09 — Validation & Insights

Validação dos indicadores, interpretação dos resultados e identificação de oportunidades comerciais e operacionais.

---

## 📊 Validação analítica

Durante a validação da view `vw_fact_order_items`, foram registrados:

| Indicador | Resultado |
|---|---:|
| Linhas de itens | 112.650 |
| Pedidos distintos | 98.666 |
| Soma da coluna `price` | R$ 13.591.643,70 |
| Data máxima de compra | 03/09/2018 |

Os resultados correspondem à versão analisada durante o desenvolvimento e devem ser interpretados considerando a granularidade da view e os filtros aplicados.

---

## 📈 Dashboard Power BI

O dashboard apresenta quatro páginas que conectam a visão executiva à análise comercial, operacional e estratégica.

### 01 — Visão Geral

Visão consolidada dos indicadores e do desempenho do e-commerce.

![Olist — Visão Geral](images/01%20-%20Vis%C3%A3o%20Geral.png)

### 02 — Vendas

Análise do desempenho comercial e da evolução das vendas.

![Olist — Vendas](images/02%20-%20Vendas.png)

### 03 — Análises

Exploração de informações comerciais, logísticas e operacionais.

![Olist — Análises](images/03%20-%20An%C3%A1lises.png)

### 04 — Insights

Apresentação dos principais aprendizados e oportunidades identificadas.

![Olist — Insights](images/04%20-%20Insights.png)

---

## 💡 Análise e geração de insights

A integração das diferentes entidades permite explorar o negócio sob múltiplas perspectivas.

### Comercial
- Evolução do faturamento.
- Volume e comportamento dos pedidos.
- Desempenho de produtos e categorias.
- Distribuição geográfica das vendas.

### Operacional
- Comportamento dos pedidos.
- Prazos e desempenho das entregas.
- Distribuição dos pagamentos.
- Aspectos relacionados à operação logística.

### Experiência do cliente
- Avaliações dos pedidos.
- Comportamento regional.
- Relações entre entrega e avaliação.
- Identificação de possíveis pontos de atenção.

As análises são descritivas e exploratórias. Associações identificadas não devem ser interpretadas automaticamente como relações de causalidade.

---

## 📁 Estrutura do repositório

```text
olist-ecommerce-analytics/
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
│   ├── 05_business_analysis.sql
│   ├── 06_views.sql
│   ├── 07_validation.sql
│   ├── 08_dim_calendar.sql
│   │
│   ├── exports/
│   │   └── olist_views_export.csv
│   │
│   ├── views/
│   │   ├── README.md
│   │   ├── vw_dim_calendar.sql
│   │   ├── vw_dim_category.sql
│   │   ├── vw_dim_customer.sql
│   │   ├── vw_dim_order_powerbi.sql
│   │   ├── vw_dim_order.sql
│   │   ├── vw_dim_product.sql
│   │   ├── vw_dim_seller.sql
│   │   ├── vw_fact_order_items.sql
│   │   ├── vw_fact_payments.sql
│   │   └── vw_fact_reviews.sql
│   │
│   └── README.md
│
├── .gitignore
└── README.md
```

---

## 🚀 Como reproduzir o projeto

1. Obtenha os dados no [Kaggle — Brazilian E-Commerce Public Dataset by Olist](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce).
2. Configure o PostgreSQL.
3. Organize os arquivos nas pastas `data/raw/` e `data/processed/`.
4. Revise os caminhos de importação nos scripts SQL.
5. Execute os scripts numerados na ordem apropriada.
6. Consulte a documentação e as views da pasta `sql/views/`.
7. Execute as consultas de validação.
8. Abra `powerbi/Projeto_Olist.pbix`.
9. Configure a conexão com o banco e atualize o relatório.

Os caminhos locais e parâmetros de conexão podem exigir ajustes conforme o ambiente utilizado.

---

## 🤖 Inteligência Artificial aplicada à análise

A Inteligência Artificial foi utilizada como recurso de apoio ao desenvolvimento, contribuindo para acelerar tarefas de análise, revisão, depuração e documentação.

O uso responsável da IA exige:

- Compreensão das soluções utilizadas.
- Validação independente das consultas.
- Conferência das regras de negócio.
- Verificação dos resultados e indicadores.
- Documentação das decisões.
- Responsabilidade do analista pela interpretação final.

**A IA acelera o trabalho analítico; o julgamento crítico e a validação continuam sendo responsabilidades do analista.**

---

## 👤 Autor

**Renato Leone**  
Analista de Dados | Business Intelligence

[GitHub](https://github.com/rrleone) · [Portfólio](https://sites.google.com/view/renatoleone/) · [Repositório do projeto](https://github.com/rrleone/Olist_Ecommerce_Analytics)

---

<div align="center">

**OLIST E-COMMERCE ANALYTICS**

*Dados · Qualidade · Análise · Insights · Decisões*

**RENATO LEONE | DATA ANALYTICS & BUSINESS INTELLIGENCE**

</div>
