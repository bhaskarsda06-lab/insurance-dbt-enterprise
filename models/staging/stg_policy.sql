{{ config(materialized='view') }}
select
    policy_id,
    customer_id,
    policy_number,
    policy_status,
    cast(premium as decimal(18,2)) as premium,
    cast(effective_date as date) as effective_date,
    cast(expiration_date as date) as expiration_date
from {{ source('bronze', 'policy') }}
