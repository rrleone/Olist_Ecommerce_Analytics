# 🛒 Olist E-Commerce Analytics

<div align="center">

### E-Commerce · Sales · Customer Behavior · Logistics

<p>
  <img src="https://img.shields.io/badge/PostgreSQL-4169E1?style=for-the-badge&logo=postgresql&logoColor=white"/>
  <img src="https://img.shields.io/badge/SQL-4479A1?style=for-the-badge&logoColor=white"/>
  <img src="https://img.shields.io/badge/Power%20BI-F2C811?style=for-the-badge&logo=powerbi&logoColor=black"/>
  <img src="https://img.shields.io/badge/DAX-2C3E50?style=for-the-badge&logoColor=white"/>
  <img src="https://img.shields.io/badge/Git%20%26%20GitHub-181717?style=for-the-badge&logo=github&logoColor=white"/>
</p>

**Transformando dados do e-commerce brasileiro em insights comerciais e operacionais.**

</div>

---

## 🎯 Problema de negócio

A análise busca compreender o desempenho do e-commerce da Olist, conectando vendas, pedidos, pagamentos, produtos, clientes, vendedores, logística e avaliações.

O objetivo é transformar dados transacionais em informações que apoiem decisões comerciais e operacionais, permitindo acompanhar indicadores de faturamento, volume de pedidos, ticket médio, comportamento temporal das vendas, desempenho logístico e experiência do cliente.

---

## 🗂️ Sobre os dados

- **Fonte:** Brazilian E-Commerce Public Dataset by Olist — Kaggle
- **Tipo de análise:** E-Commerce Analytics / Business Intelligence
- **Unidade de análise:** pedidos, itens de pedido e entidades relacionadas
- **Armazenamento analítico:** PostgreSQL
- **Visualização:** Power BI

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

## 🛠️ Tecnologias e ferramentas

| Tecnologia | Aplicação no projeto |
|---|---|
| PostgreSQL | Armazenamento e consulta dos dados |
| SQL | Exploração, validação e análise |
| Views analíticas | Organização dos dados para análise |
| Power BI | Modelagem e visualização dos indicadores |
| DAX | Criação de medidas e indicadores |
| CSV | Formato dos dados de entrada |
| Git / GitHub | Versionamento e documentação |
| Inteligência Artificial | Apoio ao desenvolvimento, com validação humana |

---

## 🔍 Etapas do projeto

**Fluxo:** Dados → Qualidade → SQL → Análise de Negócio → Modelagem → Dashboard → Insights

1. **Data Profiling** — entendimento da estrutura, dimensões, tipos e características dos dados.
2. **Data Quality** — verificações de valores ausentes, duplicidades, consistência e integridade.
3. **Data Loading** — organização dos CSVs e carga dos dados no PostgreSQL.
4. **SQL Exploration** — consultas exploratórias para compreender entidades e comportamento dos dados.
5. **Business Analysis** — análises de vendas, pedidos, pagamentos, logística e avaliações.
6. **Analytical Views** — criação de views para organizar dados consumidos nas análises.
7. **Power BI Data Modeling** — preparação do modelo, calendário, relacionamentos e medidas DAX.
8. **Dashboard & KPIs** — construção das páginas executivas e analíticas.
9. **Business Insights** — síntese de resultados, oportunidades e recomendações.
10. **AI-Assisted Analysis** — uso de IA para acelerar tarefas, com validação dos resultados pelo analista.

---

## 📊 Indicadores e validações

Durante a validação da view `vw_fact_order_items`, foram registrados:

| Indicador | Resultado |
|---|---:|
| Linhas de itens | 112.650 |
| Pedidos distintos | 98.666 |
| Soma da coluna `price` | R$ 13.591.643,70 |
| Data máxima de compra | 03/09/2018 |

> Os valores representam a versão analisada durante o desenvolvimento. Podem variar caso os dados, views, filtros ou regras de transformação sejam modificados.

---

## 📈 Dashboard Power BI

O relatório está organizado em quatro páginas analíticas.

### 01 — Visão Geral

Resumo executivo dos principais indicadores de faturamento, pedidos, itens, ticket médio e status dos pedidos.

![Olist — Visão Geral](https://raw.githubusercontent.com/rrleone/Olist_Ecommerce_Analytics/main/images/Olist%20-%20Vis%C3%A3o%20Geral.png)

### 02 — Vendas

Análise do desempenho comercial, evolução do faturamento, volume de pedidos e comparação com períodos anteriores.

![Olist — Vendas](https://raw.githubusercontent.com/rrleone/Olist_Ecommerce_Analytics/main/images/Olist%20-%20Vendas.png)

### 03 — Análises

Exploração da evolução das vendas, prazos de entrega, desempenho logístico regional, avaliações e relação entre frete e valor da compra.

![Olist — Análises](https://raw.githubusercontent.com/rrleone/Olist_Ecommerce_Analytics/main/images/Olist%20-%20An%C3%A1lises.png)

### 04 — Insights

Síntese dos aprendizados, pontos de atenção, oportunidades e recomendações para apoiar decisões de negócio.

![Olist — Insights](https://raw.githubusercontent.com/rrleone/Olist_Ecommerce_Analytics/main/images/Olist%20-%20Insights.png)

---

## 💡 Conclusão e oportunidades

O projeto demonstra a aplicação de um fluxo de trabalho de Análise de Dados e Business Intelligence, integrando preparação e validação de dados, SQL, modelagem analítica, medidas DAX e comunicação executiva.

As análises permitem acompanhar o desempenho comercial e explorar aspectos da operação logística e da experiência do cliente.

As relações observadas são associações descritivas e não demonstram, por si só, causalidade.

---

## 📁 Estrutura do repositório

```text
Olist_Ecommerce_Analytics/
│
├── data/
│
├── docs/
│   └── dicionario_dados
│
├── images/
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

---

## 🚀 Como reproduzir o projeto

1. Obtenha o dataset original na fonte: [Brazilian E-Commerce Public Dataset by Olist — Kaggle](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce).
2. Configure o PostgreSQL em seu ambiente.
3. Ajuste os caminhos dos arquivos CSV e as configurações de conexão.
4. Execute os scripts SQL na ordem numerada, respeitando suas dependências.
5. Consulte a pasta `sql/views/` para as definições individuais das views.
6. Execute as consultas de validação e compare os resultados com os indicadores documentados.
7. Abra `powerbi/Projeto_Olist.pbix`, configure a conexão ao banco e atualize os dados.

**Segurança:** não publique credenciais, senhas ou arquivos de configuração com informações sensíveis.

---

## 🤖 Uso de Inteligência Artificial

A Inteligência Artificial foi utilizada como apoio ao desenvolvimento, contribuindo para acelerar tarefas de SQL, revisão de medidas, depuração e documentação.

O uso profissional exige que o analista:

- compreenda o código utilizado;
- valide fórmulas e resultados por meio de consultas independentes;
- confira relacionamentos e contexto de filtros;
- documente decisões e limitações;
- mantenha a responsabilidade pela interpretação dos resultados.

A IA apoia o trabalho analítico, mas não substitui a validação humana.

---

## 👤 Autor

**Renato Leone**  
Analista de Dados | Business Intelligence

- **GitHub:** [github.com/rrleone](https://github.com/rrleone)
- **Portfólio:** [Renato Leone — Data Analytics & BI](https://sites.google.com/view/renatoleone/)
- **Repositório:** [Olist_Ecommerce_Analytics](https://github.com/rrleone/Olist_Ecommerce_Analytics)

## Referências

**Dados**

- Kaggle — [Brazilian E-Commerce Public Dataset by Olist](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce)

**Documentação**

- [PostgreSQL](https://www.postgresql.org/docs/)
- [Microsoft Power BI](https://learn.microsoft.com/power-bi/)
- [DAX — Microsoft Learn](https://learn.microsoft.com/dax/)

---

<div align="center">

**OLIST E-COMMERCE ANALYTICS**  
*Dados · Qualidade · Análise · Insights · Decisões*

**RENATO LEONE | DATA ANALYTICS & BUSINESS INTELLIGENCE**

</div>
