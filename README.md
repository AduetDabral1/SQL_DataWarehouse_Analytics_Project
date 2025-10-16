# SQL Data Warehouse and Analytics Project 🚀

This repository documents a comprehensive project that establishes a modern **Data Warehouse** and **Analytics** solution using **SQL Server**. It demonstrates end-to-end data engineering practices, from initial data ingestion to the creation of analytical data models for business intelligence.

-----

## 🏗️ Technical Architecture: Medallion Framework

The data architecture is structured using the **Medallion Architecture**, a multi-layered approach designed to ensure data quality and utility:

1.  **Bronze Layer (Raw Data):**
      * **Purpose:** Stores raw, unvalidated data directly ingested from source systems.
      * **Ingestion:** Data is loaded from **CSV files** into the SQL Server database.
      * **State:** Data is kept in its original format.
2.  **Silver Layer (Cleansed and Conformed Data):**
      * **Purpose:** Applies data cleansing, standardization, and normalization to prepare data for reliable analysis.
      * **Processes:** Focuses on resolving **data quality issues** and integrating data sources.
3.  **Gold Layer (Curated and Business-Ready Data):**
      * **Purpose:** Houses final, high-value data structured for business reporting and analytics.
      * **Modeling:** Data is organized into a **Star Schema** (Fact and Dimension tables) optimized for fast analytical queries.

<img width="1185" height="732" alt="Data Architecture" src="https://github.com/user-attachments/assets/00f68f4d-1106-4aae-bd64-40f9a315a88e" />

-----

## 📖 Project Scope and Methodology

This project encompasses the following core technical phases:

1.  **Data Architecture Design:** Implementing the layered Medallion architecture within a SQL Server environment.
2.  **ETL Pipelines:** Developing **Extract, Transform, Load (ETL)** processes to move data between the Bronze, Silver, and Gold layers.
3.  **Data Modeling:** Creating robust **Fact and Dimension tables** for efficient analytical reporting.
4.  **Analytics & Reporting:** Developing and executing **SQL-based queries** to generate key business insights.

-----

## 🛠️ Key Technologies and Tools

| Component | Usage |
| :--- | :--- |
| **Database Engine** | **SQL Server Express** for hosting the data warehouse. |
| **Database Management** | **SQL Server Management Studio (SSMS)** for interaction, querying, and administration. |
| **ETL/Dataflow Design**| **DrawIO** for documenting ETL workflows, data flows, and architectural diagrams. |
| **Version Control** | **Git/GitHub** for managing code, scripts, and project documentation. |

-----

## 🚀 Project Requirements and Deliverables

### Data Engineering (Data Warehouse Build)

**Objective:** Develop a SQL Server data warehouse to consolidate sales data from disparate sources into a unified analytical model.

**Specifications:**

  * **Data Sources:** Integrate data from two distinct source systems (**ERP** and **CRM**), provided initially as flat files (CSV).
  * **Data Quality:** Implement processes to cleanse and resolve data quality issues prior to data analysis.
  * **Data Integration:** Combine data from both source systems into a single, cohesive, and user-friendly data model.
  * **Scope:** The focus is on consolidating the **latest dataset**; **data historization** (Type 2 SCDs) is **not required**.
  * **Documentation:** Provide detailed **data model documentation** (e.g., entity-relationship diagrams, metadata).

### Business Intelligence (Analytics & Reporting)

**Objective:** Generate detailed, SQL-based analytical insights to drive strategic decision-making.

**Deliverables (Analytical Focus):**

  * Metrics and reports concerning **Customer Behavior**.
  * Metrics and reports concerning **Product Performance**.
  * Metrics and reports concerning **Sales Trends**.

-----

## 📂 Repository Structure

The project code and documentation are organized as follows:

```
data-warehouse-project/
│
├── datasets/         # Raw data files (e.g., CSVs) from ERP and CRM sources.
├── docs/             # Project documentation and architectural diagrams.
│   ├── Project Architecture.drawio          # Diagrams illustrating ETL techniques and methodologies.
│   ├── Data Architecture.png                # Diagram of the Bronze/Silver/Gold architecture.
│   ├── data_catalog.md                      # Metadata catalog including field descriptions.
│   ├── Data Flow Diagram.png                # Detailed data flow diagram.
│   ├── Sales Data Mart Schema.png           # Diagrams for data models (Star Schema).
│   └── naming-conventions.md                # Guidelines for consistent naming across assets.
├── scripts/          # SQL scripts organized by data warehouse layer.
│   ├── bronze/                              # Scripts for initial data extraction and loading (ELT step).
│   ├── silver/                              # Scripts for data cleaning, transformation, and conformance.
│   └── gold/                                # Scripts for creating analytical Fact and Dimension tables.
├── tests/            # Test scripts and SQL files for data quality checks.
├── README.md         # Summarizes the project and explains the peoject methodology
```
