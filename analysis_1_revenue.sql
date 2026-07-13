-- ANALYSIS 1: REVENUE & SALES PERFORMANCE

-- Q1: Total Revenue
SELECT SUM(price + freight_value) AS total_revenue
FROM order_items;

-- Q2: Monthly Revenue Trend
with details as(select o.order_purchase_timestamp as timestamp, i.price as price, i.freight_value as freight_value from orders as o
join order_items as i
on o.order_id = i.order_id)
select year(timestamp) as year, month(timestamp) as month, sum(price + freight_value) as monthly_revenue from details
group by year, month
order by year, month

-- Q3: Revenue by Product Category
select p.product_category,sum(o.price+o.freight_value) as category_revenue from products p
join order_items o
on p.product_id = o.product_id
group by p.product_category 
order by category_revenue desc

-- Q4: Top 5 Selling Products
select p.product_id,p.product_category,sum(o.price+o.freight_value) as total_revenue from products p
join order_items o
on p.product_id = o.product_id
group by p.product_id
order by total_revenue desc limit 5
