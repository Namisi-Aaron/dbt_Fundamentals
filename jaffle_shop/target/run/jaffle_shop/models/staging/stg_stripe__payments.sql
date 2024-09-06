
  create or replace   view ANALYTICS.DBT_ANAMISI.stg_stripe__payments
  
   as (
    select
    id as payment_id,
    orderid as order_id,
    paymentmethod as payment_method,
    status,
    amount,
    created as payment_date
from raw.stripe.payment
  );

