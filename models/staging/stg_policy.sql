-- Select all columns from the Bronze payment source table.
-- "bronze" is the source name defined in sources.yml.
-- "payment" is the source table name.

SELECT *
FROM {{ source("bronze", "payment") }}