-- ANALYSIS 6: Payment Trends

Q1. Revenue by payment type

select p.payment_type, sum(i.price + i.freight_value) as total_revenue from order_payments p
join order_items i
on p.order_id = i.order_id
group by p.payment_type
order by total_revenue desc

  
Q2. Average installments by payment type

select payment_type, round(avg(payment_installments),1) as avg_installments from order_payments
group by payment_type
order by avg_installments desc

  
Q3. Most popular payment type per state

with state_payments as (
    select c.customer_state, p.payment_type,
        count(*) as total_orders
    from customers c
    join orders o on c.customer_id = o.customer_id
    join order_payments p on o.order_id = p.order_id
    group by c.customer_state, p.payment_type
),
ranked as (
    select *,
        row_number() over (
            partition by customer_state
            order by total_orders desc
        ) as rnk
    from state_payments
)
select customer_state, payment_type, total_orders
from ranked
where rnk = 1

  
Q4. High value orders by payment type

select order_id, payment_type, payment_value,
  case 
  when payment_value > (select avg(payment_value) from order_payments) then 'High_Value'
  else 'Normal_value'
  end as order_segment
  from order_payments
  where payment_value > (select avg(payment_value) from order_payments)
  order by payment_value desc

  
Q5. Monthly payment trends

with payment_details as (
    select 
        year(o.order_purchase_timestamp) as year,
        month(o.order_purchase_timestamp) as month,
        p.payment_type,
        sum(p.payment_value) as total_value
    from orders o
    join order_payments p 
    on o.order_id = p.order_id
    group by year, month, p.payment_type
)
select *
from payment_details
order by year, month, total_value desc



