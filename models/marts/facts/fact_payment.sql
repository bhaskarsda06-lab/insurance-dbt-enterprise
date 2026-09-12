{{ config(
    materialized='incremental',
    unique_key='payment_id',
    incremental_strategy='merge',
    on_schema_change='sync_all_columns'
) }}
select
    payment_id,
    policy_id,
    payment_amount,
    payment_date,
    payment_status,
    current_timestamp() as dbt_loaded_at
from {{ ref('stg_payment') }}
{% if is_incremental() %}
where payment_date >= (select coalesce(max(payment_date), date('1900-01-01')) from {{ this }})
{% endif %}
