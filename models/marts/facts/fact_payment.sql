{{ config(
    materialized='incremental',
    unique_key='payment_id',
    incremental_strategy='merge',
    on_schema_change='append_new_columns',
    contract={'enforced': true}
) }}

select
    payment_id,
    cast(payment_amount as double) as payment_amount,
    cast(payment_date as date) as payment_date,
    customer_id
from {{ ref('stg_payment') }}

{% if is_incremental() %}

where payment_date >= (
    select coalesce(
        max(payment_date),
        cast('1900-01-01' as date)
    )
    from {{ this }}
)

{% endif %}