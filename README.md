# 🛒 Brazilian E-Commerce Analysis — SQL Project

## 📌 Project Overview
This project analyses the **Olist Brazilian E-Commerce dataset** — a real-world dataset containing 100,000+ orders placed on Brazil's largest e-commerce marketplace between 2016 and 2018.

The goal is to extract actionable business insights across revenue, customer behaviour, seller performance, delivery operations, product trends and payment patterns using advanced SQL techniques.

---

## 📂 Dataset
- **Source:** [Brazilian E-Commerce Public Dataset by Olist](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce)
- **Size:** 100,000+ orders across 8 tables
- **Period:** 2016 – 2018
- **Tables:** customers, orders, order_items, products, sellers, order_payments, order_reviews, geolocation

---

## 🛠️ Tools Used
- **MySQL 8.0** — querying and analysis
- **DB Fiddle** — online SQL environment
- **GitHub** — version control and project showcase

---

## 📊 Analyses Performed

### 1. Revenue & Sales Performance
- Total revenue generated across all orders
- Monthly revenue trend over time
- Revenue breakdown by product category
- Top 5 highest revenue generating products

### 2. Customer Behaviour
- Total unique customers
- Repeat customers and order frequency
- Top 5 customers by total spend
- Customer distribution across Brazilian states
- Average review score by customer state

### 3. Seller Performance
- Total revenue per seller
- Order volume per seller
- Top performing seller within each product category
- Seller average review scores (min 3 reviews)
- Sellers with late delivery records

### 4. Delivery & Operations
- Average delivery time in days
- On-time vs late delivery breakdown
- Average delivery time by customer state
- Orders delivered ahead of schedule
- Monthly on-time delivery rate

### 5. Product & Category Insights
- Product count per category
- Average product weight by category
- Products appearing in cancelled orders
- Revenue, order count and average order value per category
- Top selling product within each category

### 6. Payment Trends
- Total revenue by payment type
- Average installments by payment type
- Most popular payment type per state
- High value orders identified using dynamic average
- Monthly payment trends by payment type

---

## 💡 Key Findings

### Revenue
- **Electronics** is the highest revenue category, followed by **Furniture**
- Revenue shows a consistent upward trend month over month
- Top 5 products contribute a significant portion of total revenue

### Customers
- **São Paulo (SP)** has the highest customer concentration
- A small percentage of customers are repeat buyers — opportunity for retention campaigns
- Customer satisfaction varies significantly by state

### Sellers
- A handful of top sellers generate the majority of revenue
- Late deliveries are concentrated among specific sellers — flagged for performance review
- Electronics sellers lead in revenue per category

### Delivery
- Average delivery time is approximately 8 days
- Majority of orders are delivered on time
- Southern states tend to receive faster deliveries than northern states

### Payments
- **Credit card** is the dominant payment method
- High installment usage suggests customers prefer spreading payments
- Payment values show clear seasonal spikes

---

## 🗂️ Project Structure

```
ecommerce-sql-analysis/
│
├── analysis_1_revenue.sql          # Revenue & Sales Performance
├── analysis_2_customers.sql        # Customer Behaviour
├── analysis_3_sellers.sql          # Seller Performance
├── analysis_4_delivery.sql         # Delivery & Operations
├── analysis_5_products.sql         # Product & Category Insights
├── analysis_6_payments.sql         # Payment Trends
└── README.md                       # Project documentation
```

---

## 🧠 SQL Concepts Used
- **Joins** — INNER JOIN, LEFT JOIN across multiple tables
- **Aggregations** — SUM, COUNT, AVG, MIN, MAX
- **Window Functions** — ROW_NUMBER(), RANK(), LAG()
- **CTEs** — Common Table Expressions for readable multi-step queries
- **Subqueries** — Correlated and non-correlated subqueries
- **CASE WHEN** — Conditional logic and dynamic labelling
- **Date Functions** — YEAR(), MONTH(), DATEDIFF()
- **GROUP BY / HAVING** — Grouped aggregations with filters

---

## 📈 Business Impact
This analysis provides an e-commerce business with:
- Clear visibility into **revenue drivers** by product and category
- Identification of **high value and repeat customers** for targeted marketing
- **Seller performance metrics** to manage marketplace quality
- **Delivery bottlenecks** by region and seller
- **Payment behaviour insights** to optimise checkout experience

---

## 👤 Author
- **GitHub:** [Avinashthe]
- **LinkedIn:** [https://www.linkedin.com/in/avinash-g10/]

---

## 🔗 References
- [Olist Dataset on Kaggle](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce)
- [Olist Official Website](https://olist.com)
