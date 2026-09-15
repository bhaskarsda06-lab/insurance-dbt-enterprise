-- ============================================================
-- CUSTOMER POLICY SUMMARY
-- ============================================================

-- Select the customer ID.
-- This identifies which customer the policies belong to.
SELECT
    customer_id,

    -- Count the number of records for each customer.
    -- The result is stored as total_policies.
    count(*) AS total_policies

-- Read data from the intermediate policy/payment model.
-- ref() tells dbt that this model depends on int_policy_payment.
FROM {{ ref("int_policy_payment") }}

-- Group records by customer.
-- This produces one summary row for each customer.
GROUP BY customer_id