-- Example dbt analysis: not materialized by dbt.
select
    customer_id,
    sum(total_premium) as total_premium
from {{ ref('customer_policy_summary') }}
group by customer_id
order by total_premium desc
