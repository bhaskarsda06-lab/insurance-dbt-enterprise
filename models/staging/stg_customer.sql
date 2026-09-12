{{ config(materialized='view') }}
select
    customer_id,
    {{ clean_string('customer_name') }} as customer_name,
    lower(trim(email)) as email,
    city,
    state,
    cast(updated_at as timestamp) as updated_at
from {{ source('bronze', 'customer') }}
