-- ANALYSIS 4: Delivery and Operations

Q1. Average delivery time in days

select avg(datediff(order_delivered_timestamp,order_purchase_timestamp)) as avg_delivery_days from orders
where order_status = 'delivered'

Q2. On time vs late deliveries

select
case when order_estimated_delivery_date > order_delivered_timestamp then 'OnTime'
else 'Late' 
end as delivery_status,
count(order_id) as total_orders from orders
where order_status = 'delivered'
group by delivery_status

Q3. Average delivery time by state

select c.customer_state, round(avg(datediff(o.order_delivered_timestamp, o.order_purchase_timestamp)),1) as avg_delivery_days from customers c
left join orders o
on c.customer_id = o.customer_id
group by c.customer_state
order by round(avg(datediff(o.order_delivered_timestamp, o.order_purchase_timestamp)),1) asc

Q4. Orders delivered faster than estimated

select order_id, datediff(order_estimated_delivery_date, order_delivered_timestamp) as days_early, order_status from orders
where order_status = 'delivered'
order by days_early desc limit 10

Q5. Monthly on-time delivery rate

WITH delivery_details AS (
    select order_delivered_timestamp,
        case when order_estimated_delivery_date > order_delivered_timestamp then 'OnTime'
            else 'Late'
        end as delivery_status
    from orders
    where order_status = 'delivered'
)
select year(order_delivered_timestamp) as year, month(order_delivered_timestamp) as month,
    round(sum(case when delivery_status = 'OnTime' then 1 else 0 end) * 100.0 / count(*), 1) as on_time_rate
from delivery_details
group by year, month
order by year, month

