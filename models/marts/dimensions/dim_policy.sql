{{ config(materialized='table') }}
select
    policy_id,
    customer_id,
    policy_number,
    policy_status,
    premium,
    effective_date,
    expiration_date
from {{ ref('stg_policy') }}
