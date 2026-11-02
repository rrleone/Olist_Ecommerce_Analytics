<div align="center">

<h1>Olist E-Commerce Analytics</h1>

<h3>End-to-End Data Analytics & Business Intelligence</h3>

<p>
E-Commerce · Sales Performance · Customer Behavior · Logistics · Business Insights
</p>

<p>
  <img src="https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white"/>
  <img src="https://img.shields.io/badge/Pandas-150458?style=for-the-badge&logo=pandas&logoColor=white"/>
  <img src="https://img.shields.io/badge/PostgreSQL-4169E1?style=for-the-badge&logo=postgresql&logoColor=white"/>
  <img src="https://img.shields.io/badge/SQL-4479A1?style=for-the-badge&logo=postgresql&logoColor=white"/>
  <img src="https://img.shields.io/badge/Power%20BI-F2C811?style=for-the-badge&logo=powerbi&logoColor=black"/>
  <img src="https://img.shields.io/badge/DAX-2C3E50?style=for-the-badge"/>
</p>

<p>
<strong>Transformando dados transacionais em inteligência comercial, operacional e estratégica.</strong>
</p>

</div>

---

## Visão Executiva

O **Olist E-Commerce Analytics** é um projeto de Análise de Dados e Business Intelligence desenvolvido a partir do Brazilian E-Commerce Public Dataset by Olist.

O projeto integra diferentes entidades do ecossistema de e-commerce para construir uma visão analítica de vendas, clientes, produtos, pagamentos, vendedores, logística e avaliações.

A iniciativa percorre um fluxo de trabalho de ponta a ponta, desde a exploração e preparação dos dados até a construção de estruturas analíticas em PostgreSQL, modelagem no Power BI e desenvolvimento de indicadores para apoiar decisões de negócio.

Mais do que apresentar gráficos, o projeto demonstra como dados estruturados, regras de negócio e análise crítica podem transformar informações operacionais em conhecimento relevante para a gestão.

**DATA ENGINEERING · DATA ANALYTICS · BUSINESS INTELLIGENCE**

Dados → Qualidade → SQL → Modelagem → Indicadores → Insights

---

## Problema de Negócio

Um e-commerce opera com informações distribuídas entre pedidos, clientes, produtos, pagamentos, vendedores, entregas e avaliações.

A análise isolada dessas informações limita a compreensão do desempenho global da operação.

O projeto busca responder questões como:

- Como evoluem o faturamento e o volume de pedidos?
- Quais produtos e categorias apresentam maior participação comercial?
- Como o faturamento se distribui ao longo do tempo?
- Qual é o comportamento dos pagamentos?
- Como se comportam os prazos de entrega?
- Existem diferenças no desempenho logístico entre regiões?
- Como as avaliações dos clientes se relacionam com a experiência de compra?
- Quais indicadores podem apoiar decisões comerciais e operacionais?

O objetivo é integrar essas informações e construir uma visão analítica consistente da operação.

---

## Sobre os Dados

- **Fonte:** Brazilian E-Commerce Public Dataset by Olist — Kaggle
- **Segmento:** E-commerce
- **Tipo de análise:** Data Analytics e Business Intelligence
- **Unidade de análise:** pedidos, itens de pedido e entidades relacionadas
- **Armazenamento analítico:** PostgreSQL
- **Visualização:** Microsoft Power BI
- **Formato de origem:** CSV

### Entidades analisadas

- Clientes
- Localização geográfica
- Vendedores
- Produtos
- Categorias de produtos
- Pedidos
- Itens de pedido
- Pagamentos
- Avaliações

### Dimensões de análise

- Desempenho comercial
- Faturamento e pedidos
- Produtos e categorias
- Clientes e localização
- Vendedores
- Formas de pagamento
- Evolução temporal
- Frete e logística
- Prazos de entrega
- Avaliações dos clientes

---

## Tecnologias e Ferramentas

| Tecnologia | Aplicação no projeto |
|---|---|
| **PostgreSQL** | Armazenamento, organização e consulta dos dados |
| **SQL** | Criação de tabelas, exploração, validação e análise |
| **Views analíticas** | Organização dos dados para consumo analítico |
| **Power BI** | Construção do relatório interativo |
| **DAX** | Desenvolvimento de medidas e indicadores |
| **CSV** | Formato dos dados de origem |
| **Git / GitHub** | Versionamento e publicação do projeto |

A Inteligência Artificial foi utilizada como apoio ao desenvolvimento e à documentação, com validação humana das soluções e dos resultados.

---

## Metodologia

O projeto foi desenvolvido seguindo um fluxo de trabalho analítico estruturado.

### 1. Data Profiling

Inspeção inicial dos arquivos e tabelas para compreender:

- Estrutura e dimensões;
- Tipos de dados;
- Características das entidades;
- Relacionamentos;
- Distribuição dos dados.

### 2. Data Quality

Verificações relacionadas a:

- Valores ausentes;
- Duplicidades;
- Consistência dos registros;
- Integridade referencial;
- Qualidade das chaves;
- Validação dos dados utilizados nas análises.

### 3. Data Loading

Organização dos arquivos CSV e carregamento das informações no PostgreSQL.

### 4. SQL Exploration

Exploração das entidades e relacionamentos utilizando consultas SQL.

### 5. Business Analysis

Desenvolvimento de análises envolvendo:

- Vendas;
- Pedidos;
- Pagamentos;
- Produtos;
- Clientes;
- Logística;
- Avaliações.

### 6. Analytical Views

Criação de views analíticas para organizar os dados e facilitar sua utilização no Power BI.

### 7. Data Modeling

Construção do modelo analítico no Power BI, incluindo:

- Relacionamentos;
- Dimensão calendário;
- Organização das tabelas;
- Medidas DAX;
- Contexto de filtros.

### 8. Dashboard Development

Construção de páginas analíticas para acompanhamento dos indicadores e exploração dos resultados.

### 9. Validation

Validação dos dados, consultas SQL, views e indicadores do relatório.

### 10. Business Insights

Interpretação dos resultados para identificar oportunidades, pontos de atenção e possíveis ações de negócio.

---

## Indicadores e Validações

Durante a validação da view `vw_fact_order_items`, foram registrados os seguintes resultados:

| Indicador | Resultado |
|---|---:|
| Linhas de itens | 112.650 |
| Pedidos distintos | 98.666 |
| Soma da coluna `price` | R$ 13.591.643,70 |
| Data máxima de compra | 03/09/2018 |

Esses valores correspondem à versão analisada durante o desenvolvimento.

Os indicadores devem ser interpretados considerando a view utilizada, as regras de transformação, os filtros e a definição de cada métrica.

A soma de `price` representa o valor da coluna analisada e não deve ser automaticamente interpretada como faturamento líquido ou receita contábil.

---

## Dashboard Power BI

O relatório Power BI está organizado em quatro páginas complementares.

### 01 — Visão Geral

Resumo executivo dos principais indicadores:

- Faturamento;
- Pedidos;
- Itens;
- Ticket médio;
- Status dos pedidos.

![Olist — Visão Geral](images/01%20-%20Vis%C3%A3o%20Geral.png)

### 02 — Vendas

Análise do desempenho comercial, evolução do faturamento, volume de pedidos e comparação temporal.

![Olist — Vendas](images/02%20-%20Vendas.png)

### 03 — Análises

Exploração de diferentes aspectos da operação:

- Evolução das vendas;
- Prazos de entrega;
- Desempenho logístico regional;
- Avaliações dos clientes;
- Relação entre frete e valor da compra.

![Olist — Análises](images/03%20-%20An%C3%A1lises.png)

### 04 — Insights

Síntese dos aprendizados, pontos de atenção, oportunidades e recomendações para apoiar decisões de negócio.

![Olist — Insights](images/04%20-%20Insights.png)

---

## Insights e Aplicações de Negócio

A integração dos dados permite explorar diferentes perspectivas da operação.

### Desempenho Comercial

Acompanhamento do faturamento, volume de pedidos e evolução temporal para compreender o comportamento das vendas.

### Produtos e Categorias

Identificação de produtos e categorias relevantes para a composição dos resultados comerciais.

### Pagamentos

Análise das formas de pagamento e características das transações.

### Logística

Investigação de prazos de entrega, diferenças regionais e possíveis pontos de atenção operacionais.

### Experiência do Cliente

Exploração das avaliações para compreender aspectos relacionados à experiência de compra.

### Apoio à Gestão

Utilização dos indicadores para facilitar o acompanhamento de desempenho e direcionar investigações adicionais.

As análises representam associações e padrões observados nos dados. Não devem ser interpretadas como evidência de causalidade sem investigações complementares.

---

## Estrutura do Repositório

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
│   ├── 04 - Insights.png
│   └── 05 - Capa.png
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
│   ├── exports/
│   └── views/
│
├── .gitignore
└── README.md
```

---

## Como Executar

### Pré-requisitos

- PostgreSQL;
- Microsoft Power BI Desktop;
- Dataset original da Olist;
- Arquivos e scripts disponíveis no repositório.

### Etapas de reprodução

1. Obtenha o Brazilian E-Commerce Public Dataset by Olist na fonte original.
2. Organize os arquivos CSV na estrutura de dados do projeto.
3. Configure o PostgreSQL e o banco de dados.
4. Ajuste os caminhos dos arquivos e as configurações de conexão para o ambiente local.
5. Execute os scripts SQL na ordem numerada, respeitando suas dependências.
6. Consulte a pasta `sql/views/` para as definições das views analíticas.
7. Execute as consultas de validação.
8. Abra `powerbi/Projeto_Olist.pbix`.
9. Configure a conexão com o PostgreSQL.
10. Atualize os dados e explore as páginas do relatório.

Não publique credenciais, senhas ou arquivos de configuração com informações sensíveis.

---

## Utilização de Inteligência Artificial

A Inteligência Artificial foi utilizada como recurso de apoio ao desenvolvimento, incluindo tarefas de SQL, revisão, depuração e documentação.

A aplicação profissional de IA exige validação pelo analista.

Durante o desenvolvimento, a responsabilidade analítica envolve:

- Compreender o código utilizado;
- Validar consultas e fórmulas;
- Conferir resultados;
- Verificar relacionamentos e contexto de filtros;
- Documentar decisões;
- Avaliar limitações;
- Interpretar os resultados sob a perspectiva de negócio.

A IA atua como ferramenta de apoio, não como substituta do julgamento analítico.

---

## Conclusão

O Olist E-Commerce Analytics demonstra a aplicação de um fluxo de trabalho de ponta a ponta em Análise de Dados e Business Intelligence.

O projeto integra dados transacionais, SQL, PostgreSQL, views analíticas, modelagem de dados, DAX e Power BI para construir uma visão comercial e operacional do e-commerce.

A iniciativa evidencia a importância da qualidade dos dados, da organização analítica, da validação dos indicadores e da interpretação dos resultados para transformar dados em informações relevantes para a gestão.

---

## Autor

**Renato Leone**  
Analista de Dados | Business Intelligence

- **GitHub:** [github.com/rrleone](https://github.com/rrleone)
- **Portfólio:** [Renato Leone — Data Analytics & BI](https://sites.google.com/view/renatoleone/)
- **Repositório:** [Olist_Ecommerce_Analytics](https://github.com/rrleone/Olist_Ecommerce_Analytics)

---

<div align="center">

**OLIST E-COMMERCE ANALYTICS**

Dados · Qualidade · Análise · Insights · Decisões

**RENATO LEONE | DATA ANALYTICS & BUSINESS INTELLIGENCE**

</div>
