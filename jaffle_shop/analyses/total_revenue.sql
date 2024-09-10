with payments as (
    select
        sum(amount) as total_revenueamount
    from {{ ref("stg_payments") }}
    where status = 'success'
)

select * from payments