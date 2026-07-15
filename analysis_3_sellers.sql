-- ANALYSIS 3: Seller Analysis

Q1. Total revenue per seller

select seller_id, sum(price + freight_value) as total_revenue from order_items
group by seller_id
order by sum(price + freight_value) desc

Q2. Number of orders per seller

select seller_id, count(distinct(order_id)) as total_orders from order_items
group by seller_id
order by count(distinct(order_id)) desc

Q3. Top performing seller by category

with seller_revenue AS (
    select p.product_category, o.seller_id,
        sum(o.price + o.freight_value) as total_revenue
    from order_items o
    join products p on o.product_id = p.product_id
    group by p.product_category, o.seller_id
),
ranked as (
    select *,
        ROW_NUMBER() OVER (
            partition by product_category
            order by total_revenue desc
        ) as rnk
    from seller_revenue
)
select product_category, seller_id, total_revenue
from ranked
where rnk = 1

Q4. Seller average review score

select o.seller_id, round(avg(r.review_score),1) as avg_review_score from order_items o
join order_reviews r
on o.order_id = r.order_id
group by o.seller_id having count(o.order_id) >= 3
order by round(avg(r.review_score),1) desc

Q5. Sellers with late deliveries

select i.seller_id, count(o.order_delivered_timestamp > order_estimated_delivery_date) as late_deliveries from order_items i
join orders o
on o.order_id = i.order_id
where o.order_delivered_timestamp > o.order_estimated_delivery_date
group by i.seller_id
order by late_deliveries desc


