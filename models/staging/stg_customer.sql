-- Select all columns from the Bronze customer source table.
-- source("bronze", "customer") tells dbt:
--   bronze = source name defined in sources.yml
--   customer = source table name
--
-- dbt resolves this to the actual Bronze customer table.

SELECT *
FROM {{ source("bronze", "customer") }}