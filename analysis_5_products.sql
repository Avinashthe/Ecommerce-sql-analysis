-- ANALYSIS 5: Product & Category Insights

Q1. Total products per category

select product_category, count(product_id) as total_products from products
group by product_category
order by count(product_id) desc

Q2. Average product weight by category

select product_category, round(avg(product_weight_g),0) as avg_weight from products
group by product_category
order by avg_weight desc
  
Q3. Most returned or cancelled products

with order_cancel as ( 
  select i.product_id as product_id, o.order_status as order_status from order_items i
   join orders o
   on i.order_id = o.order_id
   where order_status = 'cancelled')
  select p.product_id, p.product_category, count(c.order_status) as cancelled_orders from products p
  join order_cancel c
  on p.product_id = c.product_id
  group by p.product_id, p.product_category
  order by cancelled_orders desc

  
Q4. Revenue and order count per category

select p.product_category,  count(distinct o.order_id) as total_orders, sum(o.price+o.freight_value) as total_revenue, round(avg(o.price+o.freight_value),2) as avg_order_value from products p
join order_items o
on p.product_id = o.product_id
group by p.product_category
order by total_revenue desc

  
Q5. Top product per category by number of orders

with product_orders as(
  select p.product_category, p.product_id, count(o.order_id) as total_orders from products p
join order_items o
on p.product_id = o.product_id
group by p.product_category, p.product_id),
ranked as (
    select *,
    row_number() over (
            partition by  product_category
            order by total_orders desc
        ) as rnk
    from product_orders
)
select product_category, product_id, total_orders
from ranked
where rnk = 1

