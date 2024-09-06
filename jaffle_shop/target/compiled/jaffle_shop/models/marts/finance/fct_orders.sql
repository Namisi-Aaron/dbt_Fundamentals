with orders as (
    select * from ANALYTICS.DBT_ANAMISI.stg_jaffle_shop__orders
),

payments as (
    select * from ANALYTICS.DBT_ANAMISI.stg_stripe__payments
    where status = 'success'
)

select distinct
    orders.order_id,
    orders.customer_id,
    payments.amount
from
    orders left join payments on orders.order_id = payments.order_id
order by orders.order_id