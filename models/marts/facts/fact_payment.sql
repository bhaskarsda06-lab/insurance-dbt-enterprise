-- ============================================================
-- FACT PAYMENT MODEL
-- ============================================================

{{ config(

    -- Build this model incrementally.
    -- First run: loads all available records.
    -- Later runs: processes only the required new/changed data.
    materialized='incremental',

    -- Unique business key used to identify each payment record.
    unique_key='payment_id',

    -- MERGE strategy is used to insert new records
    -- and update existing records having the same payment_id.
    incremental_strategy='merge',

    -- If new columns are added to the source,
    -- automatically append those columns to the target table.
    on_schema_change='append_new_columns',

    -- Enforce the model's column contract.
    -- The model must follow its defined schema/contract.
    contract={'enforced': true}
) }}


-- ============================================================
-- SELECT AND TRANSFORM PAYMENT DATA
-- ============================================================

select

    -- Unique identifier for each payment.
    payment_id,

    -- Convert payment_amount to DOUBLE
    -- so the target column has a numeric/decimal-compatible type.
    cast(payment_amount as double) as payment_amount,

    -- Convert payment_date to DATE
    -- and remove the time portion if one exists.
    cast(payment_date as date) as payment_date,

    -- Customer associated with the payment.
    customer_id

-- Read payment data from the staging model.
-- ref() creates a dbt dependency on stg_payment.
from {{ ref('stg_payment') }}


-- ============================================================
-- INCREMENTAL PROCESSING
-- ============================================================

{% if is_incremental() %}

-- This block runs only when dbt is executing
-- an incremental run against an existing target table.

where payment_date >= (

    -- Find the latest payment_date already loaded
    -- into the current target table.
    select coalesce(

        -- Get the maximum payment date from the target.
        max(payment_date),

        -- If the target has no payment date,
        -- start processing from 1900-01-01.
        cast('1900-01-01' as date)

    )

    -- {{ this }} refers to the current target model/table.
    from {{ this }}
)

{% endif %}