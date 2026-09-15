-- Select all columns from the Bronze policy source table.
-- "bronze" is the source name defined in sources.yml.
-- "policy" is the source table name.

SELECT *
FROM {{ source("bronze", "policy") }}