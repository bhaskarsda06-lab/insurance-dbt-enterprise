sql
{{ config(
    materialized='incremental',
    unique_key='payment_id',
    incremental_strategy='merge',
    on_schema_change='append_new_columns',
    contract={
        'enforced': true
    }
) }}

SELECT
    payment_id,
    CAST(payment_amount AS DOUBLE) AS payment_amount,
    CAST(payment_date AS DATE) AS payment_date,
    customer_id,
    CAST(updated_timestamp AS TIMESTAMP) AS updated_timestamp

FROM {{ ref('stg_payment') }}

{% if is_incremental() %}

WHERE updated_timestamp >= (
    SELECT COALESCE(
        MAX(updated_timestamp),
        CAST('1900-01-01' AS TIMESTAMP)
    )
    FROM {{ this }}
)

{% endif %}