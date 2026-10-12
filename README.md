# 🛒 Olist E-Commerce Analytics

## 🎯 Problema de negócio

A análise busca compreender o desempenho do e-commerce da Olist, conectando vendas, pedidos, pagamentos, produtos, clientes, vendedores, logística e avaliações.

O objetivo é transformar os dados transacionais em informações que apoiem decisões comerciais e operacionais, permitindo acompanhar indicadores de faturamento, volume de pedidos, ticket médio, comportamento temporal das vendas, desempenho logístico e experiência do cliente.

---

## 🗂️ Sobre os dados

- **Fonte:** Brazilian E-Commerce Public Dataset by Olist — Kaggle
- **Tipo de análise:** E-Commerce Analytics / Business Intelligence
- **Unidade de análise:** pedidos, itens de pedido e entidades relacionadas
- **Armazenamento analítico:** PostgreSQL
- **Camada de visualização:** Power BI

### Principais informações analisadas

- Pedidos e status dos pedidos
- Itens, produtos e categorias
- Clientes e localização
- Vendedores
- Pagamentos e formas de pagamento
- Datas de compra e evolução temporal
- Frete e prazos de entrega
- Avaliações dos clientes

---

## 🛠️ Ferramentas utilizadas

- **PostgreSQL**
- **SQL**
- **Views analíticas**
- **Power BI**
- **DAX**
- **CSV**
- **Git / GitHub**
- **Inteligência Artificial** como apoio ao desenvolvimento, com validação humana

---

## 🔍 Etapas do projeto

1. **Data Profiling** — entendimento da estrutura, dimensões, tipos e características dos dados.
2. **Data Quality** — verificações de valores ausentes, duplicidades, consistência e integridade.
3. **Data Loading** — organização dos CSVs e carga dos dados no PostgreSQL.
4. **SQL Exploration** — consultas exploratórias para compreender entidades e comportamento dos dados.
5. **Business Analysis** — análises de vendas, pedidos, pagamentos, logística e avaliações.
6. **Analytical Views** — criação de views para organizar dimensões e fatos consumidos nas análises.
7. **Power BI Data Modeling** — preparação do modelo, calendário, relacionamentos e medidas DAX.
8. **Dashboard & KPIs** — construção de páginas executivas, comerciais e analíticas.
9. **Business Insights** — síntese de resultados, oportunidades e recomendações.
10. **AI-Assisted Analysis** — uso de IA para acelerar tarefas, com validação dos resultados pelo analista.

---

## 📈 Indicadores e validações

Durante a validação da view `vw_fact_order_items`, foram registrados:

- **112.650** linhas de itens;
- **98.666** pedidos distintos;
- **R$ 13.591.643,70** na soma da coluna `price`;
- **03/09/2018** como data máxima de compra registrada na view.

Esses números descrevem a versão analisada durante o desenvolvimento. Devem ser recalculados se os dados, as views, os filtros ou as regras de transformação forem alterados.

---

## 🖼️ Prévia do dashboard

O projeto possui quatro páginas no Power BI:

### 01 — Visão Geral

Resumo executivo dos principais indicadores de faturamento, pedidos, itens, ticket médio e status dos pedidos.

### 02 — Vendas

Análise do desempenho comercial, evolução do faturamento, volume de pedidos e comparação com o período anterior.

### 03 — Análises

Exploração da evolução das vendas, prazos de entrega, desempenho logístico regional, avaliações e relação entre frete e valor da compra.

### 04 — Insights

Síntese dos aprendizados, pontos de atenção, oportunidades e recomendações para apoiar decisões de negócio.

As capturas das páginas estão disponíveis na pasta `imagens/`.

---

## ✅ Conclusão e oportunidades

O projeto demonstra um fluxo de trabalho de Análise de Dados e Business Intelligence que integra preparação de dados, SQL, modelagem analítica, medidas DAX e comunicação executiva.

As análises permitem acompanhar o desempenho comercial e explorar aspectos da operação logística e da experiência do cliente. As associações observadas devem ser interpretadas considerando a cobertura dos dados, as definições das métricas e os filtros aplicados; não representam, por si só, relações de causalidade.

---

## 📁 Estrutura do repositório

```text
olist-ecommerce-analytics/
│
├── data/
│   ├── raw/                  # Arquivos CSV de origem
│   └── processed/            # Dados tratados, quando necessários
│
├── docs/
│   ├── dicionario_dados.md
│   └── metodologia.md
│
├── imagens/
│   ├── Olist - Visão Geral.png
│   ├── Olist - Vendas.png
│   ├── Olist - Análises.png
│   └── Olist - Insights.png
│
├── powerbi/
│   └── Projeto_Olist.pbix
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
│   └── views/
│
└── README.md
```

> A estrutura representa a organização prevista para a entrega. Confira os nomes reais dos arquivos antes de publicar e ajuste a árvore se necessário.

---

## 🚀 Como reproduzir

1. Obtenha o conjunto de dados a partir da fonte autorizada e verifique os termos de uso.
2. Configure o PostgreSQL e ajuste os caminhos dos arquivos CSV e as configurações de conexão para seu ambiente.
3. Execute os scripts SQL na ordem numerada, verificando dependências e resultados de cada etapa.
4. Consulte `sql/views/` para as definições individuais das views.
5. Execute as consultas de validação e compare os resultados com os indicadores do relatório.
6. Abra `powerbi/Projeto_Olist.pbix`, configure a conexão ao banco e atualize os dados.

Não publique credenciais, senhas ou arquivos de configuração com informações sensíveis.

---

## 🤖 Uso de Inteligência Artificial

A IA foi utilizada como apoio para acelerar tarefas de SQL, revisão de medidas, depuração e documentação.

O uso profissional exige que o analista:
- compreenda o código utilizado;
- valide fórmulas e resultados com consultas independentes;
- confira relacionamentos e contexto de filtros;
- documente decisões e limitações;
- mantenha a responsabilidade pela interpretação de negócio.

A IA apoia o trabalho analítico, mas não substitui a validação humana.

---

## 👤 Autor

**Renato Leone**

Analista de Dados | Business Intelligence

GitHub: https://github.com/rrleone

## 📊 Relatório Power BI

Acesse o relatório interativo do projeto Olist:

[**Visualizar relatório no Power BI Service**](https://app.powerbi.com/groups/me/reports/10365f91-fec0-4c71-8167-ed18bcda7ef6/cea2e666e69c26cf6079?experience=power-bi)

> O acesso ao relatório depende das permissões e da autenticação da conta Power BI.
