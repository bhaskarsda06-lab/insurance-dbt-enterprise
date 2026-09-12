{{ config(materialized='ephemeral') }}
select
    p.policy_id,
    p.customer_id,
    p.policy_status,
    p.premium,
    coalesce(sum(case when pay.payment_status = 'PAID' then pay.payment_amount else 0 end), 0) as total_paid
from {{ ref('stg_policy') }} p
left join {{ ref('stg_payment') }} pay
  on p.policy_id = pay.policy_id
group by
    p.policy_id, p.customer_id, p.policy_status, p.premium
