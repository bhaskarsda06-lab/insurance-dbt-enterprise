-- ============================================================
-- DIMENSION POLICY MODEL
-- ============================================================

-- Select all columns from the staging policy model.
-- ref() tells dbt that dim_policy depends on stg_policy.
-- dbt will build stg_policy before building dim_policy.

SELECT *

-- Reference the dbt staging model named stg_policy.
FROM {{ ref("stg_policy") }}