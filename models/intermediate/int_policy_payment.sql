-- ============================================================
-- Intermediate Policy Model
-- ============================================================

-- Select all columns from the staging policy model.
-- The ref() function tells dbt that this model depends on
-- the stg_policy model.
--
-- dbt will automatically build stg_policy before this model.

SELECT *

FROM {{ ref("stg_policy") }}