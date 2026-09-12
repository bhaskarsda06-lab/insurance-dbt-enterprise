{{ config(materialized='table') }}
select
    customer_id,
    customer_name,
    email,
    city,
    state,
    updated_at
from {{ ref('stg_customer') }}
