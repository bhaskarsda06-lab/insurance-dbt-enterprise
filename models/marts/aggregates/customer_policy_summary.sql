{{ config(materialized='table') }}
select
    c.customer_id,
    c.customer_name,
    count(distinct p.policy_id) as policy_count,
    coalesce(sum(p.premium), 0) as total_premium,
    coalesce(sum(x.total_paid), 0) as total_paid
from {{ ref('dim_customer') }} c
left join {{ ref('dim_policy') }} p
  on c.customer_id = p.customer_id
left join {{ ref('int_policy_payment') }} x
  on p.policy_id = x.policy_id
group by c.customer_id, c.customer_name
