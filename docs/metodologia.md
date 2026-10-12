# 🔎 Metodologia — Olist E-Commerce Analytics

## 🎯 Objetivo

Documentar o fluxo utilizado para transformar os dados públicos da Olist em análises de negócio e indicadores no Power BI.

---

## 🧭 Fluxo de trabalho

1. **Data Profiling** — entendimento inicial de tabelas, campos, tipos e volumes.
2. **Data Quality** — inspeção de valores ausentes, duplicidades, consistência e integridade.
3. **Carga no PostgreSQL** — preparação das tabelas e importação dos arquivos CSV.
4. **SQL Exploration** — consultas para conhecer os dados e identificar padrões.
5. **Business Analysis** — análise de pedidos, faturamento, pagamentos, produtos, logística e avaliações.
6. **Views Analíticas** — organização dos dados em views reutilizáveis.
7. **Modelagem no Power BI** — relacionamentos, calendário e medidas DAX.
8. **Validação** — comparação de totais e métricas do Power BI com consultas SQL.
9. **Insights executivos** — comunicação dos resultados e das oportunidades identificadas.

---

## 🧰 Organização SQL

Os scripts numerados representam as etapas previstas no repositório:

- `01_create_tables.sql` — criação das tabelas.
- `02_import_csv.sql` — importação dos arquivos.
- `03_data_quality.sql` — verificações de qualidade.
- `04_exploration.sql` — exploração dos dados.
- `05_business_analysis.sql` — consultas de negócio.
- `06_views.sql` — criação de views.
- `07_validation.sql` — validação dos resultados.
- `08_dim_calendar.sql` — dimensão calendário.

As definições individuais estão em `sql/views/`. O SQL de cada arquivo é a referência para a lógica realmente implementada.

---

## 📊 Dashboard

- **Visão Geral:** KPIs executivos e visão do status dos pedidos.
- **Vendas:** faturamento, pedidos, itens, ticket médio e crescimento.
- **Análises:** tendências comerciais, prazos, logística, avaliações e frete.
- **Insights:** conclusões, oportunidades e recomendações.

---

## 🤖 Uso de IA e validação

A IA pode acelerar a criação e revisão de consultas, fórmulas e documentação. A validação final permanece sob responsabilidade do analista.

Práticas adotadas:
- verificar os resultados com consultas independentes;
- conferir a lógica das medidas DAX e o contexto dos filtros;
- comparar indicadores entre PostgreSQL e Power BI;
- registrar limitações e evitar conclusões causais sem evidência.

---

## ⚠️ Limitações

- Os resultados dependem dos dados e das transformações aplicadas.
- Associação entre variáveis não comprova causalidade.
- O relatório não deve ser interpretado como monitoramento operacional em tempo real.
- Antes de publicar dados, verificar licença, privacidade e necessidade de redistribuição.
