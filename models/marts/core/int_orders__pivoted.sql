with payments as (
    select * from {{ ref('stg_payments') }}

)

select
    p.order_id,
    {% set payment_methods = ['credit_card','coupon','bank_transfer','gift_card'] %}

    {% for method in payment_methods %}

    sum(case when p.payment_method = '{{ method }}' then p.amount else 0 end) as {{ method }}_amount

    {% if not loop.last %}

    ,

    {% endif %}


    {% endfor %}
from
    payments p

where p.status = 'success'
group by 1
