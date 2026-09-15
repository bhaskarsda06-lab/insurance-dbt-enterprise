-- ============================================================
-- DIMENSION CUSTOMER MODEL
-- ============================================================

-- Select all columns from the staging customer model.
-- ref() tells dbt that dim_customer depends on stg_customer.
-- dbt will build stg_customer before building dim_customer.

SELECT *

-- Reference the dbt staging model named stg_customer.
FROM {{ ref("stg_customer") }}