{{ config(materialized='view') }}
select
    payment_id,
    policy_id,
    cast(payment_amount as decimal(18,2)) as payment_amount,
    cast(payment_date as date) as payment_date,
    payment_status
from {{ source('bronze', 'payment') }}
