# 🛒 Urban E-Commerce & Logistics Data Model (SQL)

## 📌 Project Overview
This project involves the end-to-end design, implementation, and analysis of a relational database for a quick-commerce and delivery logistics business. The primary objective is to optimize urban delivery operations, analyze customer purchasing behavior, and track revenue generation across various product categories in the Pune region (focusing on areas like Hadapsar, Viman Nagar, etc.).

## 🗄️ Database Schema
The relational database consists of four interconnected tables:
* **Customers:** Stores customer demographics and registration details.
* **Products:** Catalogs inventory details including categories (e.g., Baby Care, Personal Care) and pricing.
* **Orders:** Tracks delivery logistics, including order dates, delivery areas, and delivery turnaround times.
* **Order_Items:** A mapping table that links orders to specific products and quantities.

## ❓ Business Problems Solved
1. **Logistics Bottlenecks:** Identified areas with the highest average delivery times to optimize routing.
2. **Revenue Analysis:** Calculated total revenue generated per product category to identify top-performing segments.
3. **Customer Retention:** Utilized Window Functions (DENSE_RANK) to rank top customers based on order frequency for potential loyalty programs.
4. **Targeted Marketing:** Isolated specific customer segments (e.g., buyers exclusive to the 'Baby Care' category) using nested subqueries.

## 🛠️ SQL Techniques Utilized
* **Data Definition Language (DDL):** `CREATE TABLE`, Primary & Foreign Keys for Data Integrity.
* **Data Manipulation Language (DML):** `INSERT INTO` for populating datasets.
* **Joins & Aggregations:** `INNER JOIN`, `GROUP BY`, `SUM()`, `AVG()`, `COUNT()`.
* **Advanced SQL:** Common Table Expressions (CTEs), Window Functions (`PARTITION BY`, `DENSE_RANK()`), and Subqueries.

## 💡 Key Insights
* **Delivery Performance:** Identified specific delivery zones that consistently exceed the average delivery timeframe, highlighting a need for localized micro-warehouses or additional delivery personnel.
* **Sales Trends:** High-value product categories drive a significant portion of the overall revenue, indicating strong cross-selling opportunities with household consumables.
* **Customer Loyalty:** A distinct subset of customers generates the majority of repeat orders, making them ideal candidates for a premium subscription model.

## 🚀 How to Run the Project
1. Execute `01_Database_and_Tables.sql` to create the schema.
2. Run `02_Data_Insert.sql` to populate the tables with sample records.
3. Open `03_Business_Analysis_Queries.sql` to view the advanced analytical queries and insights.
4. 📊 Presentation: Click here to view the Project Presentation PDF URBAN E-COMMERCEppt.pdf

**Author:** Ankita Manchalwar
**Tools Used:** SQL, Relational Database Management
