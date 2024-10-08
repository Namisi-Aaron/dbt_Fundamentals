select
    id as payment_id,
    orderid as order_id,
    paymentmethod as payment_method,
    status,
    {{ cents_to_dollars('amount')}} as amount,
    created as payment_date
from {{ source('stripe', 'payment') }}