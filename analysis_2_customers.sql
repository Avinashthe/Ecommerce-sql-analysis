-- ANALYSIS 2: Customer Behaviour

-- Q1. Total number of unique customers

select count(distinct(customer_id)) as total_customers from orders

-- Q2. Repeat customers [Find customers who have placed more than one order. Show customer_id and their total_orders. Order by total_orders descending.]

select customer_id, count(order_id) as total_orders from orders
group by customer_id having count(order_id) > 1
order by count(order_id) desc

-- Q3. Top 5 customers by revenue
  
select o.customer_id, sum(i.price+i.freight_value) as total_spent from orders o
join order_items i
on i.order_id = o.order_id
group by o.customer_id
order by sum(i.price+i.freight_value) desc limit 5

-- Q4. Customer distribution by state

select customer_state, count(customer_id) as total_customers from customers
group by customer_state 
order by count(customer_id) desc

-- Q5. Average review score per customer state

with customer_details as (
  select c.customer_state as customer_state, o.order_id as order_id from customers c
  join orders o
  on c.customer_id = o.customer_id)
  select a.customer_state, round(avg(r.review_score), 1) as avg_review_score from customer_details a
  join order_reviews r
  on a.order_id = r.order_id
  group by a.customer_state
  order by round(avg(r.review_score),1) desc
